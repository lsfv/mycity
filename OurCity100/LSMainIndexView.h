//
//  LSMainIndexView.h
//  OurCity100
//
//  Created by linson on 2018/8/13.
//  Copyright © 2018年 linson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XRCarouselView.h"
#import "LSFUNUIRowButtons.h"

@interface LSMainIndexView : UIView
@property(nonatomic)UIView * _Nullable view_searchbar;
@property(nonatomic)UIView * _Nullable view_pics;
@property(nonatomic)LSFUNUIRowButtons * _Nullable view_categories;
@property(nonatomic)UITableView * _Nullable view_suppliers;

@property(nonatomic)UIButton * _Nullable btn_city;
@property(nonatomic)UISearchBar * _Nullable sb_search;

@property(nonatomic)XRCarouselView * _Nullable pics_index;

@end
