//
//  LSUIPopupCity.m
//  MyCityFun
//
//  Created by liangshun on 18/8/7.
//  Copyright © 2018年 liangshun. All rights reserved.
//

#import "LSUIPopupCity.h"

@implementation LSUIPopupCity

-(id)init
{
    if(self=[super init])
    {
        self.view_main=[LSUIPopupView new];
        [self addSubview:_view_main];
        self.view_main.translatesAutoresizingMaskIntoConstraints=false;
        
        self.label_title=[UILabel LSDefault:@"选择城市" font:nil frontcolor:nil bgcolor:nil];
        [self.view_main.view_contect addSubview:_label_title];
        
        self.pv_citys=[UIPickerView new];
        [self.view_main.view_contect addSubview:_pv_citys];
    }
    return self;
}

+(BOOL)requiresConstraintBasedLayout
{
    return true;
}

-(void)updateConstraints
{
    [self.view_main mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.and.right.and.bottom.offset(0);
    }];
    
    [_label_title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.offset(0);
        make.top.offset(1);
        make.height.equalTo(@20);
    }];
    [_pv_citys mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.offset(0);
        make.top.equalTo(_label_title.mas_bottom).offset(20);
        make.height.equalTo(@150);
    }];

    [super updateConstraints];
}

@end
