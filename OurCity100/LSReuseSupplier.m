//
//  LSReuseSupplier.m
//  MyCity100
//
//  Created by liangshun on 18/7/10.
//  Copyright © 2018年 liangshun. All rights reserved.
//

#import "LSReuseSupplier.h"

@implementation LSReuseSupplier

-(id)init
{
    if(self=[super init])
    {
        _view_pic=[UIImageView new];
        
        _view_right=[UIView new];
        
        _label_name=[UILabel new];
        _label_name.font=[UIFont LSTitle];

        _label_address=[UILabel new];
        _label_address.font=[UIFont LSContect];
        
        
        _label_simpleinfo=[UILabel new];
        _label_simpleinfo.font=[UIFont LSContect];
        _label_simpleinfo.textColor=[UIColor LSColorOrange];

        
        _label_actionword=[UILabel new];
        _label_actionword.font=[UIFont LSContect];
        _label_actionword.textColor=[UIColor LSColorOrange];
        
        _label_tel=[UILabel new];
        _label_tel.font=[UIFont LSContect];
        
        
        [self addSubview:_view_pic];
        [self addSubview:_view_right];
        [_view_right addSubview:_label_actionword];
        [_view_right addSubview:_label_simpleinfo];
        [_view_right addSubview:_label_address];
        [_view_right addSubview:_label_tel];
        [_view_right addSubview:_label_name];
    }
    return self;
}

+(BOOL)requiresConstraintBasedLayout
{
    return YES;
}

-(void)updateConstraints
{
    [_view_pic mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(0);
        make.top.offset(0);
        make.bottom.offset(-1);
        make.width.equalTo(@120);
    }];
    
    [_view_right mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_view_pic.mas_right).offset(8);
        make.top.offset(0);
        make.bottom.offset(-1);
        make.right.offset(-1);
    }];
    
    [_label_name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_view_right.mas_top);
        make.left.equalTo(_view_right.mas_left);
        make.right.equalTo(_view_right.mas_right);
        make.height.equalTo(@17);
    }];
    
    [_label_address mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_label_name.mas_bottom).offset(2);
        make.left.equalTo(_view_right.mas_left);
        make.right.equalTo(_view_right.mas_right);
        make.height.equalTo(@14);
    }];
    
    [_label_simpleinfo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_label_address.mas_bottom).offset(2);
        make.left.equalTo(_view_right.mas_left);
        make.right.equalTo(_view_right.mas_right);
        make.height.equalTo(@14);
    }];
    
    [_label_actionword mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_label_simpleinfo.mas_bottom).offset(2);
        make.left.equalTo(_view_right.mas_left);
        make.right.equalTo(_view_right.mas_right);
        make.height.equalTo(@14);
    }];
    
    [_label_tel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_label_actionword.mas_bottom).offset(2);
        make.left.equalTo(_view_right.mas_left);
        make.right.equalTo(_view_right.mas_right);
        make.height.equalTo(@14);
    }];
    [super updateConstraints];
}

+(NSNumber*)myHeight
{
    return [NSNumber numberWithInt:100];
}

@end
