//
//  LSReuseSupplier.h
//  MyCity100
//
//  Created by liangshun on 18/7/10.
//  Copyright © 2018年 liangshun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"
#import "LSFUNUICategory.h"

@interface LSReuseSupplier : UIView
@property(nonatomic)UIImageView *view_pic;
@property(nonatomic)UIView *view_right;
@property(nonatomic)UILabel *label_name;
@property(nonatomic)UILabel *label_address;
@property(nonatomic)UILabel *label_simpleinfo;
@property(nonatomic)UILabel *label_actionword;
@property(nonatomic)UILabel *label_tel;
+(NSNumber*)myHeight;
@end
