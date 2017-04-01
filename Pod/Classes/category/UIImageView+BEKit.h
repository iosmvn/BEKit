//
//  UIImageView+BEKit.h
//  BEKit
//
//  Created by sundanlong on 16/4/11.
//
//

@import Foundation;
@import UIKit;
@import QuartzCore;

@interface UIImageView (BEKit)

+ (instancetype _Nonnull)be_initWithImage:(UIImage * _Nonnull)image
                                 frame:(CGRect)rect;

+ (instancetype _Nonnull)be_initWithImage:(UIImage * _Nonnull)image
                                  size:(CGSize)size
                                center:(CGPoint)center;

+ (instancetype _Nonnull)be_initWithImage:(UIImage * _Nonnull)image
                                center:(CGPoint)center;

+ (instancetype _Nonnull)be_initWithImageAsTemplate:(UIImage * _Nonnull)image
                                       tintColor:(UIColor * _Nonnull)tintColor;

- (void)be_setImageShadowColor:(UIColor * _Nonnull)color
                        radius:(CGFloat)radius
                        offset:(CGSize)offset
                        opacity:(CGFloat)opacity;

- (void)be_setMaskImage:(UIImage * _Nonnull)image;

//- (void)be_setImgPath:(NSString * _Nonnull)imgPath placeholderImg:(UIImage * _Nonnull)img;

@end
