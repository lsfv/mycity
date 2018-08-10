//
//  LSTestGblUiVC.m
//  OurCity100
//
//  Created by linson on 2018/8/10.
//  Copyright © 2018年 linson. All rights reserved.
//

#import "LSTestGblUiVC.h"
#import "LSGBLVariable.h"

@interface LSTestGblUiVC ()

@end

@implementation LSTestGblUiVC

-(void)loadView
{
    self.view=_myview=[LSTestGblUiView new];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self GblV];
}

-(void)GblV
{
    NSLog(@"%i",paddingleft);
    NSLog(@"citycode:%@",self.mysetting.mycity);
    
    NSInteger pro=0;
    NSInteger city=0;
    
    [LSBLLLocalData GetIndexFromCode:self.mysetting.mycity province:&pro city:&city allcitys:gbl_citys];
    
    NSLog(@"%i,%i",(int)pro,(int)city);
}


-(void)LocalSetting
{
    NSLog(@"longi%i",[self IsLogin]);
    
    NSString * aboutme=@"";
    aboutme=[NSString stringWithFormat:@"name:%@.id%i",self.me.u_loginname,(int)self.me.u_id];
    
    NSLog(@"%@",aboutme);
    
    self.me.u_loginname=@"hi";
    [self UpdateMe:self.me];
    aboutme=[NSString stringWithFormat:@"name:%@.id%i",self.me.u_loginname,(int)self.me.u_id];
    
    NSLog(@"%@",aboutme);
    
    [self LoginOut];
    aboutme=[NSString stringWithFormat:@"name:%@.id%i",self.me.u_loginname,(int)self.me.u_id];
    
    NSLog(@"%@",aboutme);
    
    NSLog(@"longi%i",[self IsLogin]);
    NSLog(@"mycity%@",self.mysetting.mycity);
    
}

@end
