//
//  LSHouseSPView.m
//  OurCity100
//
//  Created by linson on 2018/8/15.
//  Copyright © 2018年 linson. All rights reserved.
//

#import "LSHouseSPView.h"
#import "LSGBLVariable.h"

@implementation LSHouseSPView

-(id)initWithhandle:(UIViewController<iDatePicker,IdpClick> *)handle
{
    if(self=[super init])
    {
        _view_searchbar=[[LSReuseSearchBar alloc]initWithP_currentvc:handle];
        _view_bigpic=[XRCarouselView new];
        _view_date=[[LSFUNUIDatepicker alloc]initWithhandle:handle];
        _view_filter=[[LSFUNUIRowButtons alloc] initWithBtnParemater_left:paddingleft paddingright:paddingright btnwidth:60 bgcolor:nil];
        _view_table=[UITableView new];
        
        [self addSubview:_view_searchbar];
        [self addSubview:_view_bigpic];
        [self addSubview:_view_date];
        [self addSubview:_view_filter];
        [self addSubview:_view_table];
    }
    return self;
}

+(BOOL)requiresConstraintBasedLayout
{
    return true;
}

-(void)updateConstraints
{
    [_view_searchbar mas_makeConstraints:^(MASConstraintMaker *make) {
        [_view_searchbar mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.offset(paddingtop);
            make.left.offset(paddingleft);
            make.right.offset(-paddingright);
            make.height.equalTo([NSNumber numberWithInteger:[LSReuseSearchBar MyHeight]]);
        }];
    }];
    
    [_view_bigpic mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_view_searchbar.mas_bottom).offset(1);
        make.left.offset(paddingleft);
        make.right.offset(-paddingright);
        make.height.equalTo(@70);
    }];
    
    [_view_date mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_view_bigpic.mas_bottom).offset(4);
        make.left.offset(paddingleft);
        make.right.offset(-paddingright);
        make.height.equalTo(@40);
    }];
    
    
    [_view_filter mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_view_date.mas_bottom).offset(4);
        make.left.offset(paddingleft-10);
        make.right.offset(-paddingright+10);
        make.height.equalTo(@12);
    }];
    
    
    [_view_table mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_view_filter.mas_bottom).offset(4);
        make.left.offset(paddingleft);
        make.right.offset(-paddingright);
        make.bottom.offset(-paddingbottom);
    }];
    
    [super updateConstraints];
}
@end
