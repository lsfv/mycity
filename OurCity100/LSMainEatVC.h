//
//  LSMainEatVC.h
//  OurCity100
//
//  Created by linson on 2018/8/14.
//  Copyright © 2018年 linson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LSMainEatView.h"
#import "LSBaseVC.h"
#import "LSFUNUIRowButtons.h"
#import "modelsHeads.h"
#import "LSGBLVariable.h"
#import "LSBLLCommon.h"
#import "LSFUNUICategory.h"
#import "LSFUNPopupcvVC.h"

@interface LSMainEatVC : LSBaseVC<IRowBtnsData,UITableViewDelegate,UITableViewDataSource,IcvClick>
@property(nonatomic)LSMainEatView *myview;
@property(nonatomic)NSInteger mycgid;
@end
