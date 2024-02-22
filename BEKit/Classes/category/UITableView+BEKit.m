//
//  UITableView+BEKit.m
//  BEKit
//
//  Created by dalong on 2018/9/29.
//

#import "UITableView+BEKit.h"

@implementation UITableView (BEKit)

- (void)be_updateWithBlock:(void (^)(UITableView *tableView))block {
    [self beginUpdates];
    block(self);
    [self endUpdates];
}
    
- (void)be_scrollToRow:(NSUInteger)row section:(NSUInteger)section position:(UITableViewScrollPosition)position animated:(BOOL)animated {
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:section];
    [self scrollToRowAtIndexPath:indexPath atScrollPosition:position animated:animated];
}
    
- (void)be_insertRowAtIndexPath:(NSIndexPath *)indexPath animated:(UITableViewRowAnimation)animation {
    [self insertRowsAtIndexPaths:@[indexPath] withRowAnimation:animation];
}
    
- (void)be_insertRow:(NSUInteger)row section:(NSUInteger)section animation:(UITableViewRowAnimation)animation {
    NSIndexPath *toInsert = [NSIndexPath indexPathForRow:row inSection:section];
    [self be_insertRowAtIndexPath:toInsert animated:animation];
}
    
- (void)be_reloadRowAtIndexPath:(NSIndexPath *)indexPath animation:(UITableViewRowAnimation)animation {
    [self reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:animation];
}
    
- (void)be_reloadRow:(NSUInteger)row inSection:(NSUInteger)section animation:(UITableViewRowAnimation)animation {
    NSIndexPath *toReload = [NSIndexPath indexPathForRow:row inSection:section];
    [self be_reloadRowAtIndexPath:toReload animation:animation];
}
    
- (void)be_deleteRowAtIndexPath:(NSIndexPath *)indexPath animation:(UITableViewRowAnimation)animation {
    [self deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:animation];
}
    
- (void)be_deleteRow:(NSUInteger)row section:(NSUInteger)section animation:(UITableViewRowAnimation)animation {
    NSIndexPath *toDelete = [NSIndexPath indexPathForRow:row inSection:section];
    [self be_deleteRowAtIndexPath:toDelete animation:animation];
}
    
- (void)be_insertSection:(NSUInteger)section animation:(UITableViewRowAnimation)animation {
    NSIndexSet *sections = [NSIndexSet indexSetWithIndex:section];
    [self insertSections:sections withRowAnimation:animation];
}
    
- (void)be_deleteSection:(NSUInteger)section animation:(UITableViewRowAnimation)animation {
    NSIndexSet *sections = [NSIndexSet indexSetWithIndex:section];
    [self deleteSections:sections withRowAnimation:animation];
}
    
- (void)be_reloadSection:(NSUInteger)section animation:(UITableViewRowAnimation)animation {
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:section];
    [self reloadSections:indexSet withRowAnimation:animation];
}
    
- (void)be_clearSelectedRowsAnimated:(BOOL)animated {
    NSArray *indexs = [self indexPathsForSelectedRows];
    [indexs enumerateObjectsUsingBlock:^(NSIndexPath* path, NSUInteger idx, BOOL *stop) {
        [self deselectRowAtIndexPath:path animated:animated];
    }];
}
    
@end
