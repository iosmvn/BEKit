//
//  UILabel+BEKit.m
//  BEKit
//
//  Created by sundanlong on 16/4/11.
//
//

#import "UILabel+BEKit.h"

@implementation UILabel (BEKit)

- (CGFloat)be_calculatedHeight {
    return [self.text be_heightForWidth:self.frame.size.width andFont:self.font];
}

- (void)be_setFont:(UIFont * _Nonnull)font fromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex {
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self.text];
    [attributedString addAttribute:NSFontAttributeName value:font range:NSMakeRange(fromIndex, toIndex - fromIndex)];
    
    [self setAttributedText:attributedString];
}

@end
