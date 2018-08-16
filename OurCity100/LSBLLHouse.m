//
//  LSBLLHouse.m
//  OurCity100
//
//  Created by linson on 2018/8/16.
//  Copyright © 2018年 linson. All rights reserved.
//

#import "LSBLLHouse.h"

@implementation LSBLLHouse
+(void)GetHouseSuppliers:(NSString*)cityid indate:(NSString*)indate outdate:(NSString*)outdate handle:(ReceiveHandle)handle
{
    NSString *body=[NSString stringWithFormat:@"cityid=%@&indate=%@&outdate=%@",cityid,indate,outdate];
    [LSFun_Http HttpPost:gbl_urlhouse_supplierdate body:body handle:handle];
}

+(NSArray<struct_btn*>*) InitBardataHouse
{
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
    
    NSArray<struct_btn*>* ret=@[btn2,btn3,btn4,btn5];
    
    return ret;
}


+(NSArray<NSString*>*) InitHouseTypeData
{
    NSArray<NSString*>* ret=@[@"单人房",@"双人房",@"双人房",@"加大双床"];
    return ret;
}


+(NSMutableArray<NSIndexPath*>*) GetindexPath4Select_housetype:(NSMutableArray<NSString*>*)array_HouseType selectindex:(NSInteger)selectindex
{
    NSMutableArray<NSIndexPath*>* ret=[NSMutableArray<NSIndexPath*> new];
    NSIndexPath *tempindex=[NSIndexPath indexPathForRow:selectindex inSection:0];
    [ret addObject:tempindex];
    
    return ret;
}

@end
