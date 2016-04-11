//
//  NSNumber+BEKit.h
//  BEKit
//
//  Created by sundanlong on 16/4/11.
//
//

@import Foundation;
@import CoreGraphics;

@interface NSNumber (BEKit)

#if __cplusplus
extern "C" {
#endif

CGFloat BE_DegreesToRadians(CGFloat degrees);

CGFloat BE_RadiansToDegrees(CGFloat radians);
#if __cplusplus
}
#endif

+ (NSInteger)be_randomIntBetweenMin:(NSInteger)minValue
                          andMax:(NSInteger)maxValue;

+ (CGFloat)be_randomFloat;

+ (CGFloat)be_randomFloatBetweenMin:(CGFloat)minValue
                          andMax:(CGFloat)maxValue;

+ (NSInteger)be_nextPowerOfTwo:(NSInteger)number;

+ (BOOL)be_isPowerOfTwo:(NSInteger)number;

@end
