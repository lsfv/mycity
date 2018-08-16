//
//  LSBLLCommon.h
//  OurCity100
//
//  Created by linson on 2018/8/13.
//  Copyright © 2018年 linson. All rights reserved.
#import <Foundation/Foundation.h>
#import "LSGBLVariable.h"

@interface LSBLLCommon : NSObject
+(NSString*)GetFullPicPath:(NSString*)picpach;
+(void)LoadHttpPicDefault:(NSString*)picpath control:(id)control;
+(NSString *)GetDatewithFormat:(NSString *)format mydate:(NSDate *)mydate;
+(NSMutableArray<NSString*>*) GetBtnText:(NSMutableArray<struct_btn*>*)GetBtnText;
@end
