//
//  LSBLLCategory.m
//  OurCity100
//
//  Created by linson on 2018/8/14.
//  Copyright © 2018年 linson. All rights reserved.
//

#import "LSBLLCategory.h"

@implementation LSBLLCategory

+(void)GetMainCategory:(ReceiveCategoryHandle)handle
{
    [LSFun_Http HttpGet:gbl_urlindexcategory handle:^(NSDictionary *data) {
        NSMutableArray<LSModel_VCategory_All*> *ret=[LSFun_Http ConverDict2Model:data cc:[LSModel_VCategory_All class] isArray:YES];
        handle(ret);
    }];
}

+(void)GetSubCategory:(NSInteger)fatherid handle:(ReceiveHandle)handle
{
    NSString *body=[NSString stringWithFormat:@"fatherid=%i",(int)fatherid];
    [LSFun_Http HttpPost:gbl_urlsub_category body:body handle:handle];
}

@end
