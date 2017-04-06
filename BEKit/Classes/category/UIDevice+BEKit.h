//
//  UIDevice+BEKit.h
//  BEKit
//
//  Created by sundanlong on 16/4/11.
//
//

@import Foundation;
@import UIKit;

@interface UIDevice (BEKit)

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

+ (NSUInteger)be_cpuNumber;

+ (NSUInteger)be_totalMemory;

+ (NSUInteger)be_userMemory;

//当前设备总磁盘空间
+ (NSNumber * _Nonnull)be_totalDiskSpace;

//当前设备剩余磁盘空间
+ (NSNumber * _Nonnull)be_freeDiskSpace;

+ (NSString * _Nonnull)be_uniqueIdentifier;

+ (void)be_updateUniqueIdentifier:(NSObject * _Nonnull)uniqueIdentifier block:(void (^ _Nullable)(BOOL isValid, BOOL hasToUpdateUniqueIdentifier, NSString * _Nullable oldUUID))block;

@end
