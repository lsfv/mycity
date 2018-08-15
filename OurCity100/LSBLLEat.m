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


+(NSString*)GetEetPopeleCountPredict:(NSMutableArray<NSIndexPath *>*)eatSet
{
    NSString *strpredict=@"";
    for(int i=0;i<eatSet.count;i++)
    {
        int tag=(int)eatSet[i].row;
        if(tag==0)
        {
            if([strpredict isEqual:@""])
            {
                strpredict=@" has1>0 ";
            }
            else
            {
                strpredict=[strpredict stringByAppendingString:@" || has1>0 "];
            }
        }
        if(tag==1)
        {
            if([strpredict isEqual:@""])
            {
                strpredict=@" has2>0 ";
            }
            else
            {
                strpredict=[strpredict stringByAppendingString:@" || has2>0 "];
            }
        }
        if(tag==2)
        {
            if([strpredict isEqual:@""])
            {
                strpredict=@" has3>0 ";
            }
            else
            {
                strpredict=[strpredict stringByAppendingString:@" || has3>0 "];
            }
        }
        if(tag==3)
        {
            if([strpredict isEqual:@""])
            {
                strpredict=@" has4>0 ";
            }
            else
            {
                strpredict=[strpredict stringByAppendingString:@" || has4>0 "];
            }
        }
        if(tag==4)
        {
            if([strpredict isEqual:@""])
            {
                strpredict=@" hasall>0 ";
            }
            else
            {
                strpredict=[strpredict stringByAppendingString:@" || hasall>0 "];
            }
        }
    }
    
    return strpredict;
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



+(NSArray<NSString*>*) InitEatCategory:(NSMutableArray<LSModel_VCategory_All*>*)array_eatcategory
{
    NSMutableArray<NSString*>* ret=nil;
    if(array_eatcategory!=nil)
    {
         ret=[NSMutableArray<NSString*> new];
        for(int i=0;i<array_eatcategory.count;i++)
        {
            [ret addObject:array_eatcategory[i].cg_name];
        }
    }
    return ret;
}

+(NSMutableArray<NSIndexPath*>*) GetindePath4Select:(NSMutableArray<LSModel_VCategory_All*>*)array_eatcategory selectindex:(NSInteger)selectindex
{
    NSMutableArray<NSIndexPath*>* ret=[NSMutableArray<NSIndexPath*> new];
    if(array_eatcategory!=nil)
    {
        for(int i=0;i<array_eatcategory.count;i++)
        {
            if(array_eatcategory[i].cg_id==selectindex)
            {
                NSIndexPath *tempindex=[NSIndexPath indexPathForRow:i inSection:0];
                [ret addObject:tempindex];
                break;
            }
        }
    }
    
    return ret;
}


+(void)GetGoodsFormEatSPID:(NSInteger)spid handle:(ReceiveHandle)handle
{
    NSString *body=[NSString stringWithFormat:@"spid=%i",(int)spid];
    [LSFun_Http HttpPost:gbl_urlGoods_eatsp body:body handle:handle];
}

@end
