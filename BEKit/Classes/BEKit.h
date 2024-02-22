//
//  BEKit.h
//  BEKit
//
//  Created by dalong on 16/4/11.
//
//

#import <Foundation/Foundation.h>

//! Project version number for BEKit.
FOUNDATION_EXPORT double BEKitVersionNumber;

//! Project version string for BEKit.
FOUNDATION_EXPORT const unsigned char BEKitVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <BEKit/PublicHeader.h>

//controller
#import <BEKit/BEAppDelegate.h>
#import <BEKit/BEViewController.h>
#import <BEKit/BETabBarController.h>
#import <BEKit/BENavigationController.h>

//util
#import <BEKit/BELog.h>
#import <BEKit/BEConfigUtil.h>
#import <BEKit/BESystemSound.h>
#import <BEKit/BECryptographyUtil.h>

//category
#import <BEKit/NSArray+BEKit.h>
#import <BEKit/NSData+BEKit.h>
#import <BEKit/NSDate+BEKit.h>
#import <BEKit/NSDictionary+BEKit.h>
#import <BEKit/NSFileManager+BEKit.h>
#import <BEKit/NSMutableArray+BEKit.h>
#import <BEKit/NSNumber+BEKit.h>
#import <BEKit/NSObject+BEKit.h>
#import <BEKit/NSString+BEKit.h>
#import <BEKit/NSThread+BEKit.h>
#import <BEKit/UIButton+BEKit.h>
#import <BEKit/UIColor+BEKit.h>
#import <BEKit/UIDevice+BEKit.h>
#import <BEKit/UIImage+BEKit.h>
#import <BEKit/UIImageView+BEKit.h>
#import <BEKit/UILabel+BEKit.h>
#import <BEKit/UINavigationBar+BEKit.h>
#import <BEKit/UIScreen+BEKit.h>
#import <BEKit/UIToolbar+BEKit.h>
#import <BEKit/UIView+BEKit.h>
#import <BEKit/UITableView+BEKit.h>

//ui
#import <BEKit/BEView.h>
#import <BEKit/BETextField.h>
#import <BEKit/BEImageView.h>
#import <BEKit/BETableViewCell.h>

#import <BEKit/BEObjcMsgSend.h>

/**
 *  Get App name
 */
#define BE_APP_NAME [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"]

/**
 *  Get App build
 */
#define BE_APP_BUILD [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]

/**
 *  Get App version
 */
#define BE_APP_VERSION [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

/**
 *  Get App Bundle id
 */
#define BE_APP_BundleId [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"]

/**
 *  Use BELocalizedString to use the string translated by BEKit
 */
#define BELocalizedString(key, comment) \
[[NSBundle mainBundle] localizedStringForKey:(key) value:@"" table:@"BEKit"]

#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;

//G－C－D
#define BACK(block) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block)
#define MAIN(block) dispatch_async(dispatch_get_main_queue(),block)

#if __has_feature(objc_arc) // ARC

#else // 非ARC

#endif

//单例化一个类
#define BE_SINGLETON_FOR_H(classname) + (instancetype)shared##classname;
#define BE_SINGLETON_FOR_M(classname) \
\
static id _instance = nil; \
\
+ (instancetype)shared##classname \
{ \
    static dispatch_once_t onceToken; \
    dispatch_once(&onceToken, ^{ \
        _instance = [[self alloc] init]; \
    }); \
    return _instance; \
} \
\
+ (instancetype)allocWithZone:(struct _NSZone *)zone \
{ \
    static dispatch_once_t onceToken; \
    dispatch_once(&onceToken, ^{ \
        _instance = [super allocWithZone:zone]; \
    }); \
    return _instance; \
} \
\
- (id)copyWithZone:(NSZone *)zone \
{ \
return _instance; \
}\
\
- (id)mutableCopyWithZone:(NSZone *)zone \
{ \
    return _instance; \
}
