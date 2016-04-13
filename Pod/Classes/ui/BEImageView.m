//
//  BEImageView.m
//  Pods
//
//  Created by sundanlong on 16/4/13.
//
//

#import "BEImageView.h"

@interface  BEImageView ()

@property (nonatomic, copy) void(^tapAction)(id);

@end

@implementation BEImageView

- (void)tap{
    if (self.tapAction) {
        self.tapAction(self);
    }
}

- (void)addTapBlock:(void(^)(id obj))tapAction{
    self.tapAction = tapAction;
    if (![self gestureRecognizers]) {
        self.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
        [self addGestureRecognizer:tap];
    }
}

@end
