//
//  UIScrollView+BEKit.h
//  BEKit
//
//  Created by sundanlong on 16/4/11.
//
//

@import Foundation;
@import UIKit;

@interface UIScrollView (BEKit)

+ (instancetype _Nonnull)be_initWithFrame:(CGRect)frame
                              contentSize:(CGSize)contentSize
                            clipsToBounds:(BOOL)clipsToBounds
                            pagingEnabled:(BOOL)pagingEnabled
                     showScrollIndicators:(BOOL)showScrollIndicators
                                 delegate:(id<UIScrollViewDelegate> _Nullable)delegate;

@end
