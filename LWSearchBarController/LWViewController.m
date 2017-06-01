//
//  LWViewController.m
//  LWSearchBarController
//
//  Created by liwei on 2016/4/18.
//  Copyright © 2016年 winchannel. All rights reserved.
//

#import "LWViewController.h"
#import "LWSearchResultsController.h"
// ===============================================================================================================================================================================
@interface LWViewController ()<UISearchBarDelegate,UISearchControllerDelegate>

@property (nonatomic, strong) LWSearchResultsController *resultVC;  // 结果控制器
@property (nonatomic, strong) UISearchController *searchController; // 搜索控制器
@property (nonatomic, strong) UIButton *showPromtView;  // 提示搜索视图，；例如历史记录什么的
@property (nonatomic, strong) UITableView *tableView; // 列表视图

- (void)beginSearch;

@end
// ===============================================================================================================================================================================
@implementation LWViewController
#pragma mark 懒加载结果控制器
- (LWSearchResultsController *)resultVC {
    if (_resultVC == nil) {
        _resultVC = [[LWSearchResultsController alloc] init];
        _resultVC.view.backgroundColor = [UIColor yellowColor];
    }
    return _resultVC;
}
#pragma mark 懒加载搜索控制器
- (UISearchController *)searchController {
    if (_searchController == nil) {
        _searchController = [[UISearchController alloc] initWithSearchResultsController:self.resultVC];
        [_searchController.searchBar sizeToFit]; // 自适应大小
        [_searchController.searchBar setBackgroundImage:[UIImage imageNamed:@"searchBg"] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault]; // 替换系统的背景图片
//        _searchController.dimsBackgroundDuringPresentation = NO; // 开始搜索时候是否显示父视图
//        _searchController.searchBar.tintColor = [UIColor redColor]; // 光标和取消按钮颜色
//        [_searchController.searchBar setImage:[UIImage new] forSearchBarIcon:UISearchBarIconSearch state:UIControlStateNormal]; // 可以替换放大镜，删除图片等图片
        _searchController.searchBar.placeholder = @"李卫搜索";
        _searchController.searchResultsUpdater = self.resultVC; // 如果为self 处理搜索结果的是当前,- (void)updateSearchResultsForSearchController:
        _searchController.searchBar.delegate = self;
        _searchController.delegate = self;
        [_searchController.view addSubview:self.showPromtView];
    }
    return _searchController;
}

#pragma mark 懒加载提示搜索视图，；例如历史记录什么的
- (UIButton *)showPromtView {
    if (_showPromtView == nil) {
        _showPromtView = [[UIButton alloc] init];
        _showPromtView.backgroundColor = [UIColor blueColor];
        [_showPromtView addTarget:self action:@selector(beginSearch) forControlEvents:UIControlEventTouchUpInside];
    }
    return _showPromtView;
}

- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero];
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.backgroundColor = [UIColor redColor];
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 也可以放在一个视图View上
    self.tableView.tableHeaderView = self.searchController.searchBar;
    [self.view addSubview:self.tableView];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    self.tableView.frame = self.view.bounds;
}


- (void)beginSearch {
    [self.view endEditing:YES];
   self.searchController.searchBar.text = @"开始搜索";
    self.showPromtView.hidden = YES;
}


- (void)didPresentSearchController:(UISearchController *)searchController {
    
    CGFloat x = self.searchController.searchBar.frame.origin.x;
    CGFloat w = self.searchController.searchBar.frame.size.width;
    CGFloat y = CGRectGetMaxY(self.searchController.searchBar.frame);
    CGFloat h = self.searchController.view.frame.size.height - y;
    self.showPromtView.frame = CGRectMake(x, y, w, 0);
    [UIView animateWithDuration:0.005 animations:^{ // 解决卡顿
        self.showPromtView.frame = CGRectMake(x, y, w, h);
    }];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {

}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    if (searchText.length > 0) {
        self.showPromtView.hidden = YES;
    }
    else {
        self.showPromtView.hidden = NO;
    }
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
  
}
@end
// ===============================================================================================================================================================================
