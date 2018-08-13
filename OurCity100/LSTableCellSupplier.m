//
//  LSTableCellSupplier.m
//  MyCity100
//clampe . recommend
//  Created by liangshun on 18/7/3.
//  Copyright © 2018年 liangshun. All rights reserved.
//

#import "LSTableCellSupplier.h"
#import "Masonry.h"
#import "LSFUNUICategory.h"

@implementation LSTableCellSupplier
-(id)init
{
    if(self=[super init])
    {
        _view_pic=[UIImageView new];
        [self addSubview:_view_pic];
        _view_pic.backgroundColor=[UIColor blueColor];
        _view_content=[UIView new];
        [self addSubview:_view_content];
        _label_name=[UILabel LSDefault:@"title" font:[UIFont LSTitle] frontcolor:nil bgcolor:nil];
        [_view_content addSubview:_label_name];
        
        _label_socre=[UILabel LSDefault:@"3.0" font:[UIFont LSContect] frontcolor:[UIColor LSColorOrange] bgcolor:nil];
        [_view_content addSubview:_label_socre];
        
        _label_simpledesc=[UILabel LSDefault:@"desc" font:[UIFont LSContect] frontcolor:[UIColor LSColorOrange] bgcolor:nil];
        [_view_content addSubview:_label_simpledesc];
        
        _label_address=[UILabel LSDefault:@"address" font:[UIFont LSContect] frontcolor:nil bgcolor:nil];
        [_view_content addSubview:_label_address];
        
        _label_distance=[UILabel LSDefault:@"distance" font:[UIFont LSFlag] frontcolor:nil bgcolor:nil];
        [_view_content addSubview:_label_distance];
    }
    return self;
}

+(BOOL)requiresConstraintBasedLayout
{
    return true;
}

+(NSInteger)GetCellHeight
{
    return 60;
}

-(void)updateConstraints
{
    [_view_pic mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(0);
        make.top.offset(0);
        make.bottom.offset(-1);
        make.width.equalTo(@80);
    }];
    [_view_content mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_view_pic.mas_right).offset(2);
        make.top.offset(0);
        make.bottom.offset(-1);
        make.right.offset(-1);
    }];
    
    [_label_distance mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(15);
        make.right.offset(-1);
        make.width.equalTo(@40);
        make.height.equalTo(@10);
    }];

    [_label_name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_view_pic.mas_right).offset(1);
        make.top.offset(1);
        make.right.equalTo(_label_distance.mas_left).offset(-5);
        make.height.equalTo(@15);
    }];
    
    [_label_socre mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_label_name.mas_left);
        make.top.equalTo(_label_name.mas_bottom).offset(3);
        make.width.equalTo(_label_name.mas_width);
        make.height.equalTo(@10);
    }];
    [_label_address mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_label_name.mas_left);
        make.top.equalTo(_label_socre.mas_bottom).offset(3);
        make.width.equalTo(_label_name.mas_width);
        make.height.equalTo(@10);
    }];
    [_label_simpledesc mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_label_name.mas_left);
        make.top.equalTo(_label_address.mas_bottom).offset(3);
        make.width.equalTo(_label_name.mas_width);
        make.height.equalTo(@10);
    }];
    
    
    [super updateConstraints];
}

@end
