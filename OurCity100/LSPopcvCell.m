//
//  LSPopcvCell.m
//  MyCityFun
//
//  Created by linson on 2018/8/8.
//  Copyright © 2018年 liangshun. All rights reserved.
//

#import "LSPopcvCell.h"

@implementation LSPopcvCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        _botlabel = [UILabel LSRound:@"一人一床" font:nil frontcolor:nil bgcolor:nil bordercolor:nil];
        self.botlabel.backgroundColor=[UIColor whiteColor];
        [self.contentView addSubview:_botlabel];
    }
    
    return self;
}

+(BOOL)requiresConstraintBasedLayout
{
    return true;
}

-(void)updateConstraints
{
    [_botlabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.and.right.and.bottom.offset(0);
        
    }];
    [super updateConstraints];
}

@end
