//
//  LSTESTMYUIView.m
//  OurCity100
//
//  Created by linson on 2018/8/10.
//  Copyright © 2018年 linson. All rights reserved.
//

#import "LSTESTMYUIView.h"

@implementation LSTESTMYUIView

-(id)init
{
    if(self=[super init])
    {
        _btn_city=[UIButton LSDefault:@"city" font:nil frontcolor:nil bgcolor:nil tag:1];
        [self addSubview:_btn_city];
        _btn_date=[UIButton LSDefault:@"date" font:nil frontcolor:nil bgcolor:nil tag:2];
        [self addSubview:_btn_date];
        
        _btn_cv=[UIButton LSDefault:@"cv" font:nil frontcolor:nil bgcolor:nil tag:3];
        [self addSubview:_btn_cv];
        
        _btns_test=[[LSFUNUIRowButtons alloc]initWithBtnParemater_left:10 paddingright:10 btnwidth:60 bgcolor:nil];
        [self addSubview:_btns_test];
    }
    return self;
}

+(BOOL)requiresConstraintBasedLayout
{
    return true;
}

-(void)updateConstraints
{
    [self.btn_city mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.offset(50);
        make.width.equalTo(@50);
        make.height.equalTo(@15);
    }];
    [self.btn_date mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.btn_city.mas_bottom).offset(5);
        make.left.offset(50);
        make.width.equalTo(@50);
        make.height.equalTo(@15);
    }];
    
    [self.btn_cv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.btn_date.mas_bottom).offset(10);
        make.left.offset(50);
        make.width.equalTo(@50);
        make.height.equalTo(@15);
    }];
    
    [self.btns_test mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_btn_cv.mas_bottom).offset(5);
        make.left.offset(paddingleft);
        make.right.offset(-paddingright);
        make.height.equalTo(@30);
    }];
    
    
    [super updateConstraints];
}
@end
