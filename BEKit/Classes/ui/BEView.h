//
//  BEView.h
//  Pods
//
//  Created by dalong on 16/4/13.
//
//

#import <UIKit/UIKit.h>

@interface BEView : UIImageView

- (void)addTapBlock:(void(^)(id obj))tapAction;

@end
