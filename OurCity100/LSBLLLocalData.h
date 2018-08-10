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
@end
