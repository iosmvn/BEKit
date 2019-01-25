//
//  BEKit.h
//  BEKit
//
//  Created by sundanlong on 16/4/11.
//
//

#ifndef BEKit_h
#define BEKit_h

//controller
#import "BEAppDelegate.h"
#import "BEViewController.h"
#import "BETabBarController.h"
#import "BENavigationController.h"

//util
#import "BELog.h"
#import "BEConfigUtil.h"
#import "BESystemSound.h"
#import "BECryptographyUtil.h"

//category
#import "NSArray+BEKit.h"
#import "NSData+BEKit.h"
#import "NSDate+BEKit.h"
#import "NSDictionary+BEKit.h"
#import "NSFileManager+BEKit.h"
#import "NSMutableArray+BEKit.h"
#import "NSNumber+BEKit.h"
#import "NSObject+BEKit.h"
#import "NSString+BEKit.h"
#import "NSThread+BEKit.h"
#import "UIButton+BEKit.h"
#import "UIColor+BEKit.h"
#import "UIDevice+BEKit.h"
#import "UIImage+BEKit.h"
#import "UIImageView+BEKit.h"
#import "UILabel+BEKit.h"
#import "UINavigationBar+BEKit.h"
#import "UIScreen+BEKit.h"
#import "UIToolbar+BEKit.h"
#import "UIView+BEKit.h"
#import "UITableView+BEKit.h"

//ui
#import "BEView.h"
#import "BETextField.h"
#import "BEImageView.h"
#import "BETableViewCell.h"

#import "BEObjcMsgSend.h"

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

#endif /* BEKit_h */
