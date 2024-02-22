//
//  NSNumber+BEKit.h
//  BEKit
//
//  Created by dalong on 16/4/11.
//
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

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

@end
