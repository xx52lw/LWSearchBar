//
//  SearchResultsController.h
//  LWSearchBarController
//
//  Created by liwei on 2016/4/18.
//  Copyright © 2016年 liwei. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LWSearchResultsController;
@protocol LWSearchResultsControllerDelegate <NSObject>

@optional

@end

@interface LWSearchResultsController : UIViewController<UISearchResultsUpdating>


@end
