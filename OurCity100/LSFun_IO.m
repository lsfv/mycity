//
//  LSFun_Cache.m
//  OurCity100
//
//  Created by linson on 2018/8/10.
//  Copyright © 2018年 linson. All rights reserved.
//

#import "LSFun_IO.h"

@implementation LSFun_IO
//write string to file.do nothing when nil.
+(void)UpdateFile:(NSString*)fileName content:(NSString*)content
{
    NSString *cachesDir=[self GetCachePath];
    NSString *filePath = [cachesDir stringByAppendingPathComponent:fileName];
    if(content!=nil && fileName!=nil)
    {
        [content writeToFile:filePath atomically:true encoding:NSUTF8StringEncoding error:nil];
    }
}

+(NSString *)GetStrFromFile:(NSString*)fileName
{
    NSString * ret=nil;
    if(fileName!=nil)
    {
        NSString *cachesDir=[self GetCachePath];
        NSString *filePath = [cachesDir stringByAppendingPathComponent:fileName];
        ret=[NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    }
    
    return ret;
}

+(NSString*)GetCachePath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachesDir = [paths objectAtIndex:0];
    return cachesDir;
}

+(NSString *)readLocalFileWithName:(NSString *)name
{
    NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:nil];
    NSString *ret=[[NSString alloc]initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    return  ret;
}
@end
