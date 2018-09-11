//
//  UIView+BEKit.h
//  BEKit
//
//  Created by sundanlong on 16/4/11.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

/**
 *  Direction of flip animation
 */
typedef NS_ENUM(NSInteger, UIViewAnimationFlipDirection) {
    /**
     *  Flip animation from top
     */
    UIViewAnimationFlipDirectionFromTop = 0,
    /**
     *  Flip animation from left
     */
    UIViewAnimationFlipDirectionFromLeft,
    /**
     *  Flip animation from right
     */
    UIViewAnimationFlipDirectionFromRight,
    /**
     *  Flip animation from bottom
     */
    UIViewAnimationFlipDirectionFromBottom
};

/**
 *  Direction of the translation
 */
typedef NS_ENUM(NSInteger, UIViewAnimationTranslationDirection) {
    /**
     *  Translation from left to right
     */
    UIViewAnimationTranslationDirectionFromLeftToRight = 0,
    /**
     *  Translation from right to left
     */
    UIViewAnimationTranslationDirectionFromRightToLeft
};

/**
 *  Direction of the linear gradient
 */
typedef NS_ENUM(NSInteger, UIViewLinearGradientDirection) {
    /**
     *  Linear gradient vertical
     */
    UIViewLinearGradientDirectionVertical = 0,
    /**
     *  Linear gradient horizontal
     */
    UIViewLinearGradientDirectionHorizontal,
    /**
     *  Linear gradient from left to right and top to down
     */
    UIViewLinearGradientDirectionDiagonalFromLeftToRightAndTopToDown,
    /**
     *  Linear gradient from left to right and down to top
     */
    UIViewLinearGradientDirectionDiagonalFromLeftToRightAndDownToTop,
    /**
     *  Linear gradient from right to left and top to down
     */
    UIViewLinearGradientDirectionDiagonalFromRightToLeftAndTopToDown,
    /**
     *  Linear gradient from right to left and down to top
     */
    UIViewLinearGradientDirectionDiagonalFromRightToLeftAndDownToTop
};

@interface UIView (BEKit)

+ (instancetype _Nonnull)be_initWithFrame:(CGRect)frame
                   backgroundColor:(UIColor * _Nonnull)backgroundColor;

- (void)be_createBordersWithColor:(UIColor * _Nonnull)color
                withCornerRadius:(CGFloat)radius
                        andWidth:(CGFloat)width;

- (void)be_removeBorders;

- (void)be_createRectShadowWithOffset:(CGSize)offset
                           opacity:(CGFloat)opacity
                            radius:(CGFloat)radius;

- (void)be_createCornerRadiusShadowWithCornerRadius:(CGFloat)cornerRadius
                                          offset:(CGSize)offset
                                         opacity:(CGFloat)opacity
                                          radius:(CGFloat)radius;

- (void)be_removeShadow;

- (void)be_setCornerRadius:(CGFloat)radius;

- (void)be_createGradientWithColors:(NSArray * _Nonnull)colors
                       direction:(UIViewLinearGradientDirection)direction;

- (void)be_shakeView;

- (void)be_pulseViewWithDuration:(CGFloat)duration;

- (void)be_heartbeatViewWithDuration:(CGFloat)duration;

- (void)be_applyMotionEffects;

- (void)be_flipWithDuration:(NSTimeInterval)duration
               direction:(UIViewAnimationFlipDirection)direction;

- (void)be_translateAroundTheView:(UIView * _Nonnull)topView
                        duration:(CGFloat)duration
                        direction:(UIViewAnimationTranslationDirection)direction
                            repeat:(BOOL)repeat
                    startFromEdge:(BOOL)startFromEdge;

- (UIImage * _Nonnull)be_screenshot;

- (UIImage * _Nonnull)be_saveScreenshot;

- (void)be_removeAllSubviews;

@end
