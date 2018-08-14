//
//  LSMainEatView.m
//  OurCity100
//
//  Created by linson on 2018/8/14.
//  Copyright © 2018年 linson. All rights reserved.
//

#import "LSMainEatView.h"

@implementation LSMainEatView

-(id)initWithvc:(UIViewController*)vc
{
    if(self=[super init])
    {
        _view_searchbar=[[LSReuseSearchBar alloc]initWithP_currentvc:vc];
        [self addSubview:_view_searchbar];
        
        _view_subCategorys=[[LSFUNUIRowButtons alloc]initWithBtnParemater_left:0 paddingright:0 btnwidth:64 bgcolor:nil];
        [self addSubview:_view_subCategorys];
        
        _view_subCategorys2=[[LSFUNUIRowButtons alloc]initWithBtnParemater_left:0 paddingright:0 btnwidth:64 bgcolor:nil];
        [self addSubview:_view_subCategorys2];
        
        _view_filter=[[LSFUNUIRowButtons alloc]initWithBtnParemater_left:0 paddingright:0 btnwidth:56 bgcolor:nil];
        [self addSubview:_view_filter];
        
        _view_table=[UITableView new];
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
        make.top.offset(paddingtop);
        make.left.offset(paddingleft);
        make.right.offset(-paddingright);
        make.height.equalTo([NSNumber numberWithInteger:[LSReuseSearchBar MyHeight]]);
    }];

    [_view_subCategorys mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_view_searchbar.mas_bottom).offset(1);
        make.left.offset(paddingleft);
        make.right.offset(-paddingright);
        make.height.equalTo(@52);
    }];
    
    [_view_subCategorys2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_view_subCategorys.mas_bottom).offset(1);
        make.left.offset(paddingleft);
        make.right.offset(-paddingright);
        make.height.equalTo(@52);
    }];
    
    [_view_filter mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_view_subCategorys2.mas_bottom).offset(5);
        make.left.offset(paddingleft);
        make.right.offset(-paddingright);
        make.height.equalTo(@12);
    }];
    
    [_view_table mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_view_filter.mas_bottom).offset(5);
        make.left.offset(paddingleft);
        make.right.offset(-paddingright);
        make.bottom.offset(-paddingbottom);
    }];
    
    [super updateConstraints];
}
@end
