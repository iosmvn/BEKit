//
//  BEView.m
//  Pods
//
//  Created by dalong on 16/4/13.
//
//

#import "BEView.h"

@interface  BEView ()

@property (nonatomic, copy) void(^tapAction)(id);

@end

@implementation BEView

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
