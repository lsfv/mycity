//
//  LSTabelCellGoods.h
//  MyCity100
//
//  Created by liangshun on 18/7/11.
//  Copyright © 2018年 liangshun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "masonry.h"
#import "LSFUNUICategory.h"

@interface LSTabelCellGoods : UITableViewCell
@property(nonatomic)UIImageView *view_pic;
@property(nonatomic)UIView *view_right;
@property(nonatomic)UILabel *label_name;
@property(nonatomic)UILabel *label_simpleinfo;
@property(nonatomic)UILabel *label_opendate;
@property(nonatomic)UILabel *label_price;
+(int)MinHeight;
@end
