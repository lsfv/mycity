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

+(NSMutableArray<NSString*>*)GetArrayValueFromKeyvalue:(NSArray<struct_keyValue*>*)data;
+(NSMutableArray<NSIndexPath*>*)GetIndexPathFromSinglekey:(NSNumber*)key   data:(NSArray<struct_keyValue*>*) data;
+(NSMutableArray<NSIndexPath*>*)GetIndexPathFromArraykey:(NSMutableArray<NSNumber*>*)keyarray   data:(NSArray<struct_keyValue*>*) data;
+(NSMutableArray<NSNumber*>*)GetArraykeyFromIndexpath:(NSMutableArray<NSIndexPath*>*)indexpath  data:(NSArray<struct_keyValue*>*) data;
@end
