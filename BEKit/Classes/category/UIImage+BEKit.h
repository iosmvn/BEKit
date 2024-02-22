//
//  UIImage+BEKit.h
//  BEKit
//
//  Created by dalong on 16/4/11.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <Accelerate/Accelerate.h>
#import <CoreImage/CoreImage.h>

@interface UIImage (BEKit)

+ (UIImage * _Nullable)be_dummyImageNamed:(NSString * _Nonnull)name;

- (UIImage * _Nonnull)be_blendMode:(CGBlendMode)blendMode;

- (UIImage * _Nonnull)be_blendOverlay;

- (UIImage * _Nonnull)be_imageAtRect:(CGRect)rect;

- (UIImage * _Nullable)be_imageByScalingProportionallyToSize:(CGSize)targetSize;

- (UIImage * _Nullable)be_imageByScalingProportionallyToMinimumSize:(CGSize)targetSize;

- (UIImage * _Nonnull)be_imageByScalingProportionallyToMaximumSize:(CGSize)targetSize;

- (UIImage * _Nullable)be_imageByScalingToSize:(CGSize)targetSize;

- (UIImage * _Nonnull)be_imageRotatedByRadians:(CGFloat)radians;

- (UIImage * _Nonnull)be_imageRotatedByDegrees:(CGFloat)degrees;

- (UIImage * _Nonnull)be_flipImageHorizontally;

- (UIImage * _Nonnull)be_flipImageVertically;

- (BOOL)be_hasAlpha;

- (UIImage * _Nonnull)be_removeAlpha;

- (UIImage * _Nonnull)be_fillAlpha;

- (UIImage * _Nonnull)be_fillAlphaWithColor:(UIColor * _Nonnull)color;

- (BOOL)be_isGrayscale;

- (UIImage * _Nonnull)be_imageToGrayscale;

- (UIImage * _Nonnull)be_imageToBlackAndWhite;

- (UIImage * _Nonnull)be_invertColors;

- (UIImage * _Nonnull)be_bloom:(float)radius
                     intensity:(float)intensity;

- (UIImage * _Nonnull)be_blurImageWithBlur:(CGFloat)blur;

- (UIImage * _Nonnull)be_bumpDistortion:(CIVector * _Nonnull)center
                                 radius:(float)radius
                                  scale:(float)scale;

- (UIImage * _Nonnull)be_bumpDistortionLinear:(CIVector * _Nonnull)center
                                       radius:(float)radius
                                        angle:(float)angle
                                        scale:(float)scale;

- (UIImage * _Nonnull)be_circleSplashDistortion:(CIVector * _Nonnull)center
                                         radius:(float)radius;

- (UIImage * _Nonnull)be_circularWrap:(CIVector * _Nonnull)center
                               radius:(float)radius
                                angle:(float)angle;

- (UIImage * _Nonnull)be_cmykHalftone:(CIVector * _Nonnull)center
                                width:(float)width
                                angle:(float)angle
                            sharpness:(float)sharpness
                                  gcr:(float)gcr
                                  ucr:(float)ucr;

- (UIImage * _Nonnull)be_sepiaToneWithIntensity:(float)intensity;

+ (UIImage * _Nonnull)be_imageWithColor:(UIColor * _Nonnull)color;

+ (UIImage * _Nonnull)be_imageFromText:(NSString * _Nonnull)text
                                  font:(UIFont * _Nonnull)font
                             imageSize:(CGSize)imageSize;

+ (UIImage * _Nonnull)be_imageWithSize:(CGSize)imageSize
                       backgroundColor:(UIColor * _Nonnull)backgroundColor
                            maskedText:(NSString * _Nonnull)string
                                  font:(UIFont * _Nonnull)font ;

@end
