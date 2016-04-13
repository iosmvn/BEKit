//
//  UIButton+BEKit.h
//  BEKit
//
//  Created by sundanlong on 16/4/11.
//
//

@import Foundation;
@import UIKit;

@interface UIButton (BEKit)

+ (instancetype _Nonnull)be_initWithFrame:(CGRect)frame;
+ (instancetype _Nonnull)be_initWithFrame:(CGRect)frame title:(NSString * _Nullable)title;
+ (instancetype _Nonnull)be_initWithFrame:(CGRect)frame title:(NSString * _Nullable)title backgroundImage:(UIImage * _Nullable)backgroundImage;

+ (instancetype _Nonnull)be_initWithFrame:(CGRect)frame title:(NSString * _Nonnull)title color:(UIColor * _Nonnull)color;
+ (instancetype _Nonnull)be_initWithFrame:(CGRect)frame title:(NSString * _Nonnull)title color:(UIColor * _Nonnull)color highlightedColor:(UIColor * _Nonnull)highlightedColor;

+ (instancetype _Nonnull)be_initWithFrame:(CGRect)frame color:(UIColor * _Nonnull)color;
+ (instancetype _Nonnull)be_initWithFrame:(CGRect)frame color:(UIColor * _Nonnull)color highlightedColor:(UIColor * _Nonnull)highlightedColor;

+ (instancetype _Nonnull)be_initWithFrame:(CGRect)frame title:(NSString * _Nullable)title backgroundImage:(UIImage * _Nullable)backgroundImage highlightedBackgroundImage:(UIImage * _Nullable)highlightedBackgroundImage;

+ (instancetype _Nonnull)be_initWithFrame:(CGRect)frame image:(UIImage * _Nonnull)image;
+ (instancetype _Nonnull)be_initWithFrame:(CGRect)frame image:(UIImage * _Nonnull)image highlightedImage:(UIImage * _Nullable)highlightedImage;

- (void)be_setTitleColor:(UIColor * _Nonnull)color;
- (void)be_setTitleColor:(UIColor * _Nonnull)color highlightedColor:(UIColor * _Nullable)highlightedColor;

@end
