//
//  UIScreen+BEKit.m
//  BEKit
//
//  Created by sundanlong on 16/4/11.
//
//

#import "UIScreen+BEKit.h"

@implementation UIScreen (BEKit)

+ (BOOL)isRetina {
    if ([[UIScreen mainScreen] respondsToSelector:@selector(displayLinkWithTarget:selector:)] && ([UIScreen mainScreen].scale == 2.0 || [UIScreen mainScreen].scale == 3.0)) {
        return YES;
    } else {
        return NO;
    }
}

+ (BOOL)isRetinaHD {
    if ([[UIScreen mainScreen] respondsToSelector:@selector(displayLinkWithTarget:selector:)] && ([UIScreen mainScreen].scale == 3.0)) {
        return YES;
    } else {
        return NO;
    }
}

- (CGSize)fixedScreenSize {
    CGSize screenSize = self.bounds.size;
    
    if ((NSFoundationVersionNumber <= NSFoundationVersionNumber_iOS_7_1) && UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation)) {
        return CGSizeMake(screenSize.height, screenSize.width);
    }
    
    return screenSize;
}

+ (CGFloat)brightness {
    return [UIScreen mainScreen].brightness;
}

+ (void)setBrightness:(CGFloat)brightness {
    [[UIScreen mainScreen] setBrightness:brightness];
}

@end
