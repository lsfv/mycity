//
//  LSTestGblUiView.m
//  OurCity100
//
//  Created by linson on 2018/8/10.
//  Copyright © 2018年 linson. All rights reserved.
//

#import "LSTestGblUiView.h"
#import "LSFUNUIHeads.h"

@implementation LSTestGblUiView

-(id)init
{
    if(self=[super init])
    {
        self.view_labes=[UIScrollView new];
        [self.view_labes setScrollEnabled:true];
        self.view_labes.scrollEnabled=true;
        [self addSubview:_view_labes];
        
        
        self.label1=[UILabel LSDefault:@"ok" font:nil frontcolor:nil bgcolor:nil];
        [self.view_labes addSubview:_label1];
        
        self.label2=[UILabel LSRound:@"用户中心" font:[UIFont LSContect] frontcolor:[UIColor whiteColor] bgcolor:[UIColor redColor] bordercolor:[UIColor redColor]];
        [self.view_labes addSubview:_label2];
        
        self.btn1=[UIButton LSDefault:@"ok" font:nil frontcolor:nil bgcolor:nil tag:1];
        [self.view_labes addSubview:_btn1];
        
        self.btn2=[UIButton LSRoundBTN:@"user center" font:[UIFont LSContect] frontcolor:[UIColor whiteColor] bgcolor:[UIColor redColor] tag:1 bordercolor:nil];
        [self.view_labes addSubview:_btn2];
        
    }
    return self;
}

+(BOOL)requiresConstraintBasedLayout
{
    return true;
}

-(void)updateConstraints
{
    [self.view_labes mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.and.top.offset(0);
        make.height.equalTo(@500);
    }];
    [self.label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(2);
        make.left.offset(2);
        make.width.equalTo(@200);
        make.height.equalTo(@50);
    }];
    [self.label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.label1.mas_bottom).offset(1);
        make.left.offset(2);
        make.width.equalTo(@200);
    }];
    
    [self.btn1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.label2.mas_bottom).offset(1);
        make.left.offset(2);
        make.width.equalTo(@200);
    }];
    
    [self.btn2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.btn1.mas_bottom).offset(1);
        make.left.offset(2);
        make.width.equalTo(@200);
    }];
    
    [super updateConstraints];
}
@end
