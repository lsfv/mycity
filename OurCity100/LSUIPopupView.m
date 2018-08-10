//
//  LSUIPopupView.m
//  MyCityFun
//
//  Created by liangshun on 18/8/6.
//  Copyright © 2018年 liangshun. All rights reserved.
//

#import "LSUIPopupView.h"

@implementation LSUIPopupView

-(id)init
{
    if(self=[super init])
    {
        _view_shadow=[UIView new];
        _view_shadow.backgroundColor= [UIColor grayColor];
        _view_shadow.alpha=0.9;
        [self addSubview:_view_shadow];
        
        _view_contect=[UIView new];
        _view_contect.backgroundColor=[UIColor whiteColor];
        [self addSubview:_view_contect];
        
        _view_btns=[UIView new];
        _view_btns.backgroundColor=[UIColor whiteColor];
        [self addSubview:_view_btns];
        
        _btn_ok=[UIButton LSRoundBTN:@"ok" font:nil frontcolor:nil bgcolor:nil tag:1 bordercolor:nil];
        _btn_cancel=[UIButton LSRoundBTN:@"cancel" font:nil frontcolor:nil bgcolor:nil tag:1 bordercolor:nil];
        [_btn_ok setTitleColor:[UIColor LSColorBlue_btn] forState:UIControlStateNormal];
        [_btn_cancel setTitleColor:[UIColor LSColorBlue_btn] forState:UIControlStateNormal];

        [_view_btns addSubview:_btn_ok];
        [_view_btns addSubview:_btn_cancel];
        
        self.translatesAutoresizingMaskIntoConstraints=false;
        
    }
    return self;
}

+(BOOL)requiresConstraintBasedLayout
{
    return true;
}

-(void)updateConstraints
{
    [_view_shadow mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.and.right.and.bottom.offset(0);
    }];
    
    [_view_contect mas_makeConstraints:^(MASConstraintMaker *make) {

        make.left.and.right.offset(0);
        make.bottom.offset(0);
        make.top.offset(80);
    }];
    
    [_view_btns mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(10);
        make.right.offset(-10);
        make.bottom.offset(-10);
        make.height.equalTo(@50);
    }];
    
    [_btn_cancel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.top.and.bottom.offset(0);
        make.width.equalTo(self.view_btns.mas_width).dividedBy(2).offset(-1);
    }];
    [_btn_ok mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.and.top.and.bottom.offset(0);
        make.width.equalTo(self.view_btns.mas_width).dividedBy(2).offset(-1);
    }];
    
    [super updateConstraints];
}

@end
