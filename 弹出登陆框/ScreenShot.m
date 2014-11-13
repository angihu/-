//
//  ScreenShot.m
//  毛玻璃Demo
//
//  Created by Winson on 14/10/27.
//  Copyright (c) 2014年 angihu. All rights reserved.
//

#import "ScreenShot.h"

@implementation ScreenShot

//截取给定的view
+(UIImage *)screenShotWithShotView:(UIView *)shotView
{
    UIGraphicsBeginImageContext(shotView.frame.size);//当前的view
    [shotView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *viewImage=UIGraphicsGetImageFromCurrentImageContext();
    
    NSLog(@"viewImageSize=(%.2f,%.2f)",viewImage.size.width,viewImage.size.height);
    UIGraphicsEndImageContext();
    return viewImage;
}

//根据给定的图片，截取指定的区域
+(UIImage *)getImageFromImge:(UIImage *)image withRect:(CGRect)rect
{
    
    CGImageRef imageRef=image.CGImage;
    CGImageRef subImageRef=CGImageCreateWithImageInRect(imageRef, rect);
    
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context=UIGraphicsGetCurrentContext();
    CGContextDrawImage(context, rect, subImageRef);
    UIImage *finalImage=[UIImage imageWithCGImage:subImageRef];
    UIGraphicsEndImageContext();
    
    return finalImage;
}

@end
