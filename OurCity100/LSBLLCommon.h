//
//  LSBLLCommon.h
//  OurCity100
//
//  Created by linson on 2018/8/13.
//  Copyright © 2018年 linson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LSBLLCommon : NSObject
+(NSString*)GetFullPicPath:(NSString*)picpach;
+(void)LoadHttpPicDefault:(NSString*)picpath control:(id)control;
@end
