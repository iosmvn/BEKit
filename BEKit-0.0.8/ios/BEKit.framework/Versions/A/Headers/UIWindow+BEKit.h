//
//  UIWindow+BEKit.h
//  BEKit
//
//  Created by sundanlong on 16/4/11.
//
//

@import Foundation;
@import UIKit;

#define BEShowTouchOnScreen [UIApplication.sharedApplication.keyWindow activateTouch]

#define BEHideTouchOnScreen [UIApplication.sharedApplication.keyWindow deactivateTouch]

@interface UIWindow (BEKit)

- (UIImage * _Nonnull)be_takeScreenshot;

- (UIImage * _Nonnull)be_takeScreenshotAndSave:(BOOL)save;

- (void)be_takeScreenshotWithDelay:(CGFloat)delay save:(BOOL)save completion:(void (^ _Nullable)(UIImage * _Nonnull screenshot))completion;

@end
