//
//  LSHouseSPView.h
//  OurCity100
//
//  Created by linson on 2018/8/15.
//  Copyright © 2018年 linson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LSFUNUIHeads.h"
#import "LSReuseSearchBar.h"
#import "XRCarouselView.h"
#import "LSFUNUIDatepicker.h"
#import "LSFUNUIRowButtons.h"

@interface LSHouseSPView : UIView
-(id)initWithhandle:(UIViewController<iDatePicker,IdpClick> *)handle;

@property(nonatomic)LSReuseSearchBar *view_searchbar;
@property(nonatomic)XRCarouselView *view_bigpic;
@property(nonatomic)LSFUNUIDatepicker * view_date;
@property(nonatomic)UITableView *view_table;
@property(nonatomic)LSFUNUIRowButtons *view_filter;
@end
