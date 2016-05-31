//
//  BEAppDelegate.h
//  BEKit
//
//  Created by 孙丹龙 on 04/08/2016.
//  Copyright (c) 2016 孙丹龙. All rights reserved.
//

@import UIKit;

#define BE_AppDelegate ((BEAppDelegate *)[[UIApplication sharedApplication] delegate])

@interface BEAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

//@property (nonatomic, copy) void (^viewWillAppearBlock)(NSString *pageName, BOOL animated);
//@property (nonatomic, copy) void (^viewWillDisappearBlock)(NSString *pageName, BOOL animated);
//@property (nonatomic, copy) void (^viewDidAppearBlock)(NSString *pageName, BOOL animated);
//@property (nonatomic, copy) void (^viewDidDisappearBlock)(NSString *pageName, BOOL animated);

@end
