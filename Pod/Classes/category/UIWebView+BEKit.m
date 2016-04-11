//
//  UIWebView+BEKit.m
//  BEKit
//
//  Created by sundanlong on 16/4/11.
//
//

#import "UIWebView+BEKit.h"

@implementation UIWebView (BEKit)

- (void)removeBackgroundShadow {
    for (UIView *eachSubview in [self.scrollView subviews]) {
        if ([eachSubview isKindOfClass:[UIImageView class]] && eachSubview.frame.origin.x <= 500) {
            eachSubview.hidden = YES;
            [eachSubview removeFromSuperview];
        }
    }
}

- (void)loadWebsite:(NSString * _Nonnull)website {
    [self loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:website]]];
}

@end
