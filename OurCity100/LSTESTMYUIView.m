//
//  LSTESTMYUIView.m
//  OurCity100
//
//  Created by linson on 2018/8/10.
//  Copyright © 2018年 linson. All rights reserved.
//

#import "LSTESTMYUIView.h"

@implementation LSTESTMYUIView

-(id)init
{
    if(self=[super init])
    {
        _btn_city=[UIButton LSDefault:@"city" font:nil frontcolor:nil bgcolor:nil tag:1];
        [self addSubview:_btn_city];
    }
    return self;
}

+(BOOL)requiresConstraintBasedLayout
{
    return true;
}

-(void)updateConstraints
{
    [self.btn_city mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.offset(50);
        make.width.equalTo(@50);
        make.height.equalTo(@15);
    }];
    [super updateConstraints];
}
@end
