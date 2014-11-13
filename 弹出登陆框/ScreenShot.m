//
//  ScreenShot.m
//  毛玻璃Demo
//
//  Created by Winson on 14/10/27.
//  Copyright (c) 2014年 angihu. All rights reserved.
//

#import "ScreenShot.h"

@implementation ScreenShot
+(UIImage *)screenShotWithShotView:(UIView *)shotView
{
    UIGraphicsBeginImageContext(shotView.frame.size);//当前的view
    [shotView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *viewImage=UIGraphicsGetImageFromCurrentImageContext();
    
    NSLog(@"viewImageSize=(%.2f,%.2f)",viewImage.size.width,viewImage.size.height);
    UIGraphicsEndImageContext();
    return viewImage;
}
@end
