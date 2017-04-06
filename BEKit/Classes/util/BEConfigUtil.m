//
//  BEConfigUtil.m
//  BEKit
//
//  Created by sundanlong on 16/4/11.
//
//

#import "BEConfigUtil.h"

@implementation BEConfigUtil

+ (void)be_onFirstLaunch:(void (^ _Nullable)(BOOL isFirstLaunch))block {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    BOOL hasLaunched = [defaults boolForKey:@"BE_App_Launched"];
    if (hasLaunched == NO) {
        [defaults setBool:YES forKey:@"BE_App_Launched"];
        [defaults synchronize];
    }
    block(!hasLaunched);
}

+ (void)be_onFirstLaunchForCurrentVersion:(void (^ _Nullable)(BOOL isFirstLaunchForCurrentVersion))block {
    NSString *lastLaunchKey = [NSString stringWithFormat:@"BE_App_Launched%@", BE_APP_VERSION];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    BOOL hasLaunched = [defaults boolForKey:lastLaunchKey];
    if (hasLaunched == NO) {
        [defaults setBool:YES forKey:lastLaunchKey];
        [defaults synchronize];
    }
    block(!hasLaunched);
}

+ (void)be_onFirstLaunchForVersion:(NSString * _Nonnull)version
                          block:(void (^ _Nullable)(BOOL isFirstLaunchForVersion))block {
    NSString *lastLaunchKey = [NSString stringWithFormat:@"BE_App_Launched%@", version];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    BOOL hasLaunched = [defaults boolForKey:lastLaunchKey];
    if (hasLaunched == NO) {
        [defaults setBool:YES forKey:lastLaunchKey];
        [defaults synchronize];
    }
    block(!hasLaunched);
}

+ (BOOL)be_isFirstLaunch {
    return ![[NSUserDefaults standardUserDefaults] boolForKey:@"BE_App_Launched"];
}

+ (BOOL)be_isFirstLaunchForCurrentVersion {
    NSString *lastLaunchKey = [NSString stringWithFormat:@"BE_App_Launched%@", BE_APP_VERSION];
    return ![[NSUserDefaults standardUserDefaults] boolForKey:lastLaunchKey];
}

+ (BOOL)be_isFirstLaunchForVersion:(NSString * _Nonnull)version {
    NSString *lastLaunchKey = [NSString stringWithFormat:@"BE_App_Launched%@", version];
    return ![[NSUserDefaults standardUserDefaults] boolForKey:lastLaunchKey];
}

@end
