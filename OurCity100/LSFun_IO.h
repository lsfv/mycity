//
//  LSFun_Cache.h
//  OurCity100
//
//  Created by linson on 2018/8/10.
//  Copyright © 2018年 linson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LSFun_IO : NSObject
+(void)UpdateFile:(NSString*)fileName content:(NSString*)content;
+(NSString *)GetStrFromFile:(NSString*)fileName;
+(NSString *)readLocalFileWithName:(NSString *)name;
@end
