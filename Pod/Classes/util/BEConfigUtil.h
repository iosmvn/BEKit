//
//  BEConfigUtil.h
//  BEKit
//
//  Created by sundanlong on 16/4/11.
//
//

#import <Foundation/Foundation.h>

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
 *  Use BELocalizedString to use the string translated by BEKit
 */
#define BELocalizedString(key, comment) \
    [[NSBundle mainBundle] localizedStringForKey:(key) value:@"" table:@"BEKit"]

/**
 *  Get AppDelegate
 */
//#define APP_DELEGATE ((AppDelegate *)[[UIApplication sharedApplication] delegate])


@interface BEConfigUtil : NSObject

+ (void)be_onFirstLaunch:(void (^ _Nullable)(BOOL isFirstLaunch))block;
+ (void)be_onFirstLaunchForCurrentVersion:(void (^ _Nullable)(BOOL isFirstLaunchForCurrentVersion))block;
+ (void)be_onFirstLaunchForVersion:(NSString * _Nonnull)version
                          block:(void (^ _Nullable)(BOOL isFirstLaunchForVersion))block;

+ (BOOL)be_isFirstLaunch;
+ (BOOL)be_isFirstLaunchForCurrentVersion;
+ (BOOL)be_isFirstLaunchForVersion:(NSString * _Nonnull)version;

@end
