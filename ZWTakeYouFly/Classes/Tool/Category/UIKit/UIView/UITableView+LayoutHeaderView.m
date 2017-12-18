//
//  UITableView+LayoutHeaderView.m
//  LTM_iOS
//
//  Created by FW on 2016/12/20.
//  Copyright © 2016年 FW. All rights reserved.
//

#import "UITableView+LayoutHeaderView.h"

@implementation UITableView (LayoutHeaderView)

- (void)setAndLayoutTableHeaderView:(UIView *)headerView
{
    self.tableHeaderView = headerView;
    [headerView setNeedsLayout];
    [headerView layoutIfNeeded];
    CGRect frame = headerView.frame;
    CGSize size = [headerView systemLayoutSizeFittingSize:UILayoutFittingExpandedSize];
    frame.size = size;
    headerView.frame = frame;
    self.tableHeaderView = headerView;
}

- (void)setAndLayoutTableFooterView:(UIView *)footerView
{
    self.tableFooterView = footerView;
    [footerView setNeedsLayout];
    [footerView layoutIfNeeded];
    CGRect frame = footerView.frame;
    CGSize size = [footerView systemLayoutSizeFittingSize:UILayoutFittingExpandedSize];
    frame.size = size;
    footerView.frame = frame;
    self.tableFooterView = footerView;
}



@end
