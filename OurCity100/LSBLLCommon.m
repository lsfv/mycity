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
@end
