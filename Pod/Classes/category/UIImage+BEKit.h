//
//  UIImage+BEKit.h
//  BEKit
//
//  Created by sundanlong on 16/4/11.
//
//

@import Foundation;
@import UIKit;
@import Accelerate;
@import CoreImage;

/**
 *  This category adds some useful methods to UIImage
 */
@interface UIImage (BEKit)

/**
 *  Create a dummy image
 *
 *  @param name To use it, name parameter must contain: "dummy.100x100" and "dummy.100x100.#FFFFFF" or "dummy.100x100.blue" (if it's a color defined in UIColor class) if you want to define a color
 *
 *  @return Returns the created dummy image
 */
+ (UIImage * _Nullable)be_dummyImageNamed:(NSString * _Nonnull)name;

/**
 *  Apply the given Blend Mode
 *
 *  @param blendMode The choosed Blend Mode
 *
 *  @return Returns the image
 */
- (UIImage * _Nonnull)be_blendMode:(CGBlendMode)blendMode;

/**
 *  Apply the Blend Mode Overlay
 *
 *  @return Returns the image
 */
- (UIImage * _Nonnull)be_blendOverlay;

/**
 *  Mask self with another image and size
 *
 *  @param image Mask image
 *  @param size  Mask size
 *
 *  @return Returns the masked image
 */
- (UIImage * _Nullable)be_maskWithImage:(UIImage * _Nonnull)image
                                andSize:(CGSize)size DEPRECATED_MSG_ATTRIBUTE("Use -setMaskImage from UIImageView instance method");

/**
 *  Mask self with another image
 *
 *  @param image Mask image
 *
 *  @return Returns the masked image
 */
- (UIImage * _Nullable)be_maskWithImage:(UIImage * _Nonnull)image DEPRECATED_MSG_ATTRIBUTE("Use -setMaskImage from UIImageView instance method");

/**
 *  Create an image from a given rect of self
 *
 *  @param rect Rect to take the image
 *
 *  @return Returns the image from a given rect
 */
- (UIImage * _Nonnull)be_imageAtRect:(CGRect)rect;

/**
 *  Scale the image proportionally to the given size
 *
 *  @param targetSize The site to scale to
 *
 *  @return Returns the scaled image
 */
- (UIImage * _Nonnull)be_imageByScalingProportionallyToSize:(CGSize)targetSize;

/**
 *  Scale the image to the minimum given size
 *
 *  @param targetSize The site to scale to
 *
 *  @return Returns the scaled image
 */
- (UIImage * _Nonnull)be_imageByScalingProportionallyToMinimumSize:(CGSize)targetSize;

/**
 *  Scale the image to the maxinum given size
 *
 *  @param maxSize The site to scale to
 *
 *  @return Returns the scaled image
 */
- (UIImage * _Nonnull)be_imageByScalingProportionallyToMaximumSize:(CGSize)targetSize;

/**
 *  Scele the iamge to the given size
 *
 *  @param targetSize The site to scale to
 *
 *  @return Returns the scaled image
 */
- (UIImage * _Nonnull)be_imageByScalingToSize:(CGSize)targetSize;

/**
 *  Rotate the image to the given radians
 *
 *  @param radians Radians to rotate to
 *
 *  @return Returns the rotated image
 */
- (UIImage * _Nonnull)be_imageRotatedByRadians:(CGFloat)radians;

/**
 *  Rotate the image to the given degrees
 *
 *  @param radians Degrees to rotate to
 *
 *  @return Returns the rotated image
 */
- (UIImage * _Nonnull)be_imageRotatedByDegrees:(CGFloat)degrees;

/**
 *  Flip the image horizontally
 *
 *  @return Returns the flipped image
 */
- (UIImage * _Nonnull)be_flipImageHorizontally;

/**
 *  Flip the image vertically
 *
 *  @return Returns the flipped image
 */
- (UIImage * _Nonnull)be_flipImageVertically;

/**
 *  Check if the image has alpha
 *
 *  @return Returns YES if has alpha, NO if not
 */
- (BOOL)be_hasAlpha;

/**
 *  Remove the alpha of the image
 *
 *  @return Returns the image without alpha
 */
- (UIImage * _Nonnull)be_removeAlpha;

/**
 *  Fill the alpha with the white color
 *
 *  @return Returns the filled image
 */
- (UIImage * _Nonnull)be_fillAlpha;

/**
 *  Fill the alpha with the given color
 *
 *  @param color Color to fill
 *
 *  @return Returns the filled image
 */
- (UIImage * _Nonnull)be_fillAlphaWithColor:(UIColor * _Nonnull)color;

/**
 *  Check if the image is in grayscale
 *
 *  @return Returns YES if is in grayscale, NO if not
 */
- (BOOL)be_isGrayscale;

/**
 *  Transform the image to grayscale
 *
 *  @return Returns the transformed image
 */
- (UIImage * _Nonnull)be_imageToGrayscale;

/**
 *  Transform the image to black and white
 *
 *  @return Returns the transformed image
 */
- (UIImage * _Nonnull)be_imageToBlackAndWhite;

/**
 *  Invert the color of the image
 *
 *  @return Returns the transformed image
 */
- (UIImage * _Nonnull)be_invertColors;


/**
 *  Apply the bloom effect to the image
 *
 *  @param radius    Radius of the bloom
 *  @param intensity Intensity of the bloom
 *
 *  @return Returns the transformed image
 */
- (UIImage * _Nonnull)be_bloom:(float)radius
                     intensity:(float)intensity;

/**
 *  Apply the blur effect to the image
 *
 *  @param blur Radius of the blur
 *
 *  @return Returns the transformed image
 */
- (UIImage * _Nonnull)be_blurImageWithBlur:(CGFloat)blur;

/**
 *  Apply the bump distortion effect to the image
 *
 *  @param center Vector of the distortion. Use [CIVector vectorWithX:Y:]
 *  @param radius Radius of the effect
 *  @param scale  Scale of the effect
 *
 *  @return Returns the transformed image
 */
- (UIImage * _Nonnull)be_bumpDistortion:(CIVector * _Nonnull)center
                                 radius:(float)radius
                                  scale:(float)scale;

/**
 *  Apply the bump distortion linear effect to the image
 *
 *  @param center Vector of the distortion, use [CIVector vectorWithX:Y:]
 *  @param radius Radius of the effect
 *  @param angle  Angle of the effect in radians
 *  @param scale  Scale of the effect
 *
 *  @return Returns the transformed image
 */
- (UIImage * _Nonnull)be_bumpDistortionLinear:(CIVector * _Nonnull)center
                                       radius:(float)radius
                                        angle:(float)angle
                                        scale:(float)scale;

/**
 *  Apply the circular splash distortion effect to the image
 *
 *  @param center Vector of the distortion, use [CIVector vectorWithX:Y:]
 *  @param radius Radius of the effect
 *
 *  @return Returns the transformed image
 */
- (UIImage * _Nonnull)be_circleSplashDistortion:(CIVector * _Nonnull)center
                                         radius:(float)radius;

/**
 *  Apply the circular wrap effect to the image
 *
 *  @param center Vector of the distortion, use [CIVector vectorWithX:Y:]
 *  @param radius Radius of the effect
 *  @param angle  Angle of the effect in radians
 *
 *  @return Returns the transformed image
 */
- (UIImage * _Nonnull)be_circularWrap:(CIVector * _Nonnull)center
                               radius:(float)radius
                                angle:(float)angle;

/**
 *  Apply the CMY halftone effect to the image
 *
 *  @param center    Vector of the distortion, use [CIVector vectorWithX:Y:]
 *  @param width     Width value
 *  @param angle     Angle of the effect in radians
 *  @param sharpness Sharpness Value
 *  @param gcr       GCR value
 *  @param ucr       UCR value
 *
 *  @return Returns the transformed image
 */
- (UIImage * _Nonnull)be_cmykHalftone:(CIVector * _Nonnull)center
                                width:(float)width
                                angle:(float)angle
                            sharpness:(float)sharpness
                                  gcr:(float)gcr
                                  ucr:(float)ucr;

/**
 *  Apply the sepia filter to the image
 *
 *  @param intensity Intensity of the filter
 *
 *  @return Returns the transformed image
 */
- (UIImage * _Nonnull)be_sepiaToneWithIntensity:(float)intensity;

/**
 *  Create an image from a given color
 *
 *  @param color Color value
 *
 *  @return Returns the created UIImage
 */
+ (UIImage * _Nonnull)be_imageWithColor:(UIColor * _Nonnull)color;

/**
 *  Create an image from a given text
 *
 *  @param text      Text
 *  @param fontName  Text's font name
 *  @param fontSize  Text's font size
 *  @param imageSize Image's size
 *
 *  @return Returns the created UIImage
 */
+ (UIImage * _Nonnull)be_imageFromText:(NSString * _Nonnull)text
                                  font:(UIFont * _Nonnull)font
                             imageSize:(CGSize)imageSize;

/**
 *  Create an image with a background color and with a text with a mask
 *
 *  @param imageSize       Image's size
 *  @param backgroundColor Image's background color
 *  @param string          Text to mask
 *  @param fontName        Text's font name
 *  @param fontSize        Text's font size
 *
 *  @return Returns the created UIImage
 */
+ (UIImage * _Nonnull)be_imageWithSize:(CGSize)imageSize
                       backgroundColor:(UIColor * _Nonnull)backgroundColor
                            maskedText:(NSString * _Nonnull)string
                                  font:(UIFont * _Nonnull)font ;

@end
