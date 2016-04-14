//
//  UILabel+BEKit.h
//  BEKit
//
//  Created by sundanlong on 16/4/11.
//
//

@import Foundation;
@import UIKit;

#import "NSString+BEKit.h"

@interface UILabel (BEKit)

+ (UILabel * _Nonnull)be_initWithFrame:(CGRect)frame
                               text:(NSString * _Nonnull)text
                               font:(UIFont * _Nonnull)font
                              color:(UIColor * _Nonnull)color
                          alignment:(NSTextAlignment)alignment
                              lines:(NSInteger)lines;

+ (UILabel * _Nonnull)be_initWithFrame:(CGRect)frame
                               text:(NSString * _Nonnull)text
                               font:(UIFont * _Nonnull)font
                              color:(UIColor * _Nonnull)color
                          alignment:(NSTextAlignment)alignment
                              lines:(NSInteger)lines
                        shadowColor:(UIColor * _Nonnull)colorShadow;

- (CGFloat)be_calculatedHeight;

- (void)be_setFont:(UIFont * _Nonnull)font
      fromIndex:(NSInteger)fromIndex
        toIndex:(NSInteger)toIndex;

@end
