//
//  UINavigationBar+BEKit.m
//  BEKit
//
//  Created by dalong on 16/4/11.
//
//

#import "UINavigationBar+BEKit.h"

@implementation UINavigationBar (BEKit)

- (void)be_setTransparent:(BOOL)transparent {
    [self be_setTransparent:transparent translucent:YES];
}

- (void)be_setTransparent:(BOOL)transparent translucent:(BOOL)translucent {
    if (transparent) {
        [self setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        self.shadowImage = [UIImage new];
        self.translucent = translucent;
    } else {
        [self setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
        self.shadowImage = nil;
        self.translucent = translucent;
    }
}

@end
