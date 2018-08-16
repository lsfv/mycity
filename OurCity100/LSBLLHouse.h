//
//  LSBLLHouse.h
//  OurCity100
//
//  Created by linson on 2018/8/16.
//  Copyright © 2018年 linson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "modelsHeads.h"
#import "LSFun_Http.h"
#import "YYModel.h"
#import "LSGBLVariable.h"


@interface LSBLLHouse : NSObject
+(void)GetHouseSuppliers:(NSString*)cityid indate:(NSString*)indate outdate:(NSString*)outdate handle:(ReceiveHandle)handle;
+(NSArray<struct_btn*>*) InitBardataHouse;
+(NSArray<struct_btn*>*) InitHouseTypeData;
+(NSMutableArray<NSIndexPath*>*) GetindexPath4Select_housetype:(NSMutableArray<NSString*>*)array_HouseType selectindex:(NSInteger)selectindex;
@end
