//
//  LSMainSupplierVC.h
//  OurCity100
//
//  Created by linson on 2018/8/15.
//  Copyright © 2018年 linson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LSMainSupplierView.h"
#import "LSBaseVC.h"
#import "modelsHeads.h"

@interface LSMainSupplierVC : LSBaseVC<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic)LSMainSupplierView *myview;
@property(nonatomic)LSModel_VSupplier_ALLCategory_Base *mysp;
@end
