//
//  UIButton+BEKit.h
//  BEKit
//
//  Created by dalong on 2018/2/27.
//

#import <UIKit/UIKit.h>

// 定义一个枚举（包含了四种类型的button）
typedef NS_ENUM(NSUInteger, BEButtonImageStyle) {
    BEButtonImageStyleTop, // image在上，label在下
    BEButtonImageStyleLeft, // image在左，label在右
    BEButtonImageStyleBottom, // image在下，label在上
    BEButtonImageStyleRight // image在右，label在左
};

@interface UIButton (BEKit)

/**
 设置button的titleLabel和imageView的布局样式，及间距

 @param style titleLabel和imageView的布局样式
 @param space titleLabel和imageView的间距
 */
- (void)be_layout:(BEButtonImageStyle)style space:(CGFloat)space;

@end
