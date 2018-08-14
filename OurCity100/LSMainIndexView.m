//
//  LSMainIndexView.m
//  OurCity100
//
//  Created by linson on 2018/8/13.
//  Copyright © 2018年 linson. All rights reserved.
//

#import "LSMainIndexView.h"
#import "LSFUNUIHeads.h"

@implementation LSMainIndexView

-(id)init
{
    if(self=[super init])
    {
        _view_searchbar=[UIView LSBGVIEW:nil];
        [self addSubview:_view_searchbar];
        
        _view_pics=[UIView LSBGVIEW:nil];
        [self addSubview:_view_pics];
        
        

    }
    return self;
}

+(BOOL)requiresConstraintBasedLayout
{
    return true;
}

-(void)updateConstraints
{
    
    
    [super updateConstraints];
}
@end
