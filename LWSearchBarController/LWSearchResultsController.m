//
//  SearchResultsController.m
//  LWSearchBarController
//
//  Created by liwei on 2016/4/18.
//  Copyright © 2016年 liwei. All rights reserved.
//

#import "LWSearchResultsController.h"

@interface LWSearchResultsController ()

@end

@implementation LWSearchResultsController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    if (searchController.isActive) {
        if (searchController.searchBar.text.length > 0) {
            NSLog(@"开始搜索内容为：%@",searchController.searchBar.text);
        }
    }
}

@end
