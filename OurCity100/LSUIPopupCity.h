//
//  LSUIPopupCity.h
//  MyCityFun
//
//  Created by liangshun on 18/8/7.
//  Copyright © 2018年 liangshun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"
#import "LSFUNUICategory.h"
#import "LSUIPopupView.h"

@interface LSUIPopupCity : UIView
@property(nonatomic)LSUIPopupView *view_main;
@property(nonatomic)UILabel *label_title;
@property(nonatomic)UIPickerView* pv_citys;
@end
