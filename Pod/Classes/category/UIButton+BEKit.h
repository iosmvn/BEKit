//
//  UIButton+BEKit.h
//  BEKit
//
//  Created by sundanlong on 16/4/11.
//
//

@import Foundation;
@import UIKit;

#import "UIFont+BEKit.h"

/**
 *  This category adds some useful methods to UIButton
 */
@interface UIButton (BEKit)

/**
 *  Create an UIButton in a frame
 *
 *  @param frame Button's frame
 *
 *  @return Returns the UIButton instance
 */
+ (instancetype _Nonnull)initWithFrame:(CGRect)frame;

/**
 *  Create an UIButton in a frame with a title and a clear color
 *
 *  @param frame Button's frame
 *  @param title Button's title, the title color will be white
 *
 *  @return Returns the UIButton instance
 */
+ (instancetype _Nonnull)initWithFrame:(CGRect)frame
                                 title:(NSString * _Nullable)title;

/**
 *  Create an UIButton in a frame with a title and a background image
 *
 *  @param frame           Button's frame
 *  @param title           Button's title
 *  @param backgroundImage Button's background image
 *
 *  @return Returns the UIButton instance
 */
+ (instancetype _Nonnull)initWithFrame:(CGRect)frame
                                 title:(NSString * _Nullable)title
                       backgroundImage:(UIImage * _Nullable)backgroundImage;

/**
 *  Create an UIButton in a frame with a title, a background image and highlighted background image
 *
 *  @param frame                      Button's frame
 *  @param title                      Button's title
 *  @param backgroundImage            Button's background image
 *  @param highlightedBackgroundImage Button's highlighted background image
 *
 *  @return Returns the UIButton instance
 */
+ (instancetype _Nonnull)initWithFrame:(CGRect)frame
                                 title:(NSString * _Nullable)title
                       backgroundImage:(UIImage * _Nullable)backgroundImage
            highlightedBackgroundImage:(UIImage * _Nullable)highlightedBackgroundImage;

/**
 *  Create an UIButton in a frame with a title and a color
 *
 *  @param frame Button's frame
 *  @param title Button's title
 *  @param color Button's color, the highlighted color will be automatically created
 *
 *  @return Returns the UIButton instance
 */
+ (instancetype _Nonnull)initWithFrame:(CGRect)frame
                                 title:(NSString * _Nonnull)title
                                 color:(UIColor * _Nonnull)color;

/**
 *  Create an UIButton in a frame with a title, a color and highlighted color
 *
 *  @param frame            Button's frame
 *  @param title            Button's title
 *  @param color            Button's color
 *  @param highlightedColor Button's highlighted color
 *
 *  @return Returns the UIButton instance
 */
+ (instancetype _Nonnull)initWithFrame:(CGRect)frame
                                 title:(NSString * _Nonnull)title
                                 color:(UIColor * _Nonnull)color
                      highlightedColor:(UIColor * _Nonnull)highlightedColor;

/**
 *  Create an UIButton in a frame with a color
 *
 *  @param frame Button's frame
 *  @param color Button's color, the highlighted color will be automatically created
 *
 *  @return Returns the UIButton instance
 */
+ (instancetype _Nonnull)initWithFrame:(CGRect)frame
                                 color:(UIColor * _Nonnull)color;

/**
 *  Create an UIButton in a frame with a color and highlighted color
 *
 *  @param frame            Button's frame
 *  @param color            Button's color
 *  @param highlightedColor Button's highlighted color
 *
 *  @return Returns the UIButton instance
 */
+ (instancetype _Nonnull)initWithFrame:(CGRect)frame
                                 color:(UIColor * _Nonnull)color
                      highlightedColor:(UIColor * _Nonnull)highlightedColor;

/**
 *  Create an UIButton in a frame with an image
 *
 *  @param frame Button's frame
 *  @param image Button's image
 *
 *  @return Returns the UIButton instance
 */
+ (instancetype _Nonnull)initWithFrame:(CGRect)frame
                                 image:(UIImage * _Nonnull)image;

/**
 *  Create an UIButton in a frame with an image
 *
 *  @param frame            Button's frame
 *  @param image            Button's image
 *  @param highlightedImage Button's highlighted image
 *
 *  @return Returns the UIButton instance
 */
+ (instancetype _Nonnull)initWithFrame:(CGRect)frame
                                 image:(UIImage * _Nonnull)image
                      highlightedImage:(UIImage * _Nullable)highlightedImage;

/**
 *  Set the title font with a size
 *
 *  @param fontName Font name from the FontName enum declared in UIFont+BEKit
 *  @param size     Font size
 */
- (void)setTitleFont:(FontName)fontName
                size:(CGFloat)size;

/**
 *  Set the title color
 *
 *  @param color Font color, the highlighted color will be automatically created
 */
- (void)setTitleColor:(UIColor * _Nonnull)color;

/**
 *  Set the title color and highlighted color
 *
 *  @param color            Button's color
 *  @param highlightedColor Button's highlighted color
 */
- (void)setTitleColor:(UIColor * _Nonnull)color
     highlightedColor:(UIColor * _Nullable)highlightedColor;

@end
