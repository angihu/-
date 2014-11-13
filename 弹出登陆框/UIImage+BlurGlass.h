//
//  UIImage+BlurGlass.h
//  毛玻璃Demo
//
//  Created by Winson on 14/10/27.
//  Copyright (c) 2014年 angihu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (BlurGlass)

// 2.封装好,供外界调用的(level取值范围：0-6.8)
- (UIImage *)imgWithBlurWithBlurLevel:(CGFloat)level;

- (UIImage *)imgWithLightAlpha:(CGFloat)alpha radius:(CGFloat)radius colorSaturationFactor:(CGFloat)colorSaturationFactor;

- (UIImage *)imgBluredWithRadius:(CGFloat)blurRadius tintColor:(UIColor *)tintColor saturationDeltaFactor:(CGFloat)saturationDeltaFactor maskImage:(UIImage *)maskImage;



@end
