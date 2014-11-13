//
//  ScreenShot.h
//  毛玻璃Demo
//
//  Created by Winson on 14/10/27.
//  Copyright (c) 2014年 angihu. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface ScreenShot : NSObject

//截取指定的View
+(UIImage *)screenShotWithShotView:(UIView *)shotView;

//根据指定的图片截取指定的区域
+(UIImage *)getImageFromImge:(UIImage *)image withRect:(CGRect)rect;

@end
