//
//  UITableView+BEKit.h
//  BEKit
//
//  Created by dalong on 2018/9/29.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITableView (BEKit)

- (void)be_updateWithBlock:(void (^)(UITableView *tableView))block;
    
- (void)be_scrollToRow:(NSUInteger)row section:(NSUInteger)section position:(UITableViewScrollPosition)position animated:(BOOL)animated;
    
- (void)be_insertRowAtIndexPath:(NSIndexPath *)indexPath animated:(UITableViewRowAnimation)animation;
    
- (void)be_insertRow:(NSUInteger)row section:(NSUInteger)section animation:(UITableViewRowAnimation)animation;
    
- (void)be_reloadRowAtIndexPath:(NSIndexPath *)indexPath animation:(UITableViewRowAnimation)animation;
    
- (void)be_reloadRow:(NSUInteger)row inSection:(NSUInteger)section animation:(UITableViewRowAnimation)animation;
    
- (void)be_deleteRowAtIndexPath:(NSIndexPath *)indexPath animation:(UITableViewRowAnimation)animation;
    
- (void)be_deleteRow:(NSUInteger)row section:(NSUInteger)section animation:(UITableViewRowAnimation)animation;
    
- (void)be_insertSection:(NSUInteger)section animation:(UITableViewRowAnimation)animation;
    
- (void)be_deleteSection:(NSUInteger)section animation:(UITableViewRowAnimation)animation;
    
- (void)be_reloadSection:(NSUInteger)section animation:(UITableViewRowAnimation)animation;
    
- (void)be_clearSelectedRowsAnimated:(BOOL)animated;
    
@end

NS_ASSUME_NONNULL_END
