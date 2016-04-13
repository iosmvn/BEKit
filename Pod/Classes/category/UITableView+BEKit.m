//
//  UITableView+BEKit.m
//  BEKit
//
//  Created by sundanlong on 16/4/11.
//
//

#import "UITableView+BEKit.h"

@implementation UITableView (BEKit)

+ (instancetype _Nonnull)be_initWithFrame:(CGRect)frame style:(UITableViewStyle)style cellSeparatorStyle:(UITableViewCellSeparatorStyle)cellSeparatorStyle separatorInset:(UIEdgeInsets)separatorInset dataSource:(id<UITableViewDataSource> _Nullable)dataSource delegate:(id<UITableViewDelegate> _Nullable)delegate {
    UITableView *tableView = [[UITableView alloc] initWithFrame:frame style:style];
    [tableView setSeparatorStyle:cellSeparatorStyle];
    [tableView setSeparatorInset:separatorInset];
    [tableView setDelegate:delegate];
    [tableView setDataSource:dataSource];
    
    return tableView;
}

@end
