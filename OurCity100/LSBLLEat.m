//
//  LSBLLEat.m
//  OurCity100
//
//  Created by linson on 2018/8/14.
//  Copyright © 2018年 linson. All rights reserved.
//

#import "LSBLLEat.h"

@implementation LSBLLEat

+(void)GetEatSuppliers:(NSString*)cityid handle:(ReceiveHandle)handle
{
    NSString *body=[NSString stringWithFormat:@"cityid=%@",cityid];
    [LSFun_Http HttpPost:gbl_urleat_supplier body:body handle:handle];
}

+(NSArray<struct_btn*>*) InitBardata
{
    struct_btn *btn1=[struct_btn new];
    btn1.btntag=enum_category;
    btn1.btntext=@"种类";
    
    struct_btn *btn2=[struct_btn new];
    btn2.btntag=enum_spfilter;
    btn2.btntext=@"筛选";
    
    struct_btn *btn3=[struct_btn new];
    btn3.btntag=enum_square;
    btn3.btntext=@"地区";
    
    struct_btn *btn4=[struct_btn new];
    btn4.btntag=enum_distance;
    btn4.btntext=@"附近";
    
    struct_btn *btn5=[struct_btn new];
    btn5.btntag=enum_orderby;
    btn5.btntext=@"排序";
    
    NSArray<struct_btn*>* ret=@[btn1,btn2,btn3,btn4,btn5];
    
    return ret;
}

+(NSArray<NSString*>*) InitEatTypeDate
{
    NSArray<NSString*>* ret=@[@"单人餐",@"双人餐",@"3~5",@"5~10",@"10人以上"];
    return ret;
}

@end
