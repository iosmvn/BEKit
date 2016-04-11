//
//  UIWebView+BEKit.h
//  BEKit
//
//  Created by sundanlong on 16/4/11.
//
//

@import Foundation;
@import UIKit;

/**
 *  This category adds some useful methods to UIWebView
 */
@interface UIWebView (BEKit)

/**
 *  Remove the background shadow of the UIWebView
 */
- (void)removeBackgroundShadow;

/**
 *  Load the requested website
 *
 *  @param website Website to load
 */
- (void)loadWebsite:(NSString * _Nonnull)website;

@end
