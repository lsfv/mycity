//
//  LSMainSupplierView.h
//  OurCity100
//
//  Created by linson on 2018/8/15.
//  Copyright © 2018年 linson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LSFUNUIHeads.h"
#import "LSReuseSupplier.h"
#import "LSFUNUIRowButtons.h"
#import "LSReuseSearchBar.h"
#import "LSGBLVariable.h"


@interface LSMainSupplierView : UIView
-(id)initWithvc:(UIViewController*)vc;
@property(nonatomic)LSReuseSearchBar *view_searchbar;
@property(nonatomic)LSReuseSupplier *view_supplier;
@property(nonatomic)UITableView *view_table;
@end
