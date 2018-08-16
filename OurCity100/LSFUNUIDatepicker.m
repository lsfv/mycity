//
//  LSReuseDatepicker.m
//  MyCity100
//	连弹出 和 委托 都在这里封装 。
//  view 实现控件和布局。提供给其他view使用。
//  如果这个view还有和其他view交互，那么就建立VC，回调接口定义也放入VC中。
//  Created by liangshun on 18/7/21.
//  Copyright © 2018年 liangshun. All rights reserved.
//

#import "LSFUNUIDatepicker.h"
#import "Masonry.h"
#import "LSFUNUICategory.h"


@implementation LSFUNUIDatepicker
-(id)initWithhandle:(UIViewController<iDatePicker,IdpClick> *)handle
{
    if(self=[super init])
    {
        _label_intime=[UILabel LSDefault:@"入店时间" font:nil frontcolor:nil bgcolor:nil];
        [self addSubview:_label_intime];
        _label_outtime=[UILabel LSDefault:@"离开时间" font:nil frontcolor:nil bgcolor:nil];
        [self addSubview:_label_outtime];
        
        _btn_intime=[UIButton LSDefault:@"" font:nil frontcolor:nil bgcolor:nil tag:1];
        _btn_outtime=[UIButton LSDefault:@"" font:nil frontcolor:nil bgcolor:nil tag:2];
        
        
        [self addSubview:_label_intime];
        [self addSubview:_label_outtime];
        [self addSubview:_btn_intime];
        [self addSubview:_btn_outtime];

        //init popupvc
        self.myDelegater=handle;
        
        //add event
        [_btn_intime addTarget:self action:@selector(OnClickBtn:) forControlEvents:UIControlEventTouchUpInside];
        [_btn_outtime addTarget:self action:@selector(OnClickBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}


-(void)OnClickBtn:(UIButton*)sender
{
    //presenting popupdate;
    NSDate *indate=[NSDate date];
    NSDate *outdate=[NSDate date];
    [_myDelegater OnClickBtns_updateParemeters:&indate outdate:&outdate];
    _vc=[[LSFUNUIPopupDateVC alloc]initWithP:indate to:outdate handle:_myDelegater];
    [_myDelegater presentViewController:_vc animated:YES completion:nil];
}


+(BOOL)requiresConstraintBasedLayout
{
    return true;
}


-(void)updateConstraints
{
    [_label_intime mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(0);
        make.left.offset(0);
        make.width.equalTo(@60);
        make.height.equalTo(@18);
    }];
    [_btn_intime mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(0);
        make.left.equalTo(_label_intime.mas_right).offset(1);
        make.width.equalTo(@120);
        make.bottom.equalTo(_label_intime.mas_bottom);
    }];
    
    [self.label_outtime mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_btn_intime.mas_bottom).offset(4);
        make.left.offset(0);
        make.width.equalTo(@60);
        make.height.equalTo(@18);
    }];
    [_btn_outtime mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_label_outtime.mas_top);
        make.left.equalTo(_label_outtime.mas_right).offset(1);
        make.width.equalTo(@120);
        make.bottom.equalTo(_label_outtime.mas_bottom);
    }];
    
    [super updateConstraints];
}


+(NSNumber*)myHeight
{
    return [NSNumber numberWithInt:40];
}

@end
