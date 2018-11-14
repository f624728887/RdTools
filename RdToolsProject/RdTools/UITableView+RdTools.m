//
//  UITableView+RdTools.m
//  Library
//
//  Created by Rondo_dada on 2018/7/12.
//  Copyright © 2018年 Chen Qi. All rights reserved.
//

#import "UITableView+RdTools.h"

@implementation UITableView (RdTools)

+ (UITableView *_Nonnull)rd_TableView:(UIColor *_Nullable)bgColor forView:(UIView *_Nonnull)superView{
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    [superView addSubview:tableView];
    tableView.tableFooterView = [[UIView alloc] init];
    tableView.backgroundColor = (bgColor ? bgColor : [UIColor clearColor]);
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    return tableView;
}

@end
