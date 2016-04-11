//
//  UILabel+BEKit.m
//  BEKit
//
//  Created by sundanlong on 16/4/11.
//
//

#import "UILabel+BEKit.h"

@implementation UILabel (BEKit)

+ (UILabel * _Nonnull)initWithFrame:(CGRect)frame text:(NSString * _Nonnull)text font:(FontName)fontName size:(CGFloat)size color:(UIColor * _Nonnull)color alignment:(NSTextAlignment)alignment lines:(NSInteger)lines {
    return [UILabel initWithFrame:frame text:text font:fontName size:size color:color alignment:alignment lines:lines shadowColor:[UIColor clearColor]];
}

+ (UILabel * _Nonnull)initWithFrame:(CGRect)frame text:(NSString * _Nonnull)text font:(FontName)fontName size:(CGFloat)size color:(UIColor * _Nonnull)color alignment:(NSTextAlignment)alignment lines:(NSInteger)lines shadowColor:(UIColor * _Nonnull)colorShadow {
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    [label setFont:[UIFont fontForFontName:fontName size:size]];
    [label setText:text];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setTextColor:color];
    [label setShadowColor:colorShadow];
    [label setTextAlignment:alignment];
    [label setNumberOfLines:lines];
    
    return label;
}

- (CGFloat)calculatedHeight {
    return [self.text be_heightForWidth:self.frame.size.width andFont:self.font];
}

- (void)setFont:(UIFont * _Nonnull)font fromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex {
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self.text];
    [attributedString addAttribute:NSFontAttributeName value:font range:NSMakeRange(fromIndex, toIndex - fromIndex)];
    
    [self setAttributedText:attributedString];
}

@end
