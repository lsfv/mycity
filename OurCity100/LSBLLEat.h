//
//  LSBLLEat.h
//  OurCity100
//
//  Created by linson on 2018/8/14.
//  Copyright © 2018年 linson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "modelsHeads.h"
#import "LSFun_Http.h"
#import "YYModel.h"
#import "LSGBLVariable.h"


@interface LSBLLEat : NSObject
+(void)GetEatSuppliers:(NSString*)cityid handle:(ReceiveHandle)handle;
+(NSArray<struct_btn*>*) InitBardata;
+(NSArray<NSString*>*) InitEatTypeDate;
@end
