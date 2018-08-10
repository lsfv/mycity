//
//  LSFun_Http.h
//  OurCity100
//
//  Created by linson on 2018/8/10.
//  Copyright © 2018年 linson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YYModel.h"

@interface LSFun_Http : NSObject
typedef void (^ReceiveHandle)(NSDictionary *data);
+(void)HttpGet:( NSString *)url handle:(ReceiveHandle)handle;
+(void)HttpPost:( NSString *)url body:(NSString*)body handle:(ReceiveHandle)handle;
+(NSMutableArray*)ConverDict2Model:(NSDictionary *)data cc:(Class)cc isArray:(BOOL)isArray;
+(NSDictionary *)ConverStr2Dict:(NSString *)jsonString;
@end
