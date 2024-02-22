//
//  BEConfigUtil.h
//  BEKit
//
//  Created by dalong on 16/4/11.
//
//

#import <Foundation/Foundation.h>

@interface BEConfigUtil : NSObject

+ (void)be_onFirstLaunch:(void (^ _Nullable)(BOOL isFirstLaunch))block;
+ (void)be_onFirstLaunchForCurrentVersion:(void (^ _Nullable)(BOOL isFirstLaunchForCurrentVersion))block;
+ (void)be_onFirstLaunchForVersion:(NSString * _Nonnull)version
                          block:(void (^ _Nullable)(BOOL isFirstLaunchForVersion))block;

+ (BOOL)be_isFirstLaunch;
+ (BOOL)be_isFirstLaunchForCurrentVersion;
+ (BOOL)be_isFirstLaunchForVersion:(NSString * _Nonnull)version;

@end
