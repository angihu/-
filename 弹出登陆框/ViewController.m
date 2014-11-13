//
//  ViewController.m
//  弹出登陆框
//
//  Created by Winson on 14/11/12.
//  Copyright (c) 2014年 Fangdr. All rights reserved.
//

#import "ViewController.h"
#import "ScreenShot.h"
#import "UIImage+BlurGlass.h"



@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.username.autocorrectionType = UITextAutocorrectionTypeNo;
    
    //监听键盘弹出，改变登录窗口的位置
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardWillAppear:) name:UIKeyboardWillShowNotification
                                               object:nil];
    //监听键盘将要消失的事件，隐藏登录窗口
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
    //加载登录窗口
    self.outView.frame = CGRectMake(0, 568, 320, 260);
    [self.view addSubview:self.outView];
    
    //控件的圆角设置
    {
    //圆角黑色背景
    self.blackBackView.layer.cornerRadius=10.0;
        self.blackBackView.layer.masksToBounds=YES;
    
    //圆角头像
    self.headerIMGView.layer.cornerRadius=50.0;
    self.headerIMGView.layer.borderWidth=4.0;
    self.headerIMGView.layer.borderColor=[UIColor whiteColor].CGColor;
    self.headerIMGView.layer.masksToBounds=YES;
    
    //主界面登录按钮
    self.logBtn.layer.cornerRadius=5.0;
    
    //用户名密码框背景View
    self.logpswBlackView.layer.cornerRadius=5.0;
    self.logpswBlackView.layer.masksToBounds=YES;
    
    //注册登录按钮
    self.registerBtn.layer.cornerRadius=5.0;
    self.logonBtn.layer.cornerRadius=5.0;
    self.registerBtn.layer.masksToBounds=YES;
    self.logonBtn.layer.masksToBounds=YES;
    
    }
    
    //创建毛玻璃
    UIImage *originIMG=[ScreenShot screenShotWithShotView:self.view];
    UIImage *blurIMG=[originIMG imgWithBlurWithBlurLevel:0.5];
    self.blurView.image=blurIMG;
    
    //设置头像
//    UIImage *headerO=[ScreenShot getImageFromImge:originIMG withRect:CGRectMake(150, 150, 100, 100)];
//    self.headerIMGView.image=headerO;

}

//键盘将要弹出
-(void)keyBoardWillAppear:(NSNotification *)notification
{
    NSLog(@"notification:%@",notification);
    
    //获取起始frame
    NSValue *aValue=[notification.userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey];
    CGRect keyboardRect=[aValue CGRectValue];
    CGSize keyboardSize=keyboardRect.size;
    NSLog(@"keyboardHeight=%.f",keyboardSize.height);
    
    //获取屏幕高度
    CGFloat screenHeight=[UIScreen mainScreen].bounds.size.height;
    NSLog(@"screenHeight=%.f",screenHeight);
    
    //动态调整登录窗口位置
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.25];
    self.outView.frame = CGRectMake(0, screenHeight-keyboardSize.height-self.outView.frame.size.height, 320, 260);
    [self setLogBackBlurImage];
    
    [UIView commitAnimations];
}

//键盘将要消失
-(void)keyBoardWillHide:(NSNotification *)notification
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.25];
    self.outView.center=self.view.center;
    [self setLogBackBlurImage];
    [UIView commitAnimations];
}

//登录按钮
- (IBAction)doLogonBtn:(UIButton *)sender {

    NSLog(@"x=%.f,y=%.f,w=%.f,h=%.f",self.blackBackView.frame.origin.x,self.blackBackView.frame.origin.y,self.blackBackView.frame.size.width,self.blackBackView.frame.size.height);
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    self.blurView.alpha=1;//显示毛玻璃背景
    self.outView.center=self.view.center;
    [self setLogBackBlurImage];
    [UIView commitAnimations];
}

//关闭按钮
- (IBAction)doCloseBtn:(UIButton *)sender {
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    self.blurView.alpha=0;//隐藏毛玻璃背景
    self.outView.frame = CGRectMake(0, 568, 320, 260);
    [UIView commitAnimations];
}

//点击毛玻璃背景关闭登录窗口
- (IBAction)tap:(UITapGestureRecognizer *)sender {
    [self doCloseBtn:nil];
}

//点击屏幕任意一点
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
    
    UITouch *touch=[touches anyObject];
    if (touch.view==self.blackBackView) {
        [self keyBoardWillHide:nil];
        [self setLogBackBlurImage];
    }
}

//截取屏幕，处理图片，把处理好的毛玻璃图片给登录窗口背景
-(void)setLogBackBlurImage
{
    //为了不截取到登录窗口，先隐藏它在截图
    self.outView.hidden=YES;
    UIImage *originIMG=[ScreenShot screenShotWithShotView:self.view];
    self.outView.hidden=NO;
    
    CGPoint outViewPoint=self.outView.frame.origin;
    CGPoint blackPoint=self.blackBackView.frame.origin;
    
    CGPoint newBlackPoint=CGPointMake(outViewPoint.x+blackPoint.x, outViewPoint.y+blackPoint.y);
    
    CGSize blackSize=self.blackBackView.frame.size;
    
    CGRect tmpRect = CGRectMake(newBlackPoint.x, newBlackPoint.y, blackSize.width, blackSize.height);
    
    UIImage *blackBackImage=[ScreenShot getImageFromImge:originIMG withRect:tmpRect];
    UIImage *blurBlackBack=[blackBackImage imgWithBlurWithBlurLevel:1.2];
//    self.blackBackView.image=blurBlackBack;
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.25];
    self.blackBackView.image=blurBlackBack;
    [UIView commitAnimations];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
