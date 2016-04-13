//
//  UIDevice+BEKit.h
//  BEKit
//
//  Created by sundanlong on 16/4/11.
//
//

@import Foundation;
@import UIKit;

/**
 *  This category adds some useful methods to UIDevice
 *
 *  SCREEN_WIDTH: Get the screen width
 *
 *  SCREEN_HEIGHT: Get the screen height
 *
 *  IOS_VERSION: Get the iOS version string
 *
 *  SYSTEM_VERSION_...: Macros to compare system versions
 *
 *  IS_IOS_..._OR_LATER: Macros that returns if the iOS version is greater or equal to choosed one
 */
@interface UIDevice (BEKit)

//系统版本号，比如：9.0
#define BE_IOS_VERSION [UIDevice currentDevice].systemVersion

//系统版本号比较
#define BE_SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define BE_SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define BE_SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define BE_SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define BE_SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

#define IS_IOS_5_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 5.0)
#define IS_IOS_6_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 6.0)
#define IS_IOS_7_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
#define IS_IOS_8_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
#define IS_IOS_9_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0)

//设备平台，比如：iPhone7,2
+ (NSString * _Nonnull)be_devicePlatform;

//设备平台描述，比如：iPad Air (Cellular)
+ (NSString * _Nonnull)be_devicePlatformString;

+ (BOOL)be_isiPad;
+ (BOOL)be_isiPhone;
+ (BOOL)be_isiPod;
+ (BOOL)be_isAppleTV;
+ (BOOL)be_isAppleWatch;
+ (BOOL)be_isSimulator;

//iOS版本，比如：7
+ (NSInteger)be_iOSVersion;

//当前设备CPU频率
+ (NSUInteger)be_cpuFrequency;

//当前设备总线频率
+ (NSUInteger)be_busFrequency;

//当前设备内存大小
+ (NSUInteger)be_ramSize;

/**
 *  Returns the current device CPU number
 *
 *  @return Returns the current device CPU number
 */
+ (NSUInteger)be_cpuNumber;

/**
 *  Returns the current device total memory
 *
 *  @return Returns the current device total memory
 */
+ (NSUInteger)be_totalMemory;

/**
 *  Returns the current device non-kernel memory
 *
 *  @return Returns the current device non-kernel memory
 */
+ (NSUInteger)be_userMemory;

//当前设备总磁盘空间
+ (NSNumber * _Nonnull)be_totalDiskSpace;

//当前设备剩余磁盘空间
+ (NSNumber * _Nonnull)be_freeDiskSpace;

/**
 *  Generate an unique identifier and store it into standardUserDefaults
 *
 *  @return Returns a unique identifier as a NSString
 */
+ (NSString * _Nonnull)be_uniqueIdentifier;

/**
 *  Save the unique identifier or update it if there is and it is changed.
 *  Is useful for push notification to know if the unique identifier has changed and needs to be send to server
 *
 *  @param uniqueIdentifier The unique identifier to save or update if needed. (Must be NSData or NSString)
 *  @param block            The execution block that know if the unique identifier is valid and has to be updated. You have to handle the case if it is valid and the update is needed or not
 */
+ (void)be_updateUniqueIdentifier:(NSObject * _Nonnull)uniqueIdentifier block:(void (^ _Nullable)(BOOL isValid, BOOL hasToUpdateUniqueIdentifier, NSString * _Nullable oldUUID))block;

@end
