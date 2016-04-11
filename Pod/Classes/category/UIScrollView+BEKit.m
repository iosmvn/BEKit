//
//  UIScrollView+BEKit.m
//  BEKit
//
//  Created by sundanlong on 16/4/11.
//
//

#import "UIScrollView+BEKit.h"

@implementation UIScrollView (BEKit)

+ (instancetype _Nonnull)initWithFrame:(CGRect)frame contentSize:(CGSize)contentSize clipsToBounds:(BOOL)clipsToBounds pagingEnabled:(BOOL)pagingEnabled showScrollIndicators:(BOOL)showScrollIndicators delegate:(id<UIScrollViewDelegate> _Nullable)delegate {
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:frame];
    [scrollView setDelegate:delegate];
    [scrollView setPagingEnabled:pagingEnabled];
    [scrollView setClipsToBounds:clipsToBounds];
    [scrollView setShowsVerticalScrollIndicator:showScrollIndicators];
    [scrollView setShowsHorizontalScrollIndicator:showScrollIndicators];
    [scrollView setContentSize:contentSize];
    
    return scrollView;
}

@end
