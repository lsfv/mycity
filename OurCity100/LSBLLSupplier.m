//
//  LSBLLSupplier.m
//  MyCityFun
//
//  Created by liangshun on 18/8/4.
//  Copyright © 2018年 liangshun. All rights reserved.
//

#import "LSBLLSupplier.h"

@implementation LSBLLSupplier
+(void)GetIndexSupplier_cityid:(NSString*)cityid handle:(ReceiveSupplierHandle)handle
{
    NSString *body=[NSString stringWithFormat:@"cityid=%@",cityid];
    [LSFun_Http HttpPost:gbl_urlindexSupplier body:body handle:^(NSDictionary *data) {
        NSMutableArray<LSModel_VSupplier_ALLCategory_Base*> *ret=[LSFun_Http ConverDict2Model:data cc:[LSModel_VSupplier_ALLCategory_Base class] isArray:YES];
        handle(ret);
    }];
}


+(NSArray<struct_btn*>*) InitEatBardata
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

+(NSArray<struct_btn*>*) InitHouseTypeData
{
    struct_btn *btn1=[struct_btn new];
    btn1.btntag=enum_1b1p;
    btn1.btntext=@"单人房";
    
    struct_btn *btn2=[struct_btn new];
    btn2.btntag=enum_1b2p;
    btn2.btntext=@"双人床";
    
    struct_btn *btn3=[struct_btn new];
    btn3.btntag=enum_2b2p;
    btn3.btntext=@"双床房";
    
    struct_btn *btn4=[struct_btn new];
    btn4.btntag=enum_2b4p;
    btn4.btntext=@"加大双床";
    
    NSArray<struct_btn*>* ret=@[btn1,btn2,btn3,btn4];
    
    return ret;
}

@end
