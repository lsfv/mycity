//
//  LSBLLLocalData.h
//  OurCity100
//
//  Created by linson on 2018/8/10.
//  Copyright © 2018年 linson. All rights reserved.
//

#import <Foundation/Foundation.h>
//model
#import "LSModel_LocalStruct.h"
//function
#import "YYModel.h"
#import "LSFun_IO.h"
#import "LSFun_Http.h"


enum filterType
{
    enum_category=1,
    enum_spfilter,
    enum_square,
    enum_distance,
    enum_orderby
};

enum distanceType
{
    enum_1km=1,
    enum_2km=2,
    enum_3km=3
};

enum houseType
{
    enum_1b1p=1,
    enum_1b2p,
    enum_2b2p,
    enum_2b4p
};

enum orderStatus
{
    enum_nopay=1,
    enum_nouse,
    enum_usesome,
    enum_used
};

@interface LSBLLLocalData : NSObject
//me
-(struct_me*)GetMe;
-(void)UpdateMe:(struct_me *)me;

//mysetting.
-(struct_mysetting*)GetMySetting;
-(void)UpdateMySetting:(struct_mysetting*)setting;

//city
+(NSMutableArray<struct_city*>*) GetAllCitys:(NSString*)filename;
+(NSMutableArray<struct_city*>*) GetProvinces:(NSMutableArray<struct_city*>*)allcitys;
+(NSMutableArray<struct_city*>*) GetcitysFromProvince:(struct_city *)provincecode allcitys:(NSMutableArray<struct_city*>*)allcitys;
+(void)GetIndexFromCode:(NSString *)code province:(NSInteger *)province city:(NSInteger*)city allcitys:(NSMutableArray<NSMutableArray<struct_city*>*> *)allcitys;
+(NSString*)GetCityNameById:(NSString*)codeid allcitys:(NSMutableArray<NSMutableArray<struct_city*>*> *)allcitys;
+(NSArray<struct_btn*>*) InitBardataHouse;

//
@end
