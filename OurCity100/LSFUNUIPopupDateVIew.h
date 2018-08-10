//
//  LSUIPopupDateVIew.h
//  MyCityFun
//
//  Created by liangshun on 18/8/7.
//  Copyright © 2018年 liangshun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"
#import "LSFUNUICategory.h"
#import "LSUIPopupView.m"

@interface LSFUNUIPopupDateVIew : UIView
@property(nonatomic)LSUIPopupView *view_main;
@property(nonatomic)UILabel *viewTitle;
@property(nonatomic)UIDatePicker *viewDatepickerFrom;
@property(nonatomic)UILabel *viewTitle2;
@property(nonatomic)UIDatePicker *viewDatepickerTo;
@end
