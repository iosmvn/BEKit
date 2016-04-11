//
//  UITableView+BEKit.m
//  BEKit
//
//  Created by sundanlong on 16/4/11.
//
//

#import "UITableView+BEKit.h"

@implementation UITableView (BEKit)

+ (instancetype _Nonnull)initWithFrame:(CGRect)frame style:(UITableViewStyle)style cellSeparatorStyle:(UITableViewCellSeparatorStyle)cellSeparatorStyle separatorInset:(UIEdgeInsets)separatorInset dataSource:(id<UITableViewDataSource> _Nullable)dataSource delegate:(id<UITableViewDelegate> _Nullable)delegate {
    UITableView *tableView = [[UITableView alloc] initWithFrame:frame style:style];
    [tableView setSeparatorStyle:cellSeparatorStyle];
    [tableView setSeparatorInset:separatorInset];
    [tableView setDelegate:delegate];
    [tableView setDataSource:dataSource];
    
    return tableView;
}

- (NSArray * _Nonnull)getIndexPathsForSection:(NSUInteger)section {
    NSMutableArray *indexPaths = [[NSMutableArray alloc] init];
    NSInteger rows = [self numberOfRowsInSection:section];
    for (int i = 0; i < rows; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:section];
        [indexPaths addObject:indexPath];
    }
    
    return (NSArray *)indexPaths;
}

- (NSIndexPath * _Nonnull)getNextIndexPath:(NSUInteger)row forSection:(NSUInteger)section {
    NSArray *indexPaths = [self getIndexPathsForSection:section];
    return [indexPaths objectAtIndex:row + 1];
}

- (NSIndexPath * _Nonnull)getPreviousIndexPath:(NSUInteger)row forSection:(NSUInteger)section {
    NSArray *indexPaths = [self getIndexPathsForSection:section];
    return [indexPaths objectAtIndex:row - 1];
}

@end
