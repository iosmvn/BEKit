//
//  UIColor+BEKit.h
//  BEKit
//
//  Created by sundanlong on 16/4/11.
//
//

@import Foundation;
@import UIKit;

@interface UIColor (BEKit)

#define RGBA(r, g, b, a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r, g, b) RGBA(r, g, b, 1.0f)

@property (nonatomic, readonly) CGFloat red;
@property (nonatomic, readonly) CGFloat green;
@property (nonatomic, readonly) CGFloat blue;
@property (nonatomic, readonly) CGFloat white;
@property (nonatomic, readonly) CGFloat hue;
@property (nonatomic, readonly) CGFloat saturation;//饱和
@property (nonatomic, readonly) CGFloat brightness;//亮度
@property (nonatomic, readonly) CGFloat alpha;

/**
 Create a color from a HEX string.
 It supports the following type:
  - #RGB
  - #ARGB
  - #RRGGBB
  - #AARRGGBB

 @param hex HEX string
 @return Returns the UIColor instance
 */
+ (UIColor * _Nonnull)be_hex:(NSString * _Nonnull)hex;

+ (UIColor * _Nonnull)be_colorWithHex:(unsigned int)hex;
+ (UIColor * _Nonnull)be_colorWithHex:(unsigned int)hex alpha:(float)alpha;

+ (UIColor * _Nonnull)be_randomColor;

+ (UIColor * _Nonnull)be_colorWithColor:(UIColor * _Nonnull)color alpha:(float)alpha;

- (BOOL)be_canProvideRGBComponents;//Check if the color is in RGB format

@end
