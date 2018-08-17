//
//  LSBLLCommon.m
//  OurCity100
//
//  Created by linson on 2018/8/13.
//  Copyright © 2018年 linson. All rights reserved.
//

#import "LSBLLCommon.h"
#import <UIKit/UIKit.h>
#import "UIButton+WebCache.h"
#import "UIImageView+WebCache.h"
#import "LSGBLVariable.h"

@implementation LSBLLCommon

+(NSString*)GetFullPicPath:(NSString*)picpach
{
    return [NSString stringWithFormat:@"%@/%@",gbl_domain,picpach];
}

+(void)LoadHttpPicDefault:(NSString*)picpath control:(id)control
{
    if([control isKindOfClass:[UIButton class]])
    {
        [control sd_setBackgroundImageWithURL:[NSURL URLWithString:[self GetFullPicPath:picpath]] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"placeholder"] options:SDWebImageRefreshCached];
    }
    else if ([control isKindOfClass:[UIImageView class]])
    {
        [control sd_setImageWithURL:[NSURL URLWithString:[self GetFullPicPath:picpath]] placeholderImage:[UIImage imageNamed:@"placeholder"] options:SDWebImageRefreshCached];
    }
}

+(NSString *)GetDatewithFormat:(NSString *)format mydate:(NSDate *)mydate
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    NSString *currentDateStr = [dateFormatter stringFromDate:mydate];
    return currentDateStr;
}

//test
+(NSMutableArray<NSString*>*)GetArrayValueFromKeyvalue:(NSArray<struct_keyValue*>*)data
{
    NSMutableArray<NSString*>* ret=[NSMutableArray<NSString*> new];
    
    for(int i=0;i<data.count;i++)
    {
        [ret addObject:data[i].value];
    }
    return ret;
}

+(NSMutableArray<NSIndexPath*>*)GetIndexPathFromArraykey:(NSMutableArray<NSNumber*>*)keyarray   data:(NSArray<struct_keyValue*>*) data
{
    NSMutableArray<NSIndexPath*>* ret=nil;
    if(data!=nil && keyarray!=nil)
    {
        ret=[NSMutableArray<NSIndexPath*> new];
        for(int i=0;i<keyarray.count;i++)
        {
            NSNumber* tempvalue=keyarray[i];
            
            for(int j=0;j<data.count;j++)
            {
                if([tempvalue isEqualToNumber:data[j].key])
                {
                    NSIndexPath *tempindexpath=[NSIndexPath indexPathForRow:j inSection:0 ];
                    [ret addObject:tempindexpath];
                    break;
                }
            }
        }
    }
    return ret;
}



+(NSMutableArray<NSIndexPath*>*)GetIndexPathFromSinglekey:(NSNumber*)key   data:(NSArray<struct_keyValue*>*) data
{
    NSMutableArray<NSIndexPath*>* ret=nil;
    if(data!=nil && key!=nil)
    {
        ret=[NSMutableArray<NSIndexPath*> new];
            for(int j=0;j<data.count;j++)
            {
                if([key isEqualToNumber:data[j].key])
                {
                    NSIndexPath *tempindexpath=[NSIndexPath indexPathForRow:j inSection:0 ];
                    [ret addObject:tempindexpath];
                    break;
                }
            }
    }
    return ret;
}





+(NSMutableArray<NSNumber*>*)GetArraykeyFromIndexpath:(NSMutableArray<NSIndexPath*>*)indexpath  data:(NSArray<struct_keyValue*>*) data
{
    NSMutableArray<NSNumber*>* ret=nil;
    if(indexpath!=nil && data!=nil)
    {
        ret =[NSMutableArray<NSNumber*> new];
        for(int i=0;i<indexpath.count;i++)
        {
            NSInteger row=indexpath[i].row;
            if(row<data.count)
            {
                [ret addObject:data[row].key];
            }
        }
    }
    return ret;
}

@end
