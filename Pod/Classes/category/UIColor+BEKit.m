//
//  UIColor+BEKit.m
//  BEKit
//
//  Created by sundanlong on 16/4/11.
//
//

#import "UIColor+BEKit.h"

@implementation UIColor (BEKit)

+ (UIColor * _Nonnull)be_hex:(NSString *)hexString {
    NSString *colorString = [[hexString stringByReplacingOccurrencesOfString:@"#" withString:@""] uppercaseString];
    CGFloat alpha, red, blue, green;
    switch ([colorString length]) {
        case 3: // #RGB
            alpha = 1.0f;
            red = [self be_colorComponentFrom:colorString start:0 length:1];
            green = [self be_colorComponentFrom:colorString start:1 length:1];
            blue = [self be_colorComponentFrom:colorString start:2 length:1];
            break;
        case 4: // #ARGB
            alpha = [self be_colorComponentFrom:colorString start:0 length:1];
            red = [self be_colorComponentFrom:colorString start:1 length:1];
            green = [self be_colorComponentFrom:colorString start:2 length:1];
            blue = [self be_colorComponentFrom:colorString start:3 length:1];
            break;
        case 6: // #RRGGBB
            alpha = 1.0f;
            red = [self be_colorComponentFrom:colorString start:0 length:2];
            green = [self be_colorComponentFrom:colorString start:2 length:2];
            blue = [self be_colorComponentFrom:colorString start:4 length:2];
            break;
        case 8: // #AARRGGBB
            alpha = [self be_colorComponentFrom:colorString start:0 length:2];
            red = [self be_colorComponentFrom:colorString start:2 length:2];
            green = [self be_colorComponentFrom:colorString start:4 length:2];
            blue = [self be_colorComponentFrom:colorString start:6 length:2];
            break;
        default:
            return nil;
            break;
    }
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

+ (CGFloat)be_colorComponentFrom:(NSString * _Nonnull)string start:(NSUInteger)start length:(NSUInteger)length {
    NSString *substring = [string substringWithRange:NSMakeRange(start, length)];
    NSString *fullHex = length == 2 ? substring : [NSString stringWithFormat:@"%@%@", substring, substring];
    unsigned hexComponent;
    [[NSScanner scannerWithString:fullHex] scanHexInt:&hexComponent];
    
    return hexComponent / 255.0;
}

+ (id _Nonnull)be_colorWithHex:(unsigned int)hex {
	return [UIColor be_colorWithHex:hex alpha:1.0];
}

+ (id _Nonnull)be_colorWithHex:(unsigned int)hex alpha:(float)alpha {
	return [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16)) / 255.0 green:((float)((hex & 0xFF00) >> 8)) / 255.0 blue:((float)(hex & 0xFF)) / 255.0 alpha:alpha];
}

+ (UIColor * _Nonnull)be_randomColor {
	int r = arc4random() % 255;
	int g = arc4random() % 255;
	int b = arc4random() % 255;
    
	return [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0];
}

+ (UIColor * _Nonnull)be_colorWithColor:(UIColor * _Nonnull)color alpha:(float)alpha {
    return [color colorWithAlphaComponent:alpha];
}

- (BOOL)be_canProvideRGBComponents {
    switch (CGColorSpaceGetModel(CGColorGetColorSpace(self.CGColor))) {
        case kCGColorSpaceModelRGB:
        case kCGColorSpaceModelMonochrome:
            return YES;
        default:
            return NO;
    }
}

- (CGFloat)red {
    if (self.be_canProvideRGBComponents) {
        const CGFloat *c = CGColorGetComponents(self.CGColor);
        return c[0];
    }
    
    return 0.0;
}

- (CGFloat)green {
    if (self.be_canProvideRGBComponents) {
        const CGFloat *c = CGColorGetComponents(self.CGColor);
        if (CGColorSpaceGetModel(CGColorGetColorSpace(self.CGColor)) == kCGColorSpaceModelMonochrome)
            return c[0];
        return c[1];
    }
    
    return 0.0;
}

- (CGFloat)blue {
    if (self.be_canProvideRGBComponents) {
        const CGFloat *c = CGColorGetComponents(self.CGColor);
        if (CGColorSpaceGetModel(CGColorGetColorSpace(self.CGColor)) == kCGColorSpaceModelMonochrome)
            return c[0];
        return c[2];
    }
    
    return 0.0;
}

- (CGFloat)white {
    if (CGColorSpaceGetModel(CGColorGetColorSpace(self.CGColor)) == kCGColorSpaceModelMonochrome) {
        const CGFloat *c = CGColorGetComponents(self.CGColor);
        return c[0];
    }
    
    return 0.0;
}

- (CGFloat)hue {
    if (self.be_canProvideRGBComponents) {
        CGFloat h = 0.0f;
        [self hue:&h saturation:nil brightness:nil alpha:nil];
        return h;
    }
    
    return 0.0;
}

- (CGFloat)saturation {
    if (self.be_canProvideRGBComponents) {
        CGFloat s = 0.0f;
        [self hue:nil saturation:&s brightness:nil alpha:nil];
        return s;
    }
    
    return 0.0;
}

- (CGFloat)brightness {
    if (self.be_canProvideRGBComponents) {
        CGFloat v = 0.0f;
        [self hue:nil saturation:nil brightness:&v alpha:nil];
        return v;
    }
    
    return 0.0;
}

- (CGFloat)alpha {
    return CGColorGetAlpha(self.CGColor);
}

- (BOOL)hue:(CGFloat * _Nullable)hue saturation:(CGFloat * _Nullable)saturation brightness:(CGFloat * _Nullable)brightness alpha:(CGFloat * _Nullable)alpha {
    CGFloat r, g, b, a;
    if (![self red:&r green:&g blue:&b alpha:&a]) {
        return NO;
    }
    
    [UIColor red:r green:g blue:b toHue:hue saturation:saturation brightness:brightness];
    
    if (alpha)
        *alpha = a;
    
    return YES;
}

- (BOOL)red:(CGFloat * _Nonnull)red green:(CGFloat * _Nonnull)green blue:(CGFloat * _Nonnull)blue alpha:(CGFloat * _Nullable)alpha {
    const CGFloat *components = CGColorGetComponents(self.CGColor);
    
    CGFloat r, g, b, a;
    
    switch (CGColorSpaceGetModel(CGColorGetColorSpace(self.CGColor))) {
        case kCGColorSpaceModelMonochrome:
            r = g = b = components[0];
            a = components[1];
            break;
        case kCGColorSpaceModelRGB:
            r = components[0];
            g = components[1];
            b = components[2];
            a = components[3];
            break;
        default:
            return NO;
    }
    
    if (red) {
        *red = r;
    }
    
    if (green) {
        *green = g;
    }
    
    if (blue) {
        *blue = b;
    }
    
    if (alpha) {
        *alpha = a;
    }
    
    return YES;
}

+ (void)red:(CGFloat)r green:(CGFloat)g blue:(CGFloat)b toHue:(CGFloat * _Nonnull)pH saturation:(CGFloat * _Nonnull)pS brightness:(CGFloat * _Nonnull)pV {
    CGFloat h,s,v;
    
    CGFloat max = MAX(r, MAX(g, b));
    CGFloat min = MIN(r, MIN(g, b));
    
    v = max;
    
    s = (max != 0.0f) ? ((max - min) / max) : 0.0f;
    
    if (s == 0.0f) {
        h = 0.0f;
    } else {
        CGFloat rc = (max - r) / (max - min);
        CGFloat gc = (max - g) / (max - min);
        CGFloat bc = (max - b) / (max - min);
        
        if (r == max) {
            h = bc - gc;
        } else if (g == max) {
            h = 2 + rc - bc;
        } else {
            h = 4 + gc - rc;
        }
        
        h *= 60.0f;
        if (h < 0.0f) {
            h += 360.0f;
        }
    }
    
    if (pH) {
        *pH = h;
    }
    if (pS) {
        *pS = s;
    }
    if (pV) {
        *pV = v;
    }
}

@end
