//
//  LSFun_Http.m
//  OurCity100
//
//  Created by linson on 2018/8/10.
//  Copyright © 2018年 linson. All rights reserved.
//

#import "LSFun_Http.h"


@implementation LSFun_Http
+(void)HttpGet:(NSString *)url handle:(ReceiveHandle)handle
{
    url = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    NSURL *nsurl = [NSURL URLWithString:url];
    NSURLRequest *request = [NSURLRequest requestWithURL:nsurl cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:30];
    [self SendAsyncWithRequest:request handle:handle];
}

+(void)SendAsyncWithRequest:(NSURLRequest *)request handle:(ReceiveHandle)handle
{
    NSURLSession *sharedSession = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [sharedSession dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSDictionary *jaonData=nil;
        if (data && (error == nil))
        {
            jaonData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&error];
        }
        else
        {
            NSLog(@"request error:%@",request);
        }
        handle(jaonData);
    }];
    [dataTask resume];
}

+(void)HttpPost:(NSString *)url body:(NSString*)body handle:(ReceiveHandle)handle
{
    url = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    NSURL *nsurl = [NSURL URLWithString:url];
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:nsurl cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:30];
    request.HTTPMethod=@"POST";
    request.HTTPBody=[body dataUsingEncoding:NSUTF8StringEncoding];
    [self SendAsyncWithRequest:request handle:handle];
}

+(NSMutableArray*)ConverDict2Model:(NSDictionary *)data cc:(Class)cc isArray:(BOOL)isArray
{
    NSMutableArray *ret=[NSMutableArray new];
    if(data!=nil)
    {
        if(isArray)
        {
            NSArray *keys = [data.allKeys mutableCopy];
            if(keys.count==1)
            {
                id obj = data[keys[0]];
                if([obj isKindOfClass:[NSArray class]])
                {
                    NSArray * myret=(NSArray*)obj;
                    for(int i=0;i<myret.count;i++)
                    {
                        id tempobj=[cc yy_modelWithJSON:myret[i]];
                        [ret addObject:tempobj];
                    }
                }
            }
        }
    }
    return ret;
}


+ (NSDictionary *)ConverStr2Dict:(NSString *)jsonString {
    if (jsonString == nil) {
        return nil;
    }
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}
@end
