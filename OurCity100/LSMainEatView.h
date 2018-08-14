//
//  LSMainEatView.h
//  OurCity100
//
//  Created by linson on 2018/8/14.
//  Copyright © 2018年 linson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LSReuseSearchBar.h"
#import "LSFUNUIRowButtons.h"
#import "LSGBLVariable.h"

@interface LSMainEatView : UIView
@property(nonatomic)LSReuseSearchBar *view_searchbar;
@property(nonatomic)LSFUNUIRowButtons *view_subCategorys;
@property(nonatomic)LSFUNUIRowButtons *view_subCategorys2;
@property(nonatomic)LSFUNUIRowButtons *view_filter;

@property(nonatomic)UITableView *view_table;
-(id)initWithvc:(UIViewController*)vc;
@end
