//
//  UIView+BEKit.m
//  BEKit
//
//  Created by dalong on 16/4/11.
//
//

#import "UIView+BEKit.h"

@implementation UIView (BEKit)

+ (instancetype _Nonnull)be_initWithFrame:(CGRect)frame backgroundColor:(UIColor * _Nonnull)backgroundColor {
    UIView *view = [[UIView alloc] initWithFrame:frame];
    [view setBackgroundColor:backgroundColor];
    
    return view;
}

- (void)be_createBordersWithColor:(UIColor * _Nonnull)color withCornerRadius:(CGFloat)radius andWidth:(CGFloat)width {
    self.layer.borderWidth = width;
    self.layer.cornerRadius = radius;
    self.layer.shouldRasterize = NO;
    self.layer.rasterizationScale = 2;
    self.layer.edgeAntialiasingMask = kCALayerLeftEdge | kCALayerRightEdge | kCALayerBottomEdge | kCALayerTopEdge;
    self.clipsToBounds = YES;
    self.layer.masksToBounds = YES;
    
    CGColorSpaceRef space = CGColorSpaceCreateDeviceRGB();
    CGColorRef cgColor = [color CGColor];
    self.layer.borderColor = cgColor;
    CGColorSpaceRelease(space);
}

- (void)be_removeBorders {
    self.layer.borderWidth = 0;
    self.layer.cornerRadius = 0;
    self.layer.borderColor = nil;
}

- (void)be_removeShadow {
    [self.layer setShadowColor:[[UIColor clearColor] CGColor]];
    [self.layer setShadowOpacity:0.0f];
    [self.layer setShadowOffset:CGSizeMake(0.0f, 0.0f)];
}

- (void)be_setCornerRadius:(CGFloat)radius {
    self.layer.cornerRadius = radius;
    [self.layer setMasksToBounds:YES];
}

- (void)be_createRectShadowWithOffset:(CGSize)offset opacity:(CGFloat)opacity radius:(CGFloat)radius {
    self.layer.shadowColor = [UIColor blackColor].CGColor;
    self.layer.shadowOpacity = opacity;
    self.layer.shadowOffset = offset;
    self.layer.shadowRadius = radius;
    self.layer.masksToBounds = NO;
}

- (void)be_createCornerRadiusShadowWithCornerRadius:(CGFloat)cornerRadius offset:(CGSize)offset opacity:(CGFloat)opacity radius:(CGFloat)radius {
    self.layer.shadowColor = [UIColor blackColor].CGColor;
    self.layer.shadowOpacity = opacity;
    self.layer.shadowOffset = offset;
    self.layer.shadowRadius = radius;
    self.layer.shouldRasterize = YES;
    self.layer.cornerRadius = cornerRadius;
    self.layer.shadowPath = [[UIBezierPath bezierPathWithRoundedRect:[self bounds] cornerRadius:cornerRadius] CGPath];
    self.layer.masksToBounds = NO;
}

- (void)be_createGradientWithColors:(NSArray * _Nonnull)colors direction:(UIViewLinearGradientDirection)direction {
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = self.bounds;
    
    NSMutableArray *mutableColors = colors.mutableCopy;
    for (int i = 0; i < colors.count; i++) {
        UIColor *currentColor = colors[i];
        [mutableColors replaceObjectAtIndex:i withObject:(id)currentColor.CGColor];
    }
    gradient.colors = mutableColors;
    
    switch (direction) {
        case UIViewLinearGradientDirectionVertical: {
            gradient.startPoint = CGPointMake(0.5f, 0.0f);
            gradient.endPoint = CGPointMake(0.5f, 1.0f);
            break;
        }
        case UIViewLinearGradientDirectionHorizontal: {
            gradient.startPoint = CGPointMake(0.0f, 0.5f);
            gradient.endPoint = CGPointMake(1.0f, 0.5f);
            break;
        }
        case UIViewLinearGradientDirectionDiagonalFromLeftToRightAndTopToDown: {
            gradient.startPoint = CGPointMake(0.0f, 0.0f);
            gradient.endPoint = CGPointMake(1.0f, 1.0f);
            break;
        }
        case UIViewLinearGradientDirectionDiagonalFromLeftToRightAndDownToTop: {
            gradient.startPoint = CGPointMake(0.0f, 1.0f);
            gradient.endPoint = CGPointMake(1.0f, 0.0f);
            break;
        }
        case UIViewLinearGradientDirectionDiagonalFromRightToLeftAndTopToDown: {
            gradient.startPoint = CGPointMake(1.0f, 0.0f);
            gradient.endPoint = CGPointMake(0.0f, 1.0f);
            break;
        }
        case UIViewLinearGradientDirectionDiagonalFromRightToLeftAndDownToTop: {
            gradient.startPoint = CGPointMake(1.0f, 1.0f);
            gradient.endPoint = CGPointMake(0.0f, 0.0f);
            break;
        }
    }
    [self.layer insertSublayer:gradient atIndex:0];
}

- (void)be_shakeView {
    CAKeyframeAnimation *shake = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    shake.values = @[[NSValue valueWithCATransform3D:CATransform3DMakeTranslation(-5.0f, 0.0f, 0.0f)], [NSValue valueWithCATransform3D:CATransform3DMakeTranslation(5.0f, 0.0f, 0.0f)]];
    shake.autoreverses = YES;
    shake.repeatCount = 2.0f;
    shake.duration = 0.07f;
    
    [self.layer addAnimation:shake forKey:@"shake"];
}

- (void)be_pulseViewWithDuration:(CGFloat)duration {
    [UIView animateWithDuration:duration / 6 animations:^{
        [self setTransform:CGAffineTransformMakeScale(1.1, 1.1)];
    } completion:^(BOOL finished) {
        if (finished) {
            [UIView animateWithDuration:duration / 6 animations:^{
                [self setTransform:CGAffineTransformMakeScale(0.96, 0.96)];
            } completion:^(BOOL finished) {
                if (finished) {
                    [UIView animateWithDuration:duration / 6 animations:^{
                        [self setTransform:CGAffineTransformMakeScale(1.03, 1.03)];
                    } completion:^(BOOL finished) {
                        if (finished) {
                            [UIView animateWithDuration:duration / 6 animations:^{
                                [self setTransform:CGAffineTransformMakeScale(0.985, 0.985)];
                            } completion:^(BOOL finished) {
                                if (finished) {
                                    [UIView animateWithDuration:duration / 6 animations:^{
                                        [self setTransform:CGAffineTransformMakeScale(1.007, 1.007)];
                                    } completion:^(BOOL finished) {
                                        if (finished) {
                                            [UIView animateWithDuration:duration / 6 animations:^{
                                                [self setTransform:CGAffineTransformMakeScale(1, 1)];
                                            } completion:nil];
                                        }
                                    }];
                                }
                            }];
                        }
                    }];
                }
            }];
        }
    }];
}

- (void)be_heartbeatViewWithDuration:(CGFloat)duration {
    float maxSize = 1.4f, durationPerBeat = 0.5f;
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    
    CATransform3D scale1 = CATransform3DMakeScale(0.8, 0.8, 1);
    CATransform3D scale2 = CATransform3DMakeScale(maxSize, maxSize, 1);
    CATransform3D scale3 = CATransform3DMakeScale(maxSize - 0.3f, maxSize - 0.3f, 1);
    CATransform3D scale4 = CATransform3DMakeScale(1.0, 1.0, 1);
    
    NSArray *frameValues = [NSArray arrayWithObjects:[NSValue valueWithCATransform3D:scale1], [NSValue valueWithCATransform3D:scale2], [NSValue valueWithCATransform3D:scale3], [NSValue valueWithCATransform3D:scale4], nil];
    
    [animation setValues:frameValues];
    
    NSArray *frameTimes = [NSArray arrayWithObjects:[NSNumber numberWithFloat:0.05], [NSNumber numberWithFloat:0.2], [NSNumber numberWithFloat:0.6], [NSNumber numberWithFloat:1.0], nil];
    [animation setKeyTimes:frameTimes];
    
    animation.fillMode = kCAFillModeForwards;
    animation.duration = durationPerBeat;
    animation.repeatCount = duration / durationPerBeat;
    
    [self.layer addAnimation:animation forKey:@"heartbeat"];
}

- (void)be_applyMotionEffects {
    UIInterpolatingMotionEffect *horizontalEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.x" type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
    horizontalEffect.minimumRelativeValue = @(-10.0f);
    horizontalEffect.maximumRelativeValue = @(10.0f);
    UIInterpolatingMotionEffect *verticalEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.y" type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
    verticalEffect.minimumRelativeValue = @(-10.0f);
    verticalEffect.maximumRelativeValue = @(10.0f);
    UIMotionEffectGroup *motionEffectGroup = [[UIMotionEffectGroup alloc] init];
    motionEffectGroup.motionEffects = @[horizontalEffect, verticalEffect];
    
    [self addMotionEffect:motionEffectGroup];
}

- (void)be_flipWithDuration:(NSTimeInterval)duration direction:(UIViewAnimationFlipDirection)direction {
    NSString *subtype = nil;
    
    switch (direction) {
        case UIViewAnimationFlipDirectionFromTop:
            subtype = @"fromTop";
            break;
        case UIViewAnimationFlipDirectionFromLeft:
            subtype = @"fromLeft";
            break;
        case UIViewAnimationFlipDirectionFromBottom:
            subtype = @"fromBottom";
            break;
        case UIViewAnimationFlipDirectionFromRight:
        default:
            subtype = @"fromRight";
            break;
    }
    
    CATransition *transition = [CATransition animation];
    
    transition.startProgress = 0;
    transition.endProgress = 1.0;
    transition.type = @"flip";
    transition.subtype = subtype;
    transition.duration = duration;
    transition.repeatCount = 1;
    transition.autoreverses = 1;
    
    [self.layer addAnimation:transition forKey:@"flip"];
}

- (void)be_translateAroundTheView:(UIView * _Nonnull)topView duration:(CGFloat)duration direction:(UIViewAnimationTranslationDirection)direction repeat:(BOOL)repeat startFromEdge:(BOOL)startFromEdge {
    CGFloat startPosition, endPosition;
    switch (direction) {
        case UIViewAnimationTranslationDirectionFromLeftToRight: {
            startPosition = self.frame.size.width / 2;
            endPosition = -(self.frame.size.width / 2) + topView.frame.size.width;
            break;
        }
        case UIViewAnimationTranslationDirectionFromRightToLeft:
        default: {
            startPosition = -(self.frame.size.width / 2) + topView.frame.size.width;
            endPosition = self.frame.size.width / 2;
            break;
        }
    }
    
    if (startFromEdge) {
        [self setCenter:CGPointMake(startPosition, self.center.y)];
    }
    
    [UIView animateWithDuration:duration / 2 delay:1 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        [self setCenter:CGPointMake(endPosition, self.center.y)];
    } completion:^(BOOL finished) {
        if (finished) {
            [UIView animateWithDuration:duration / 2 delay:1 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                [self setCenter:CGPointMake(startPosition, self.center.y)];
            } completion:^(BOOL finished) {
                if (finished) {
                    if (repeat) {
                        [self be_translateAroundTheView:topView duration:duration direction:direction repeat:repeat startFromEdge:startFromEdge];
                    }
                }
            }];
        }
    }];
}

- (UIImage * _Nonnull)be_screenshot {
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, [UIScreen mainScreen].scale);
    
    [self drawViewHierarchyInRect:self.bounds afterScreenUpdates:YES];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    NSData *imageData = UIImagePNGRepresentation(image);
    image = [UIImage imageWithData:imageData];
    
    return image;
}

- (UIImage * _Nonnull)be_saveScreenshot {
    UIImage *image = [self be_screenshot];
    UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
    
    return image;
}

- (void)be_removeAllSubviews {
    [[self subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
}

- (CGFloat)left {
    return self.frame.origin.x;
}
    
- (void)setLeft:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}
    
- (CGFloat)top {
    return self.frame.origin.y;
}
    
- (void)setTop:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}
    
- (CGFloat)right {
    return self.frame.origin.x + self.frame.size.width;
}
    
- (void)setRight:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}
    
- (CGFloat)bottom {
    return self.frame.origin.y + self.frame.size.height;
}
    
- (void)setBottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}
    
- (CGFloat)width {
    return self.frame.size.width;
}
    
- (void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}
    
- (CGFloat)height {
    return self.frame.size.height;
}
    
- (void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}
    
- (CGFloat)centerX {
    return self.center.x;
}
    
- (void)setCenterX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}
    
- (CGFloat)centerY {
    return self.center.y;
}
    
- (void)setCenterY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}
    
- (CGPoint)origin {
    return self.frame.origin;
}
    
- (void)setOrigin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}
    
- (CGSize)size {
    return self.frame.size;
}
    
- (void)setSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}
    
@end
