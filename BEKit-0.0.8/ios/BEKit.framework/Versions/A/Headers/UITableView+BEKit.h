//
//  UITableView+BEKit.h
//  BEKit
//
//  Created by sundanlong on 16/4/11.
//
//

@import Foundation;
@import UIKit;

@interface UITableView (BEKit)

+ (instancetype _Nonnull)be_initWithFrame:(CGRect)frame
                                    style:(UITableViewStyle)style
                       cellSeparatorStyle:(UITableViewCellSeparatorStyle)cellSeparatorStyle
                           separatorInset:(UIEdgeInsets)separatorInset
                               dataSource:(id <UITableViewDataSource> _Nullable)dataSource
                                 delegate:(id <UITableViewDelegate> _Nullable)delegate;

@end
