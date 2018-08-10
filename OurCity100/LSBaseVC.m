//
//  LSBaseVC.m
//  OurCity100
//
//  Created by linson on 2018/8/10.
//  Copyright © 2018年 linson. All rights reserved.
//

#import "LSBaseVC.h"

@interface LSBaseVC ()
@end

@implementation LSBaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.bll_localdata=[LSBLLLocalData new];
    self.me=[self.bll_localdata GetMe];
    self.mysetting=[self.bll_localdata GetMySetting];
}

-(BOOL)IsLogin
{
    return self.me==nil?false:true;
}

-(void)Login:(struct_me*)meinfo
{
    [_bll_localdata UpdateMe:meinfo];
    self.me=meinfo;
}

-(void)LoginOut
{
    [_bll_localdata UpdateMe:nil];
    self.me=nil;
}

-(void)UpdateMe:(struct_me*)meinfo
{
    [_bll_localdata UpdateMe:meinfo];
    self.me=meinfo;
}

-(void)UpdateSetting:(struct_mysetting*)msetting
{
    [_bll_localdata UpdateMySetting:msetting];
    self.mysetting=msetting;
}

@end
