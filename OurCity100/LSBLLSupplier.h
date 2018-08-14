//
//  LSBLLSupplier.h
//  MyCityFun
//
//  Created by liangshun on 18/8/4.
//  Copyright © 2018年 liangshun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "modelsHeads.h"
#import "LSGBLVariable.h"
#import "LSFun_Http.h"
typedef void (^ReceiveSupplierHandle)(NSMutableArray<LSModel_VSupplier_ALLCategory_Base*> *data);
@interface LSBLLSupplier : NSObject
+(void)GetIndexSupplier_cityid:(NSString*)cityid handle:(ReceiveSupplierHandle)handle;
+(NSArray<struct_btn*>*) InitEatBardata;
+(NSArray<struct_btn*>*) InitHouseTypeData;
@end
