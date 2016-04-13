//
//  UIButton+BEKit.m
//  BEKit
//
//  Created by sundanlong on 16/4/11.
//
//

#import "UIButton+BEKit.h"
#import "UIImage+BEKit.h"
#import "UIColor+BEKit.h"

@implementation UIButton (BEKit)

+ (instancetype _Nonnull)be_initWithFrame:(CGRect)frame {
    return [UIButton be_initWithFrame:frame title:nil];
}

+ (instancetype _Nonnull)be_initWithFrame:(CGRect)frame title:(NSString * _Nullable)title {
    return [UIButton be_initWithFrame:frame title:title backgroundImage:nil];
}

+ (instancetype _Nonnull )be_initWithFrame:(CGRect)frame title:(NSString * _Nullable)title backgroundImage:(UIImage * _Nullable)backgroundImage {
    return [UIButton be_initWithFrame:frame title:title backgroundImage:backgroundImage highlightedBackgroundImage:nil];
}

+ (instancetype _Nonnull)be_initWithFrame:(CGRect)frame title:(NSString * _Nonnull)title color:(UIColor * _Nonnull)color {
    const CGFloat *components = CGColorGetComponents(color.CGColor);
    return [UIButton be_initWithFrame:frame title:title backgroundImage:[UIImage be_imageWithColor:color] highlightedBackgroundImage:[UIImage be_imageWithColor:[UIColor colorWithRed:components[0]-0.1 green:components[1]-0.1 blue:components[2]-0.1 alpha:1]]];
}

+ (instancetype _Nonnull)be_initWithFrame:(CGRect)frame title:(NSString * _Nonnull)title color:(UIColor * _Nonnull)color highlightedColor:(UIColor * _Nonnull)highlightedColor {
    return [UIButton be_initWithFrame:frame title:title backgroundImage:[UIImage be_imageWithColor:color] highlightedBackgroundImage:[UIImage be_imageWithColor:highlightedColor]];
}

+ (instancetype _Nonnull)be_initWithFrame:(CGRect)frame color:(UIColor * _Nonnull)color {
    const CGFloat *components = CGColorGetComponents(color.CGColor);
    return [UIButton be_initWithFrame:frame title:nil backgroundImage:[UIImage be_imageWithColor:color] highlightedBackgroundImage:[UIImage be_imageWithColor:[UIColor colorWithRed:components[0]-0.1 green:components[1]-0.1 blue:components[2]-0.1 alpha:1]]];
}

+ (instancetype _Nonnull)be_initWithFrame:(CGRect)frame color:(UIColor * _Nonnull)color highlightedColor:(UIColor * _Nonnull)highlightedColor {
    return [UIButton be_initWithFrame:frame title:nil backgroundImage:[UIImage be_imageWithColor:color] highlightedBackgroundImage:[UIImage be_imageWithColor:highlightedColor]];
}

+ (instancetype _Nonnull)be_initWithFrame:(CGRect)frame title:(NSString * _Nullable)title backgroundImage:(UIImage * _Nullable)backgroundImage highlightedBackgroundImage:(UIImage * _Nullable)highlightedBackgroundImage {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:frame];
    [button setTitle:title forState:UIControlStateNormal];
    [button setBackgroundImage:backgroundImage forState:UIControlStateNormal];
    [button setBackgroundImage:highlightedBackgroundImage forState:UIControlStateHighlighted];
    
    return button;
}

+ (instancetype _Nonnull)be_initWithFrame:(CGRect)frame image:(UIImage * _Nonnull)image {
    return [UIButton be_initWithFrame:frame image:image highlightedImage:nil];
}

+ (instancetype _Nonnull)be_initWithFrame:(CGRect)frame image:(UIImage * _Nonnull)image highlightedImage:(UIImage * _Nullable)highlightedImage {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:frame];
    [button setImage:image forState:UIControlStateNormal];
    [button setImage:highlightedImage forState:UIControlStateHighlighted];
    
    return button;
}

- (void)be_setTitleColor:(UIColor * _Nonnull)color {
    [self be_setTitleColor:color highlightedColor:[color colorWithAlphaComponent:0.4]];
}

- (void)be_setTitleColor:(UIColor * _Nonnull)color highlightedColor:(UIColor * _Nullable)highlightedColor {
    [self setTitleColor:color forState:UIControlStateNormal];
    [self setTitleColor:highlightedColor forState:UIControlStateHighlighted];
}

@end
