//
//  UIDevice+BEKit.m
//  BEKit
//
//  Created by sundanlong on 16/4/11.
//
//

#import "UIDevice+BEKit.h"
#import "UIScreen+BEKit.h"
#import "NSString+BEKit.h"
#import "NSData+BEKit.h"
#include <sys/types.h>
#include <sys/sysctl.h>
#include <sys/socket.h>
#include <net/if.h>
#include <net/if_dl.h>

static NSString * const BEUniqueIdentifierDefaultsKey = @"BEUniqueIdentifier";
static NSString * const BEUserUniqueIdentifierDefaultsKey = @"BEUserUniqueIdentifier";

@implementation UIDevice (BEKit)

+ (NSString * _Nonnull)be_devicePlatform {
    size_t size;
    sysctlbyname("hw.machine", NULL, &size, NULL, 0);
    char *machine = malloc(size);
    sysctlbyname("hw.machine", machine, &size, NULL, 0);
    NSString *platform = [NSString stringWithUTF8String:machine];
    free(machine);
    return platform;
}

+ (NSString * _Nonnull)be_devicePlatformString {//https://www.theiphonewiki.com/wiki/Models
    NSString *platform = [self be_devicePlatform];
    // iPhone
    if ([platform isEqualToString:@"iPhone1,1"])    return @"iPhone 2G";
    if ([platform isEqualToString:@"iPhone1,2"])    return @"iPhone 3G";
    if ([platform isEqualToString:@"iPhone2,1"])    return @"iPhone 3GS";
    if ([platform isEqualToString:@"iPhone3,1"])    return @"iPhone 4 (GSM)";
    if ([platform isEqualToString:@"iPhone3,2"])    return @"iPhone 4 (Rev. A)";
    if ([platform isEqualToString:@"iPhone3,3"])    return @"iPhone 4 (CDMA)";
    if ([platform isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
    if ([platform isEqualToString:@"iPhone5,1"])    return @"iPhone 5 (GSM)";
    if ([platform isEqualToString:@"iPhone5,2"])    return @"iPhone 5 (CDMA)";
    if ([platform isEqualToString:@"iPhone5,3"])    return @"iPhone 5c (GSM)";
    if ([platform isEqualToString:@"iPhone5,4"])    return @"iPhone 5c (Global)";
    if ([platform isEqualToString:@"iPhone6,1"])    return @"iPhone 5s (GSM)";
    if ([platform isEqualToString:@"iPhone6,2"])    return @"iPhone 5s (Global)";
    if ([platform isEqualToString:@"iPhone7,1"])    return @"iPhone 6 Plus";
    if ([platform isEqualToString:@"iPhone7,2"])    return @"iPhone 6";
    if ([platform isEqualToString:@"iPhone8,1"])    return @"iPhone 6s";
    if ([platform isEqualToString:@"iPhone8,2"])    return @"iPhone 6s Plus";
    if ([platform isEqualToString:@"iPhone8,4"])    return @"iPhone SE";
    // iPod
    if ([platform isEqualToString:@"iPod1,1"])      return @"iPod Touch 1G";
    if ([platform isEqualToString:@"iPod2,1"])      return @"iPod Touch 2G";
    if ([platform isEqualToString:@"iPod3,1"])      return @"iPod Touch 3G";
    if ([platform isEqualToString:@"iPod4,1"])      return @"iPod Touch 4G";
    if ([platform isEqualToString:@"iPod5,1"])      return @"iPod Touch 5G";
    if ([platform isEqualToString:@"iPod7,1"])      return @"iPod Touch 6G";
    // iPad
    if ([platform isEqualToString:@"iPad1,1"])      return @"iPad 1";
    if ([platform isEqualToString:@"iPad2,1"])      return @"iPad 2 (WiFi)";
    if ([platform isEqualToString:@"iPad2,2"])      return @"iPad 2 (GSM)";
    if ([platform isEqualToString:@"iPad2,3"])      return @"iPad 2 (CDMA)";
    if ([platform isEqualToString:@"iPad2,4"])      return @"iPad 2 (32nm)";
    if ([platform isEqualToString:@"iPad3,1"])      return @"iPad 3 (WiFi)";
    if ([platform isEqualToString:@"iPad3,2"])      return @"iPad 3 (CDMA)";
    if ([platform isEqualToString:@"iPad3,3"])      return @"iPad 3 (GSM)";
    if ([platform isEqualToString:@"iPad3,4"])      return @"iPad 4 (WiFi)";
    if ([platform isEqualToString:@"iPad3,5"])      return @"iPad 4 (GSM)";
    if ([platform isEqualToString:@"iPad3,6"])      return @"iPad 4 (CDMA)";
    if ([platform isEqualToString:@"iPad4,1"])      return @"iPad Air (WiFi)";
    if ([platform isEqualToString:@"iPad4,2"])      return @"iPad Air (Cellular)";
    if ([platform isEqualToString:@"iPad4,3"])      return @"iPad Air (China)";
    if ([platform isEqualToString:@"iPad5,3"])      return @"iPad Air 2 (WiFi)";
    if ([platform isEqualToString:@"iPad5,4"])      return @"iPad Air 2 (Cellular)";
    // iPad Pro 9.7 inch
    if ([platform isEqualToString:@"iPad6,3"])      return @"iPad Pro (9.7 inch)";
    if ([platform isEqualToString:@"iPad6,4"])      return @"iPad Pro (9.7 inch)";
    // iPad Pro (12.9 inch)
    if ([platform isEqualToString:@"iPad6,7"])      return @"iPad Pro (WiFi)";
    if ([platform isEqualToString:@"iPad6,8"])      return @"iPad Pro (Cellular)";
    // iPad mini
    if ([platform isEqualToString:@"iPad2,5"])      return @"iPad mini (WiFi)";
    if ([platform isEqualToString:@"iPad2,6"])      return @"iPad mini (GSM)";
    if ([platform isEqualToString:@"iPad2,7"])      return @"iPad mini (CDMA)";
    if ([platform isEqualToString:@"iPad4,4"])      return @"iPad mini 2 (WiFi)";
    if ([platform isEqualToString:@"iPad4,5"])      return @"iPad mini 2 (Cellular)";
    if ([platform isEqualToString:@"iPad4,6"])      return @"iPad mini 2 (China)";
    if ([platform isEqualToString:@"iPad4,7"])      return @"iPad mini 3 (WiFi)";
    if ([platform isEqualToString:@"iPad4,8"])      return @"iPad mini 3 (Cellular)";
    if ([platform isEqualToString:@"iPad4,9"])      return @"iPad mini 3 (China)";
    if ([platform isEqualToString:@"iPad5,1"])      return @"iPad mini 4 (WiFi)";
    if ([platform isEqualToString:@"iPad5,2"])      return @"iPad mini 4 (Cellular)";
    // Apple TV
    if ([platform isEqualToString:@"AppleTV2,1"])   return @"Apple TV 2G";
    if ([platform isEqualToString:@"AppleTV3,1"])   return @"Apple TV 3G";
    if ([platform isEqualToString:@"AppleTV3,2"])   return @"Apple TV 3G";
    if ([platform isEqualToString:@"AppleTV5,3"])   return @"Apple TV 4G";
    // Apple Watch
    if ([platform isEqualToString:@"Watch1,1"])     return @"Apple Watch 38mm";
    if ([platform isEqualToString:@"Watch1,2"])     return @"Apple Watch 42mm";
    // Simulator
    if ([platform isEqualToString:@"i386"])         return @"Simulator";
    if ([platform isEqualToString:@"x86_64"])       return @"Simulator";
    
    return platform;
}

+ (BOOL)be_isiPad {
    if ([[[self be_devicePlatform] substringToIndex:4] isEqualToString:@"iPad"]) {
        return YES;
    } else {
        return NO;
    }
}

+ (BOOL)be_isiPhone {
    if ([[[self be_devicePlatform] substringToIndex:6] isEqualToString:@"iPhone"]) {
        return YES;
    } else {
        return NO;
    }
}

+ (BOOL)be_isiPod {
    if ([[[self be_devicePlatform] substringToIndex:4] isEqualToString:@"iPod"]) {
        return YES;
    } else {
        return NO;
    }
}

+ (BOOL)be_isAppleTV {
    if ([[[self be_devicePlatform] substringToIndex:7] isEqualToString:@"AppleTV"]) {
        return YES;
    } else {
        return NO;
    }
}

+ (BOOL)be_isAppleWatch {
    if ([[[self be_devicePlatform] substringToIndex:5] isEqualToString:@"Watch"]) {
        return YES;
    } else {
        return NO;
    }
}

+ (BOOL)be_isSimulator {
    if ([[self be_devicePlatform] isEqualToString:@"i386"] || [[self be_devicePlatform] isEqualToString:@"x86_64"]) {
        return YES;
    } else {
        return NO;
    }
}

+ (NSInteger)be_iOSVersion {
    return [[[UIDevice currentDevice] systemVersion] integerValue];
}

+ (NSUInteger)be_getSysInfo:(uint)typeSpecifier {
    size_t size = sizeof(int);
    int results;
    int mib[2] = {CTL_HW, typeSpecifier};
    sysctl(mib, 2, &results, &size, NULL, 0);
    return (NSUInteger) results;
}

+ (NSUInteger)be_cpuFrequency {
    return [self be_getSysInfo:HW_CPU_FREQ];
}

+ (NSUInteger)be_busFrequency {
    return [self be_getSysInfo:HW_TB_FREQ];
}

+ (NSUInteger)be_ramSize {
    return [self be_getSysInfo:HW_MEMSIZE];
}

+ (NSUInteger)be_cpuNumber {
    return [self be_getSysInfo:HW_NCPU];
}

+ (NSUInteger)be_totalMemory {
    return [self be_getSysInfo:HW_PHYSMEM];
}

+ (NSUInteger)be_userMemory {
    return [self be_getSysInfo:HW_USERMEM];
}

+ (NSNumber * _Nonnull)be_totalDiskSpace {
    NSDictionary *attributes = [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory() error:nil];
    return [attributes objectForKey:NSFileSystemSize];
}

+ (NSNumber * _Nonnull)be_freeDiskSpace {
    NSDictionary *attributes = [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory() error:nil];
    return [attributes objectForKey:NSFileSystemFreeSize];
}

+ (NSString * _Nonnull)be_uniqueIdentifier {
    NSString *UUID;
    if ([[UIDevice currentDevice] respondsToSelector:@selector(identifierForVendor)]) {
        UUID = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    } else {
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        UUID = [defaults stringForKey:BEUniqueIdentifierDefaultsKey];
        if (!UUID) {
            UUID = [NSString be_generateUUID];
            [defaults setObject:UUID forKey:BEUniqueIdentifierDefaultsKey];
            [defaults synchronize];
        }
    }
    return UUID;
}

+ (void)be_updateUniqueIdentifier:(NSObject * _Nonnull)uniqueIdentifier block:(void (^ _Nullable)(BOOL isValid, BOOL hasToUpdateUniqueIdentifier, NSString * _Nullable oldUUID))block {
    NSString *userUUID, *savedUUID = nil;
    BOOL isValid = false, hasToUpdate = false;
    
    if ([uniqueIdentifier isKindOfClass:[NSData class]]) {
        userUUID = [(NSData *)uniqueIdentifier be_convertUUIDToString];
    } else if ([uniqueIdentifier isKindOfClass:[NSString class]]) {
        userUUID = [(NSString *)uniqueIdentifier be_convertToAPNSUUID];
    }
    
    isValid = [userUUID be_isUUIDForAPNS];
    
    if (isValid) {
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        savedUUID = [defaults stringForKey:BEUserUniqueIdentifierDefaultsKey];
        if (!savedUUID || ![savedUUID isEqualToString:userUUID]) {
            [defaults setObject:userUUID forKey:BEUserUniqueIdentifierDefaultsKey];
            [defaults synchronize];
            
            hasToUpdate = true;
        }
    }
    
    block(isValid, hasToUpdate, savedUUID);
}

@end
