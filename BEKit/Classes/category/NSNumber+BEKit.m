//
//  NSNumber+BEKit.m
//  BEKit
//
//  Created by sundanlong on 16/4/11.
//
//

#import "NSNumber+BEKit.h"

@implementation NSNumber (BEKit)

#if __cplusplus
extern "C" {
#endif
    CGFloat BE_DegreesToRadians(CGFloat degrees) {
        return degrees * M_PI / 180;
    };
    CGFloat BE_RadiansToDegrees(CGFloat radians) {
        return radians * 180 / M_PI;
    };
#if _cplusplus
}
#endif

+ (NSInteger)be_randomIntBetweenMin:(NSInteger)minValue andMax:(NSInteger)maxValue {
    return (NSInteger)(minValue + [self be_randomFloat] * (maxValue - minValue));
}

+ (CGFloat)be_randomFloat {
    return (float) arc4random() / UINT_MAX;
}

+ (CGFloat)be_randomFloatBetweenMin:(CGFloat)minValue andMax:(CGFloat)maxValue {
    return (((float) (arc4random() % ((unsigned)RAND_MAX + 1)) / RAND_MAX) * (maxValue - minValue)) + minValue;
}

@end
