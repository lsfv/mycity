//
//  LSBLLCategory.h
//  OurCity100
//
//  Created by linson on 2018/8/14.
//  Copyright © 2018年 linson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "modelsHeads.h"
#import "LSFun_Http.h"
#import "LSGBLVariable.h"
typedef void (^ReceiveCategoryHandle)(NSMutableArray<LSModel_VCategory_All*> *data);
@interface LSBLLCategory : NSObject
+(void)GetMainCategory:(ReceiveCategoryHandle)handle;
+(void)GetSubCategory:(NSInteger)fatherid handle:(ReceiveHandle)handle;
+(NSString *)GetDatewithFormat:(NSString *)format mydate:(NSDate *)mydate;
@end
