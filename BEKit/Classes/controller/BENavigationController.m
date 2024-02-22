//
//  BENavigationController.m
//  Pods
//
//  Created by dalong on 16/4/8.
//
//

#import "BENavigationController.h"

@implementation BENavigationController

#pragma mark -
#pragma mark - 状态栏控制
- (BOOL)prefersStatusBarHidden {
    return self.topViewController.prefersStatusBarHidden;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return self.topViewController.preferredStatusBarStyle;
}

- (UIStatusBarAnimation)preferredStatusBarUpdateAnimation {
    return self.topViewController.preferredStatusBarUpdateAnimation;
}

#pragma mark -
#pragma mark - 旋转控制
- (BOOL)shouldAutorotate{
    return [self.visibleViewController shouldAutorotate];
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
    return [self.visibleViewController preferredInterfaceOrientationForPresentation];
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    if (![self.visibleViewController isKindOfClass:[UIAlertController class]]) {//iOS9 UIWebRotatingAlertController
        return [self.visibleViewController supportedInterfaceOrientations];
    } else {
        return UIInterfaceOrientationMaskPortrait;
    }
}

#pragma mark -
#pragma mark - 其他
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

@end
