//
//  UIScreen+BEKit.h
//  BEKit
//
//  Created by sundanlong on 16/4/11.
//
//

@import UIKit;

#define BE_SCREEN_WIDTH [[UIScreen mainScreen] fixedScreenSize].width
#define BE_SCREEN_HEIGHT [[UIScreen mainScreen] fixedScreenSize].height

#define BE_IS_IPHONE_4_OR_LESS [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone && BE_SCREEN_MAX_LENGTH < 568.0
#define BE_IS_IPHONE_5 [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone && BE_SCREEN_MAX_LENGTH == 568.0
#define BE_IS_IPHONE_6 [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone && BE_SCREEN_MAX_LENGTH == 667.0
#define BE_IS_IPHONE_6P [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone && BE_SCREEN_MAX_LENGTH == 736.0
#define BE_IS_IPAD [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad && BE_SCREEN_MAX_LENGTH == 1024.0
#define BE_IS_IPHONEX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125,2436), [[UIScreen mainScreen] currentMode].size) : NO)

@interface UIScreen (BEKit)

+ (BOOL)be_isRetina;
+ (BOOL)be_isRetinaHD;

- (CGSize)be_fixedScreenSize;

+ (CGFloat)be_brightness;
+ (void)be_setBrightness:(CGFloat)brightness;

@end
