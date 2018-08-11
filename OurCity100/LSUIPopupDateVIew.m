//
//  LSUIPopupDateVIew.m
//  MyCityFun
//
//  Created by liangshun on 18/8/7.
//  Copyright © 2018年 liangshun. All rights reserved.
//

#import "LSFUNUIPopupDateVIew.h"

@implementation LSUIPopupDateVIew

-(id)init
{
    if(self=[super init])
    {
        self.view_main=[LSUIPopupView new];
        [self addSubview:_view_main];
        
        _viewTitle=[UILabel LSDefault:@"入店时间" font:nil frontcolor:nil bgcolor:nil];
        [self.view_main.view_contect addSubview:_viewTitle];
        _viewTitle2=[UILabel LSDefault:@"离开时间" font:nil frontcolor:nil bgcolor:nil];
        [self.view_main.view_contect addSubview:_viewTitle2];
        
        
        NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
        
        _viewDatepickerFrom=[UIDatePicker new];
        _viewDatepickerFrom.datePickerMode = UIDatePickerModeDate;
        _viewDatepickerFrom.locale = locale;
        
        _viewDatepickerTo=[UIDatePicker new];
        _viewDatepickerTo.datePickerMode = UIDatePickerModeDate;
        _viewDatepickerTo.locale = locale;

        [self.view_main.view_contect addSubview:_viewDatepickerFrom];
        [self.view_main.view_contect addSubview:_viewDatepickerTo];
        
    }
    return self;
}

+(BOOL)requiresConstraintBasedLayout
{
    return true;
}

-(void)updateConstraints
{
    [_view_main mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.and.top.and.bottom.offset(0);
    }];
    
    
    [_viewTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(5);
        make.left.offset(10);
        make.right.offset(0);
        make.height.equalTo(@20);
    }];
    
    [_viewDatepickerFrom mas_makeConstraints:^(MASConstraintMaker *make)
     {
         make.top.equalTo(_viewTitle.mas_bottom).offset(5);
         make.left.offset(10);
         make.right.offset(0);
         make.height.equalTo(@140);
     }];
    
    [_viewTitle2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.viewDatepickerFrom.mas_bottom).offset(10);
        make.left.offset(10);
        make.right.offset(0);
        make.height.equalTo(@20);
    }];
    
    
    [_viewDatepickerTo mas_makeConstraints:^(MASConstraintMaker *make)
     {
         make.top.equalTo(_viewTitle2.mas_bottom).offset(10);
         make.left.offset(0);
         make.right.offset(0);
         make.height.equalTo(@140);
     }];

    [super updateConstraints];
}

@end
