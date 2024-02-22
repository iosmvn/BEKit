//
//  UIButton+BEKit.m
//  BEKit
//
//  Created by dalong on 2018/2/27.
//

#import "UIButton+BEKit.h"

@implementation UIButton (BEKit)

- (void)be_layout:(BEButtonImageStyle)style space:(CGFloat)space {
    /**
     * 知识点：titleEdgeInsets是title相对于其上下左右的inset，跟tableView的contentInset是类似的，
     * 如果只有title，那它上下左右都是相对于button的，image也是一样；
     * 如果同时有image和label，那这时候image的上左下是相对于button，右边是相对于label的；title的上右下是相对于button，左边是相对于image的。
     */
    
    // 1. 得到imageView和titleLabel的宽、高
    CGFloat imageWith = self.imageView.frame.size.width;
    CGFloat imageHeight = self.imageView.frame.size.height;
    
    CGFloat labelWidth = 0.0;
    CGFloat labelHeight = 0.0;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0) {
        // 由于iOS8中titleLabel的size为0，用下面的这种设置
        labelWidth = self.titleLabel.intrinsicContentSize.width;
        labelHeight = self.titleLabel.intrinsicContentSize.height;
    } else {
        labelWidth = self.titleLabel.frame.size.width;
        labelHeight = self.titleLabel.frame.size.height;
    }
    
    // 2. 声明全局的imageEdgeInsets和labelEdgeInsets
    UIEdgeInsets imageEdgeInsets = UIEdgeInsetsZero;
    UIEdgeInsets labelEdgeInsets = UIEdgeInsetsZero;
    
    // 3. 根据style和space得到imageEdgeInsets和labelEdgeInsets的值
    /**
     BEButtonImageStyleTop, // image在上，label在下
     BEButtonImageStyleLeft, // image在左，label在右
     BEButtonImageStyleBottom, // image在下，label在上
     BEButtonImageStyleRight // image在右，label在左
     */
    switch (style) {
        case BEButtonImageStyleTop: {
            imageEdgeInsets = UIEdgeInsetsMake(-labelHeight-space/2.0, 0, 0, -labelWidth);
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith, -imageHeight-space/2.0, 0);
        }
            break;
        case BEButtonImageStyleLeft: {
            imageEdgeInsets = UIEdgeInsetsMake(0, -space/2.0, 0, space/2.0);
            labelEdgeInsets = UIEdgeInsetsMake(0, space/2.0, 0, -space/2.0);
        }
            break;
        case BEButtonImageStyleBottom: {
            imageEdgeInsets = UIEdgeInsetsMake(0, 0, -labelHeight-space/2.0, -labelWidth);
            labelEdgeInsets = UIEdgeInsetsMake(-imageHeight-space/2.0, -imageWith, 0, 0);
        }
            break;
        case BEButtonImageStyleRight: {
            imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth+space/2.0, 0, -labelWidth-space/2.0);
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith-space/2.0, 0, imageWith+space/2.0);
        }
            break;
        default:
            break;
    }
    // 4. 赋值
    self.titleEdgeInsets = labelEdgeInsets;
    self.imageEdgeInsets = imageEdgeInsets;
    
//    CGSize imgViewSize,titleSize,btnSize;
//    UIEdgeInsets imageViewEdge,titleEdge;
//
//    //设置按钮内边距
//    imgViewSize = self.imageView.bounds.size;
//    titleSize = self.titleLabel.bounds.size;
//    btnSize = self.bounds.size;
//
//    imageViewEdge = UIEdgeInsetsMake(space, 0.0, btnSize.height -imgViewSize.height - space, - titleSize.width);
//    [self setImageEdgeInsets:imageViewEdge];
//    titleEdge = UIEdgeInsetsMake(imgViewSize.height + space, - imgViewSize.width, 0.0, 0.0);
//    [self setTitleEdgeInsets:titleEdge];
}

@end
