//
//  UIImageView+BEKit.m
//  BEKit
//
//  Created by sundanlong on 16/4/11.
//
//

#import "UIImageView+BEKit.h"
#import "NSString+BEKit.h"
//#import <SDWebImage/UIImageView+WebCache.h>

@implementation UIImageView (BEKit)

+ (instancetype _Nonnull)be_initWithImage:(UIImage * _Nonnull)image frame:(CGRect)rect {
    UIImageView *_image = [[UIImageView alloc] init];
    [_image setFrame:rect];
    [_image setImage:image];
    return _image;
}

+ (instancetype _Nonnull)be_initWithImage:(UIImage * _Nonnull)image size:(CGSize)size center:(CGPoint)center {
    UIImageView *_image = [[UIImageView alloc] init];
    [_image setFrame:CGRectMake(0, 0, size.width, size.height)];
    [_image setImage:image];
    [_image setCenter:center];
    return _image;
}

+ (instancetype _Nonnull)be_initWithImage:(UIImage * _Nonnull)image center:(CGPoint)center {
    UIImageView *_image = [[UIImageView alloc] init];
    [_image setFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
    [_image setImage:image];
    [_image setCenter:center];
    return _image;
}

+ (instancetype _Nonnull)be_initWithImageAsTemplate:(UIImage * _Nonnull)image tintColor:(UIColor * _Nonnull)tintColor {
    UIImageView *_image = [[UIImageView alloc] init];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    [_image setImage:image];
    [_image setTintColor:tintColor];
    return _image;
}

- (void)be_setImageShadowColor:(UIColor * _Nonnull)color radius:(CGFloat)radius offset:(CGSize)offset opacity:(CGFloat)opacity {
    self.layer.shadowColor = color.CGColor;
    self.layer.shadowRadius = radius;
    self.layer.shadowOffset = offset;
    self.layer.shadowOpacity = opacity;
    self.clipsToBounds = NO;
}

- (void)be_setMaskImage:(UIImage * _Nonnull)image {
    CALayer *mask = [CALayer layer];
    mask.contents = (id)[image CGImage];
    mask.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    self.layer.mask = mask;
    self.layer.masksToBounds = YES;
}

//- (void)be_setImgPath:(NSString *)imgPath placeholderImg:(UIImage *)img {
//    if ([imgPath be_isValidString]) {
//        NSURL *imgURL = nil;
//        if ([imgPath be_isValidHttpURL]) {
//            imgURL = [NSURL URLWithString:imgPath];
//        } else {
//            imgURL = [NSURL fileURLWithPath:imgPath];
//        }
//        [self sd_setImageWithURL:imgURL placeholderImage:img];
//    } else {
//        self.image = img;
//    }
//}

@end
