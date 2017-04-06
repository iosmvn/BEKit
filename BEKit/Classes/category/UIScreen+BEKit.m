//
//  UIScreen+BEKit.m
//  BEKit
//
//  Created by sundanlong on 16/4/11.
//
//

#import "UIScreen+BEKit.h"

@implementation UIScreen (BEKit)

+ (BOOL)be_isRetina {
    if ([[UIScreen mainScreen] respondsToSelector:@selector(displayLinkWithTarget:selector:)] && ([UIScreen mainScreen].scale == 2.0 || [UIScreen mainScreen].scale == 3.0)) {
        return YES;
    } else {
        return NO;
    }
}

+ (BOOL)be_isRetinaHD {
    if ([[UIScreen mainScreen] respondsToSelector:@selector(displayLinkWithTarget:selector:)] && ([UIScreen mainScreen].scale == 3.0)) {
        return YES;
    } else {
        return NO;
    }
}

- (CGSize)be_fixedScreenSize {
    CGSize screenSize = self.bounds.size;
    
    if ((NSFoundationVersionNumber <= NSFoundationVersionNumber_iOS_7_1) && UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation)) {
        return CGSizeMake(screenSize.height, screenSize.width);
    }
    
    return screenSize;
}

+ (CGFloat)be_brightness {
    return [UIScreen mainScreen].brightness;
}

+ (void)be_setBrightness:(CGFloat)brightness {
    [[UIScreen mainScreen] setBrightness:brightness];
}

@end
