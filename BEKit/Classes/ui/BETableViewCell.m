//
//  BETableViewCell.m
//  Pods
//
//  Created by sundanlong on 16/4/12.
//
//

#import "BETableViewCell.h"
#import "UIColor+BEKit.h"

@implementation BETableViewCell

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [UIColor clearColor].CGColor);
    CGContextFillRect(context, rect);
    //下分割线
    CGContextSetStrokeColorWithColor(context, [UIColor be_colorWithHex:0xe2e2e2].CGColor);
    CGContextStrokeRect(context, CGRectMake(0, rect.size.height, rect.size.width, 0.5));
}

@end
