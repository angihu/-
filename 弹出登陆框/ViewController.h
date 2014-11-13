//
//  ViewController.h
//  弹出登陆框
//
//  Created by Winson on 14/11/12.
//  Copyright (c) 2014年 Fangdr. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *blurView;//毛玻璃遮罩层

@property (weak, nonatomic) IBOutlet UIView *outView;//弹出框

@property (weak, nonatomic) IBOutlet UIImageView *headerIMGView;//头像

@property (weak, nonatomic) IBOutlet UIView *closeBtn;//关闭按钮
@property (weak, nonatomic) IBOutlet UITextField *username;

@property (weak, nonatomic) IBOutlet UIImageView *blackBackView;//内层黑色半透明view
@property (weak, nonatomic) IBOutlet UIImageView *logpswBlackView;//用户名密码的背景View


@property (weak, nonatomic) IBOutlet UITextField *userTF;//用户名

@property (weak, nonatomic) IBOutlet UITextField *pswTF;//密码

@property (weak, nonatomic) IBOutlet UIButton *registerBtn;//注册按钮

@property (weak, nonatomic) IBOutlet UIButton *logonBtn;//弹出框登录按钮




@property (weak, nonatomic) IBOutlet UIButton *logBtn;//主界面登录按钮



@property (weak, nonatomic) IBOutlet UITextField *aaassss;





@end

