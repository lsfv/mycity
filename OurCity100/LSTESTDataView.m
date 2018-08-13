//
//  LSTESTDataView.m
//  OurCity100
//
//  Created by linson on 2018/8/13.
//  Copyright © 2018年 linson. All rights reserved.
//

#import "LSTESTDataView.h"

@implementation LSTESTDataView

-(id)init
{
    if(self=[super init])
    {
        _view_table=[UITableView new];
        [self addSubview:_view_table];
    }
    return self;
}


+(BOOL)requiresConstraintBasedLayout
{
    return true;
}

-(void)updateConstraints
{
    [_view_table mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.and.bottom.offset(0);
        make.top.offset(40);
    }];
    
    [super updateConstraints];
}
@end
