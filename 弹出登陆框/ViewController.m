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
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
    self.outView.frame = CGRectMake(0, 568, 320, 320);
    [self.view addSubview:self.outView];
    //圆角黑色背景
    self.blackBackView.layer.cornerRadius=10.0;
    
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
    
    
    //常见毛玻璃
    UIImage *originIMG=[ScreenShot screenShotWithShotView:self.view];
    UIImage *blurIMG=[originIMG imgWithBlurWithBlurLevel:0.5];
    self.blurView.image=blurIMG;

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
    self.outView.frame = CGRectMake(0, screenHeight-keyboardSize.height-self.outView.frame.size.height, 320, 320);
    [UIView commitAnimations];
    
    
}

//键盘将要消失
-(void)keyBoardWillHide:(NSNotification *)notification
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.25];
    self.outView.center=self.view.center;
    [UIView commitAnimations];
}

//登录按钮
- (IBAction)doLogonBtn:(UIButton *)sender {
    
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    self.blurView.alpha=1;
    self.outView.center=self.view.center;
//    self.outView.center=CGPointMake(160, 200);
    
    
//    self.aaassss.frame=CGRectMake(150, 150, 130, 40);
    
    [UIView commitAnimations];
}

- (IBAction)doCloseBtn:(UIButton *)sender {
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    self.blurView.alpha=0;
    self.outView.frame = CGRectMake(0, 568, 320, 320);
    
    [UIView commitAnimations];

    
    
    
    
}

- (IBAction)tap:(UITapGestureRecognizer *)sender {
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    self.blurView.alpha=0;
    self.outView.frame = CGRectMake(0, 568, 320, 320);
    
    [UIView commitAnimations];
    
}







-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
    
    UITouch *touch=[touches anyObject];
    if (touch.view==self.blackBackView) {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.25];
        self.outView.center=self.view.center;
        [UIView commitAnimations];
    }
    
    
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
