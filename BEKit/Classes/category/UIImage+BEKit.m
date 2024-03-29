//
//  UIImage+BEKit.m
//  BEKit
//
//  Created by dalong on 16/4/11.
//
//

#import "UIImage+BEKit.h"
#import "NSNumber+BEKit.h"
#import "UIColor+BEKit.h"
#import "UIDevice+BEKit.h"

@implementation UIImage (BEKit)

+ (UIImage * _Nullable)be_dummyImageNamed:(NSString * _Nonnull)dummy {
    if (!dummy) {
        return nil;
    }
    
    CGSize size = CGSizeZero;
    UIColor *color = [UIColor lightGrayColor];
    
    NSArray *array = [dummy componentsSeparatedByString:@"."];
    if (array.count > 0)
    {
        NSString *sizeString = array[0];
        if (!sizeString) {
            return nil;
        }
        
//        NSString *colorString = nil;
//        if (array.count >= 2) {
//            colorString = array[1];
//        }
        
        size = [UIImage be_sizeForSizeString:sizeString];
    }
    
    UIGraphicsBeginImageContextWithOptions(size, NO, [[UIScreen mainScreen] scale]);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGRect rect = CGRectMake(0.0, 0.0, size.width, size.height);
    
    [color setFill];
    CGContextFillRect(context, rect);
    
    NSString *sizeString = [NSString stringWithFormat:@"%d x %d", (int)size.width, (int)size.height];
    NSMutableParagraphStyle *style = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    style.alignment = NSTextAlignmentCenter;
    style.minimumLineHeight = size.height / 2;
    NSDictionary *attributes = @{NSParagraphStyleAttributeName : style};
    [sizeString drawInRect:rect withAttributes:attributes];
    
    UIImage *result = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return result;
}

+ (CGSize)be_sizeForSizeString:(NSString * _Nonnull)sizeString {
    NSArray *array = [sizeString componentsSeparatedByString:@"x"];
    if (array.count != 2) {
        return CGSizeZero;
    }
    
    return CGSizeMake([array[0] floatValue], [array[1] floatValue]);
}

- (UIImage * _Nonnull)be_blendMode:(CGBlendMode)blendMode {
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(self.size.width, self.size.height), NO, [[UIScreen mainScreen] scale]);
    [self drawInRect:CGRectMake(0.0, 0.0, self.size.width, self.size.height) blendMode:blendMode alpha:1];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

- (UIImage * _Nonnull)be_blendOverlay {
    return [self be_blendMode:kCGBlendModeOverlay];
}

- (UIImage * _Nonnull)be_imageAtRect:(CGRect)rect {
    CGImageRef imageRef = CGImageCreateWithImageInRect([self CGImage], rect);
    UIImage *subImage = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);
    
    return subImage;
}

- (UIImage * _Nullable)be_imageByScalingProportionallyToMinimumSize:(CGSize)targetSize  {
    UIImage *sourceImage = self;
    UIImage *newImage = nil;
    
    CGSize imageSize = sourceImage.size;
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    
    CGFloat targetWidth = targetSize.width;
    CGFloat targetHeight = targetSize.height;
    
    CGFloat scaleFactor = 0.0;
    CGFloat scaledWidth = targetWidth;
    CGFloat scaledHeight = targetHeight;
    
    CGPoint thumbnailPoint = CGPointMake(0.0,0.0);
    
    if (CGSizeEqualToSize(imageSize, targetSize) == NO) {
        CGFloat widthFactor = targetWidth / width;
        CGFloat heightFactor = targetHeight / height;
        
        if (widthFactor > heightFactor) {
            scaleFactor = widthFactor;
        } else {
            scaleFactor = heightFactor;
        }
        
        scaledWidth = width * scaleFactor;
        scaledHeight = height * scaleFactor;
        
        if (widthFactor > heightFactor) {
            thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5;
        } else if (widthFactor < heightFactor) {
            thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5;
        }
    }
    
    UIGraphicsBeginImageContextWithOptions(targetSize, NO, [[UIScreen mainScreen] scale]);
    CGRect thumbnailRect = CGRectZero;
    thumbnailRect.origin = thumbnailPoint;
    thumbnailRect.size.width  = scaledWidth;
    thumbnailRect.size.height = scaledHeight;
    
    [sourceImage drawInRect:thumbnailRect];
    
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    if (newImage == nil) {
        NSLog(@"Could not scale image");
    }
    
    return newImage;
}

- (UIImage * _Nonnull)be_imageByScalingProportionallyToMaximumSize:(CGSize)targetSize {
    if ((self.size.width > targetSize.width || targetSize.width == targetSize.height) && self.size.width > self.size.height)
    {
        float factor = (targetSize.width * 100) / self.size.width;
        float newWidth = (self.size.width * factor) / 100;
        float newHeight = (self.size.height * factor) / 100;
        
        CGSize newSize = CGSizeMake(newWidth, newHeight);
        UIGraphicsBeginImageContextWithOptions(newSize, NO, [[UIScreen mainScreen] scale]);
        [self drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    } else if ((self.size.height > targetSize.height || targetSize.width == targetSize.height) && self.size.width < self.size.height) {
        float factor = (targetSize.height * 100) / self.size.height;
        float newWidth = (self.size.width * factor) / 100;
        float newHeight = (self.size.height * factor) / 100;
        
        CGSize newSize = CGSizeMake(newWidth, newHeight);
        UIGraphicsBeginImageContextWithOptions(newSize, NO, [[UIScreen mainScreen] scale]);
        [self drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    } else if ((self.size.height > targetSize.height || self.size.width > targetSize.width ) && self.size.width == self.size.height) {
        float factor = (targetSize.height * 100) / self.size.height;
        float newDimension = (self.size.height * factor) / 100;
        
        CGSize newSize = CGSizeMake(newDimension, newDimension);
        UIGraphicsBeginImageContextWithOptions(newSize, NO, [[UIScreen mainScreen] scale]);
        [self drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    } else {
        CGSize newSize = CGSizeMake(self.size.width, self.size.height);
        UIGraphicsBeginImageContextWithOptions(newSize, NO, [[UIScreen mainScreen] scale]);
        [self drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    }
    
    UIImage *returnImage = UIGraphicsGetImageFromCurrentImageContext();    
    UIGraphicsEndImageContext();
    
    return returnImage;
}

- (UIImage * _Nullable)be_imageByScalingProportionallyToSize:(CGSize)targetSize {
    UIImage *sourceImage = self;
    UIImage *newImage = nil;
    
    CGSize imageSize = sourceImage.size;
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    
    CGFloat targetWidth = targetSize.width;
    CGFloat targetHeight = targetSize.height;
    
    CGFloat scaleFactor = 0.0;
    CGFloat scaledWidth = targetWidth;
    CGFloat scaledHeight = targetHeight;
    
    CGPoint thumbnailPoint = CGPointMake(0.0, 0.0);
    
    if (CGSizeEqualToSize(imageSize, targetSize) == NO) {
        CGFloat widthFactor = targetWidth / width;
        CGFloat heightFactor = targetHeight / height;
        
        if (widthFactor < heightFactor) {
            scaleFactor = widthFactor;
        } else {
            scaleFactor = heightFactor;
        }
        
        scaledWidth = width * scaleFactor;
        scaledHeight = height * scaleFactor;
        
        if (widthFactor < heightFactor) {
            thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5;
        } else if (widthFactor > heightFactor) {
            thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5;
        }
    }
    
    UIGraphicsBeginImageContextWithOptions(targetSize, NO, [[UIScreen mainScreen] scale]);
    
    CGRect thumbnailRect = CGRectZero;
    thumbnailRect.origin = thumbnailPoint;
    thumbnailRect.size.width = scaledWidth;
    thumbnailRect.size.height = scaledHeight;
    
    [sourceImage drawInRect:thumbnailRect];
    
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    if (newImage == nil) {
        NSLog(@"Could not scale image");
    }
    
    return newImage;
}


- (UIImage * _Nullable)be_imageByScalingToSize:(CGSize)targetSize {
    UIImage *sourceImage = self;
    UIImage *newImage = nil;
    
    CGFloat targetWidth = targetSize.width;
    CGFloat targetHeight = targetSize.height;
    
    CGFloat scaledWidth = targetWidth;
    CGFloat scaledHeight = targetHeight;
    
    CGPoint thumbnailPoint = CGPointMake(0.0,0.0);
    
    UIGraphicsBeginImageContextWithOptions(targetSize, NO, [[UIScreen mainScreen] scale]);
    
    CGRect thumbnailRect = CGRectZero;
    thumbnailRect.origin = thumbnailPoint;
    thumbnailRect.size.width = scaledWidth;
    thumbnailRect.size.height = scaledHeight;
    
    [sourceImage drawInRect:thumbnailRect];
    
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    if (newImage == nil) {
        NSLog(@"Could not scale image");
    }
    
    return newImage;
}


- (UIImage * _Nonnull)be_imageRotatedByRadians:(CGFloat)radians {
    return [self be_imageRotatedByDegrees:BE_RadiansToDegrees(radians)];
}

- (UIImage * _Nonnull)be_imageRotatedByDegrees:(CGFloat)degrees {
    UIView *rotatedViewBox = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.size.width, self.size.height)];
    CGAffineTransform t = CGAffineTransformMakeRotation(BE_DegreesToRadians(degrees));
    rotatedViewBox.transform = t;
    CGSize rotatedSize = rotatedViewBox.frame.size;
    
    UIGraphicsBeginImageContextWithOptions(rotatedSize, NO, [[UIScreen mainScreen] scale]);
    CGContextRef bitmap = UIGraphicsGetCurrentContext();
    
    CGContextTranslateCTM(bitmap, rotatedSize.width / 2, rotatedSize.height / 2);
    
    CGContextRotateCTM(bitmap, BE_DegreesToRadians(degrees));
    
    CGContextScaleCTM(bitmap, 1.0, -1.0);
    CGContextDrawImage(bitmap, CGRectMake(-self.size.width / 2, -self.size.height / 2, self.size.width, self.size.height), [self CGImage]);
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

- (UIImage * _Nonnull)be_flipImageHorizontally {
    return [[UIImage alloc] initWithCGImage:self.CGImage scale:self.scale orientation:UIImageOrientationUpMirrored];
}

- (UIImage * _Nonnull)be_flipImageVertically {
    return [[UIImage alloc] initWithCGImage:self.CGImage scale:self.scale orientation:UIImageOrientationLeftMirrored];
}

- (BOOL)be_hasAlpha {
    CGImageAlphaInfo alpha = CGImageGetAlphaInfo(self.CGImage);
    return (alpha == kCGImageAlphaFirst || alpha == kCGImageAlphaLast || alpha == kCGImageAlphaPremultipliedFirst || alpha == kCGImageAlphaPremultipliedLast);
}

- (UIImage * _Nonnull)be_removeAlpha {
    if (![self be_hasAlpha]) {
        return self;
    }
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef mainViewContentContext = CGBitmapContextCreate(NULL, self.size.width, self.size.height, 8, 0, colorSpace, (CGBitmapInfo)kCGImageAlphaNoneSkipLast);
	CGColorSpaceRelease(colorSpace);
    
    CGContextDrawImage(mainViewContentContext, CGRectMake(0, 0, self.size.width, self.size.height), self.CGImage);
	CGImageRef mainViewContentBitmapContext = CGBitmapContextCreateImage(mainViewContentContext);
	CGContextRelease(mainViewContentContext);
	UIImage *returnImage = [UIImage imageWithCGImage:mainViewContentBitmapContext];
	CGImageRelease(mainViewContentBitmapContext);
    
    return returnImage;
}

- (UIImage * _Nonnull)be_fillAlpha {
    return [self be_fillAlphaWithColor:[UIColor whiteColor]];
}

- (UIImage * _Nonnull)be_fillAlphaWithColor:(UIColor * _Nonnull)color {
    CGRect im_r;
	im_r.origin = CGPointZero;
	im_r.size = self.size;
    
    CGColorRef cgColor = [color CGColor];
    
    UIGraphicsBeginImageContextWithOptions(self.size, NO, [[UIScreen mainScreen] scale]);
	CGContextRef context = UIGraphicsGetCurrentContext();
	CGContextSetFillColorWithColor(context, cgColor);
    CGContextFillRect(context,im_r);
    [self drawInRect:im_r];
    
	UIImage *returnImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
    
	return returnImage;
}

- (BOOL)be_isGrayscale {
    CGImageRef imgRef = [self CGImage];
    CGColorSpaceModel clrMod = CGColorSpaceGetModel(CGImageGetColorSpace(imgRef));
    
    switch (clrMod) {
        case kCGColorSpaceModelMonochrome:
            return YES;
        default:
            return NO;
    }
}

- (UIImage * _Nonnull)be_imageToGrayscale {
    CGSize size = self.size;
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceGray(); 
    CGContextRef context = CGBitmapContextCreate(nil, size.width, size.height, 8, 0, colorSpace, (CGBitmapInfo)kCGImageAlphaNone);
    CGColorSpaceRelease(colorSpace); 
    CGContextDrawImage(context, rect, [self CGImage]);
    CGImageRef grayscale = CGBitmapContextCreateImage(context);
    UIImage *returnImage = [UIImage imageWithCGImage:grayscale];
    CGContextRelease(context);
    CGImageRelease(grayscale);
    
    return returnImage;
}

- (UIImage * _Nonnull)be_imageToBlackAndWhite {
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceGray();
    CGContextRef context = CGBitmapContextCreate(nil, self.size.width, self.size.height, 8, self.size.width, colorSpace, (CGBitmapInfo)kCGImageAlphaNone);
    CGContextSetInterpolationQuality(context, kCGInterpolationHigh);
    CGContextSetShouldAntialias(context, NO);
    CGContextDrawImage(context, CGRectMake(0, 0, self.size.width, self.size.height), [self CGImage]);
    
    CGImageRef bwImage = CGBitmapContextCreateImage(context);
    CGContextRelease(context);
    CGColorSpaceRelease(colorSpace);
    
    UIImage *returnImage = [UIImage imageWithCGImage:bwImage];
    CGImageRelease(bwImage);
    
    return returnImage;
}

- (UIImage * _Nonnull)be_invertColors {
    UIGraphicsBeginImageContextWithOptions(self.size, NO, [[UIScreen mainScreen] scale]);
    CGContextSetBlendMode(UIGraphicsGetCurrentContext(), kCGBlendModeCopy);
    [self drawInRect:CGRectMake(0, 0, self.size.width, self.size.height)];
    CGContextSetBlendMode(UIGraphicsGetCurrentContext(), kCGBlendModeDifference);
    CGContextSetFillColorWithColor(UIGraphicsGetCurrentContext(), [UIColor whiteColor].CGColor);
    CGContextFillRect(UIGraphicsGetCurrentContext(), CGRectMake(0, 0, self.size.width, self.size.height));
    
    UIImage *returnImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return returnImage;
}

- (UIImage * _Nonnull)be_bloom:(float)radius intensity:(float)intensity {
    CIContext *context = [CIContext contextWithOptions:nil];
    CIImage *image = [CIImage imageWithCGImage:[self CGImage]];
    CIFilter *filter = [CIFilter filterWithName:@"CIBloom"];
    [filter setValue:image forKey:kCIInputImageKey];
    [filter setValue:[NSNumber numberWithFloat:radius] forKey:@"inputRadius"];
    [filter setValue:[NSNumber numberWithFloat:intensity] forKey:@"inputIntensity"];
    CIImage *result = [filter valueForKey:kCIOutputImageKey];
    CGImageRef cgImage = [context createCGImage:result fromRect:[result extent]];
    
    UIImage *returnImage = [UIImage imageWithCGImage:cgImage];
    CFRelease(cgImage);
    
    return returnImage;
}

- (UIImage * _Nonnull)be_bumpDistortion:(CIVector *)center radius:(float)radius scale:(float)scale {
    CIContext *context = [CIContext contextWithOptions:nil];
    CIImage *image = [CIImage imageWithCGImage:[self CGImage]];
    CIFilter *filter = [CIFilter filterWithName:@"CIBumpDistortion"];
    [filter setValue:image forKey:kCIInputImageKey];
    [filter setValue:center forKey:@"inputCenter"];
    [filter setValue:[NSNumber numberWithFloat:radius] forKey:@"inputRadius"];
    [filter setValue:[NSNumber numberWithFloat:scale] forKey:@"inputScale"];
    CIImage *result = [filter valueForKey:kCIOutputImageKey];
    CGImageRef cgImage = [context createCGImage:result fromRect:[result extent]];
    
    UIImage *returnImage = [UIImage imageWithCGImage:cgImage];
    CFRelease(cgImage);
    
    return returnImage;
}

- (UIImage * _Nonnull)be_bumpDistortionLinear:(CIVector * _Nonnull)center radius:(float)radius angle:(float)angle scale:(float)scale {
    CIContext *context = [CIContext contextWithOptions:nil];
    CIImage *image = [CIImage imageWithCGImage:[self CGImage]];
    CIFilter *filter = [CIFilter filterWithName:@"CIBumpDistortionLinear"];
    [filter setValue:image forKey:kCIInputImageKey];
    [filter setValue:center forKey:@"inputCenter"];
    [filter setValue:[NSNumber numberWithFloat:radius] forKey:@"inputRadius"];
    [filter setValue:[NSNumber numberWithFloat:angle] forKey:@"inputAngle"];
    [filter setValue:[NSNumber numberWithFloat:scale] forKey:@"inputScale"];
    CIImage *result = [filter valueForKey:kCIOutputImageKey];
    CGImageRef cgImage = [context createCGImage:result fromRect:[result extent]];
    
    UIImage *returnImage = [UIImage imageWithCGImage:cgImage];
    CFRelease(cgImage);
    
    return returnImage;
}

- (UIImage * _Nonnull)be_circleSplashDistortion:(CIVector * _Nonnull)center radius:(float)radius {
    CIContext *context = [CIContext contextWithOptions:nil];
    CIImage *image = [CIImage imageWithCGImage:[self CGImage]];
    CIFilter *filter = [CIFilter filterWithName:@"CICircleSplashDistortion"];
    [filter setValue:image forKey:kCIInputImageKey];
    [filter setValue:center forKey:@"inputCenter"];
    [filter setValue:[NSNumber numberWithFloat:radius] forKey:@"inputRadius"];
    CIImage *result = [filter valueForKey:kCIOutputImageKey];
    CGImageRef cgImage = [context createCGImage:result fromRect:[result extent]];
    
    UIImage *returnImage = [UIImage imageWithCGImage:cgImage];
    CFRelease(cgImage);
    
    return returnImage;
}

- (UIImage * _Nonnull)be_circularWrap:(CIVector * _Nonnull)center radius:(float)radius angle:(float)angle {
    CIContext *context = [CIContext contextWithOptions:nil];
    CIImage *image = [CIImage imageWithCGImage:[self CGImage]];
    CIFilter *filter = [CIFilter filterWithName:@"CICircularWrap"];
    [filter setValue:image forKey:kCIInputImageKey];
    [filter setValue:center forKey:@"inputCenter"];
    [filter setValue:[NSNumber numberWithFloat:radius] forKey:@"inputRadius"];
    [filter setValue:[NSNumber numberWithFloat:angle] forKey:@"inputAngle"];
    CIImage *result = [filter valueForKey:kCIOutputImageKey];
    CGImageRef cgImage = [context createCGImage:result fromRect:[result extent]];
    
    UIImage *returnImage = [UIImage imageWithCGImage:cgImage];
    CFRelease(cgImage);
    
    return returnImage;
}

- (UIImage * _Nonnull)be_cmykHalftone:(CIVector * _Nonnull)center width:(float)width angle:(float)angle sharpness:(float)sharpness gcr:(float)gcr ucr:(float)ucr {
    CIContext *context = [CIContext contextWithOptions:nil];
    CIImage *image = [CIImage imageWithCGImage:[self CGImage]];
    CIFilter *filter = [CIFilter filterWithName:@"CICMYKHalftone"];
    [filter setValue:image forKey:kCIInputImageKey];
    [filter setValue:center forKey:@"inputCenter"];
    [filter setValue:[NSNumber numberWithFloat:width] forKey:@"inputWidth"];
    [filter setValue:[NSNumber numberWithFloat:angle] forKey:@"inputAngle"];
    [filter setValue:[NSNumber numberWithFloat:sharpness] forKey:@"inputSharpness"];
    [filter setValue:[NSNumber numberWithFloat:gcr] forKey:@"inputGCR"];
    [filter setValue:[NSNumber numberWithFloat:ucr] forKey:@"inputUCR"];
    CIImage *result = [filter valueForKey:kCIOutputImageKey];
    CGImageRef cgImage = [context createCGImage:result fromRect:[result extent]];
    
    UIImage *returnImage = [UIImage imageWithCGImage:cgImage];
    CFRelease(cgImage);
    
    return returnImage;
}

- (UIImage * _Nonnull)be_sepiaToneWithIntensity:(float)intensity {
    CIContext *context = [CIContext contextWithOptions:nil];
    CIImage *image = [CIImage imageWithCGImage:[self CGImage]];
    CIFilter *filter = [CIFilter filterWithName:@"CISepiaTone"];
    [filter setValue:image forKey:kCIInputImageKey];
    [filter setValue:[NSNumber numberWithFloat:intensity] forKey:@"inputIntensity"];
    CIImage *result = [filter valueForKey:kCIOutputImageKey];
    CGImageRef cgImage = [context createCGImage:result fromRect:[result extent]];
    
    UIImage *returnImage = [UIImage imageWithCGImage:cgImage];
    CFRelease(cgImage);
    
    return returnImage;
}

+ (UIImage * _Nonnull)be_imageWithColor:(UIColor * _Nonnull)color {
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, [[UIScreen mainScreen] scale]);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

- (UIImage * _Nonnull)be_blurImageWithBlur:(CGFloat)blur {
    if (blur < 0.f || blur > 1.f) {
        blur = 0.5f;
    }
    int boxSize = (int)(blur * 50);
    boxSize = boxSize - (boxSize % 2) + 1;
    
    CGImageRef img = self.CGImage;
    
    vImage_Buffer inBuffer, outBuffer;
    
    vImage_Error error;
    
    void *pixelBuffer;
    
    CGDataProviderRef inProvider = CGImageGetDataProvider(img);
    CFDataRef inBitmapData = CGDataProviderCopyData(inProvider);
    
    inBuffer.width = CGImageGetWidth(img);
    inBuffer.height = CGImageGetHeight(img);
    inBuffer.rowBytes = CGImageGetBytesPerRow(img);
    
    inBuffer.data = (void*)CFDataGetBytePtr(inBitmapData);
    
    pixelBuffer = malloc(CGImageGetBytesPerRow(img) * CGImageGetHeight(img));
    
    if (pixelBuffer == NULL) {
        NSLog(@"No pixelbuffer");
    }
    
    outBuffer.data = pixelBuffer;
    outBuffer.width = CGImageGetWidth(img);
    outBuffer.height = CGImageGetHeight(img);
    outBuffer.rowBytes = CGImageGetBytesPerRow(img);
    
    error = vImageBoxConvolve_ARGB8888(&inBuffer, &outBuffer, NULL, 0, 0, boxSize, boxSize, NULL, kvImageEdgeExtend);
    
    if (error) {
        NSLog(@"Error from convolution %ld", error);
    }
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef ctx = CGBitmapContextCreate(outBuffer.data, outBuffer.width, outBuffer.height, 8, outBuffer.rowBytes, colorSpace, (CGBitmapInfo)kCGImageAlphaNoneSkipLast);
    CGImageRef imageRef = CGBitmapContextCreateImage (ctx);
    UIImage *returnImage = [UIImage imageWithCGImage:imageRef];
    
    CGContextRelease(ctx);
    CGColorSpaceRelease(colorSpace);
    
    free(pixelBuffer);
    CFRelease(inBitmapData);
    
    CGImageRelease(imageRef);
    
    return returnImage;
}

+ (UIImage * _Nonnull)be_imageFromText:(NSString * _Nonnull)text font:(UIFont * _Nonnull)font imageSize:(CGSize)imageSize {
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, [UIScreen mainScreen].scale);
    
    [text drawAtPoint:CGPointMake(0.0, 0.0) withAttributes:@{NSFontAttributeName:font}];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

+ (UIImage * _Nonnull)be_imageWithSize:(CGSize)imageSize backgroundColor:(UIColor * _Nonnull)backgroundColor maskedText:(NSString *)string font:(UIFont * _Nonnull)font {
    NSDictionary *textAttributes = @{NSFontAttributeName:font};
    
    CGSize textSize = [string sizeWithAttributes:textAttributes];
    
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, [[UIScreen mainScreen] scale]);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(ctx, backgroundColor.CGColor);
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, imageSize.width, imageSize.height)];
    CGContextAddPath(ctx, path.CGPath);
    CGContextFillPath(ctx);
    
    CGContextSetBlendMode(ctx, kCGBlendModeDestinationOut);
    CGPoint center = CGPointMake(imageSize.width / 2 - textSize.width / 2, imageSize.height / 2 - textSize.height / 2);
    [string drawAtPoint:center withAttributes:textAttributes];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
}

@end

