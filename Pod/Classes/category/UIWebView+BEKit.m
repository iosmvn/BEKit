//
//  UIWebView+BEKit.m
//  BEKit
//
//  Created by sundanlong on 16/4/11.
//
//

#import "UIWebView+BEKit.h"

@implementation UIWebView (BEKit)

- (void)be_loadWebsite:(NSString * _Nonnull)website {
    [self loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:website]]];
}

@end
