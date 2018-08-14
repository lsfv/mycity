//
//  LSMainIndexView.m
//  OurCity100
//
//  Created by linson on 2018/8/13.
//  Copyright © 2018年 linson. All rights reserved.
//

#import "LSMainIndexView.h"
#import "LSFUNUIHeads.h"
#import "LSFUNUIRowButtons.h"
#import "LSGBLVariable.h"

@implementation LSMainIndexView

-(id)init
{
    if(self=[super init])
    {
        _view_searchbar=[UIView new];
        [self addSubview:_view_searchbar];
        
        _view_pics=[UIView new];
        [self addSubview:_view_pics];
        
        _view_categories=[[LSFUNUIRowButtons alloc]initWithBtnParemater_left:0 paddingright:0 btnwidth:70 bgcolor:nil];
        [self addSubview:_view_categories];
        
        _view_suppliers=[UITableView new];
        [self addSubview:_view_suppliers];
        
        _btn_city=[UIButton LSDefault:@"齐齐哈尔▼" font:[UIFont LSFlag] frontcolor:nil bgcolor:nil tag:1];
        [_view_searchbar addSubview:_btn_city];
        
        _sb_search=[UISearchBar new];
        [_view_searchbar addSubview:_sb_search];
        
        _pics_index=[XRCarouselView new];
        [_view_pics addSubview:_pics_index];
    
        
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
        make.height.equalTo(@40);
    }];
    
    [_view_pics mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_view_searchbar.mas_bottom).offset(1);
        make.left.offset(paddingleft);
        make.right.offset(-paddingright);
        make.height.equalTo(@70);
    }];
    
    [_view_categories mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_view_pics.mas_bottom).offset(1);
        make.left.offset(paddingleft);
        make.right.offset(-paddingright);
        make.height.equalTo(@70);
    }];
    
    [_view_suppliers mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_view_categories.mas_bottom).offset(1);
        make.left.offset(paddingleft);
        make.right.offset(-paddingright);
        make.bottom.offset(-paddingbottom);
    }];
    
    
    //sb
    [_btn_city mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(0);
        make.top.offset(5);
        make.bottom.offset(-5);
        make.width.equalTo(@62);
        
    }];
    [_sb_search mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_btn_city.mas_right).offset(5);
        make.top.offset(0);
        make.right.offset(0);
        make.bottom.offset(0);
    }];
    
    
    [_pics_index mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.and.right.and.bottom.offset(0);
    }];
    
    [super updateConstraints];
}
@end
