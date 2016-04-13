//
//  UILabel+BEKit.m
//  BEKit
//
//  Created by sundanlong on 16/4/11.
//
//

#import "UILabel+BEKit.h"

@implementation UILabel (BEKit)

+ (UILabel * _Nonnull)be_initWithFrame:(CGRect)frame text:(NSString * _Nonnull)text font:(UIFont * _Nonnull)font color:(UIColor * _Nonnull)color alignment:(NSTextAlignment)alignment lines:(NSInteger)lines {
    return [UILabel be_initWithFrame:frame text:text font:font color:color alignment:alignment lines:lines shadowColor:[UIColor clearColor]];
}

+ (UILabel * _Nonnull)be_initWithFrame:(CGRect)frame text:(NSString * _Nonnull)text font:(UIFont * _Nonnull)font color:(UIColor * _Nonnull)color alignment:(NSTextAlignment)alignment lines:(NSInteger)lines shadowColor:(UIColor * _Nonnull)colorShadow {
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    [label setFont:font];
    [label setText:text];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setTextColor:color];
    [label setShadowColor:colorShadow];
    [label setTextAlignment:alignment];
    [label setNumberOfLines:lines];
    
    return label;
}

- (CGFloat)be_calculatedHeight {
    return [self.text be_heightForWidth:self.frame.size.width andFont:self.font];
}

- (void)be_setFont:(UIFont * _Nonnull)font fromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex {
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self.text];
    [attributedString addAttribute:NSFontAttributeName value:font range:NSMakeRange(fromIndex, toIndex - fromIndex)];
    
    [self setAttributedText:attributedString];
}

@end
