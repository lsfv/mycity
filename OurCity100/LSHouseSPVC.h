//
//  LSHouseSPVC.h
//  OurCity100
//
//  Created by linson on 2018/8/15.
//  Copyright © 2018年 linson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LSHouseSPView.h"
#import "LSBaseVC.h"
#import "XRCarouselView.h"
#import "LSFUNUIRowButtons.h"
#import "modelsHeads.h"

@interface LSHouseSPVC : LSBaseVC<IdpClick,iDatePicker,UITableViewDelegate,UITableViewDataSource,XRCarouselViewDelegate,IRowBtnsData>
@property(nonatomic)LSHouseSPView *myview;
@property(nonatomic)NSInteger myCategory;
@end
