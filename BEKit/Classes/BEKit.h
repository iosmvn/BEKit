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
#import "UIColor+BEKit.h"
#import "UIDevice+BEKit.h"
#import "UIImage+BEKit.h"
#import "UIImageView+BEKit.h"
#import "UILabel+BEKit.h"
#import "UINavigationBar+BEKit.h"
#import "UIScreen+BEKit.h"
#import "UIToolbar+BEKit.h"
#import "UIView+BEKit.h"

//ui
#import "BEView.h"
#import "BETextField.h"
#import "BEImageView.h"
#import "BETableViewCell.h"

#define APP_BUILD [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]
#define APP_VERSION [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
#define APP_NAME [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"]

#define BFLocalizedString(key, comment) \
[[NSBundle mainBundle] localizedStringForKey:(key) value:@"" table:@"BEKit"]

//G－C－D
#define BACK(block) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block)
#define MAIN(block) dispatch_async(dispatch_get_main_queue(),block)

//单例化一个类
#define BE_SINGLETON_FOR_HEADER(classname)\
\
+(className *)shared##classname;

#define BE_SINGLETON_FOR_CLASS(classname) \
\
static classname *shared##classname = nil; \
\
+ (classname *)shared##classname \
{ \
@synchronized(self) \
{ \
if (shared##classname == nil) \
{ \
shared##classname = [[self alloc] init]; \
} \
} \
\
return shared##classname; \
} \
\
+ (id)allocWithZone:(NSZone *)zone \
{ \
@synchronized(self) \
{ \
if (shared##classname == nil) \
{ \
shared##classname = [super allocWithZone:zone]; \
return shared##classname; \
} \
} \
\
return nil; \
} \
\
- (id)copyWithZone:(NSZone *)zone \
{ \
return self; \
}

#endif /* BEKit_h */
