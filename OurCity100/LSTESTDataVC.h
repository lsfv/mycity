//
//  LSTESTDataVC.h
//  OurCity100
//
//  Created by linson on 2018/8/13.
//  Copyright © 2018年 linson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LSTESTDataView.h"
#import "LSBaseVC.h"
#import "VSupplier_ALLCategory_Base.h"
#import "LSTableCellSupplier.h"

@interface LSTESTDataVC :LSBaseVC<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic)LSTESTDataView *myview;
@end
