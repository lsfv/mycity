//
//  LSTESTMYUIVC.m
//  OurCity100
//
//  Created by linson on 2018/8/10.
//  Copyright © 2018年 linson. All rights reserved.
//

#import "LSTESTMYUIVC.h"
#import "LSFUNUIPopupCityVC.h"
#import "LSGBLVariable.h"

@interface LSTESTMYUIVC ()

@end

@implementation LSTESTMYUIVC

-(void)loadView
{
    self.view=_myview=[LSTESTMYUIView new];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self SetupBtncity];
    
}

-(void)SetupBtncity
{
    [self.myview.btn_city setTitle:[LSBLLLocalData GetCityNameById:self.mysetting.mycity allcitys:gbl_citys] forState:UIControlStateNormal];
    [self.myview.btn_city addTarget:self action:@selector(PopCity) forControlEvents:UIControlEventTouchUpInside];
}

-(void)PopCity
{
    LSFUNUIPopupCityVC *vc=[[LSFUNUIPopupCityVC alloc]initWithP:self.mysetting.mycity provinces:gbl_provinces citys:gbl_citys handle:self];
    [self.navigationController presentViewController:vc animated:YES completion:nil];
}

-(void)OnClickOK:(NSString *)mycity sender:(LSFUNUIPopupCityVC *)sender
{
    self.mysetting.mycity=mycity;
    [self.myview.btn_city setTitle:[LSBLLLocalData GetCityNameById:self.mysetting.mycity allcitys:gbl_citys] forState:UIControlStateNormal];
    [self UpdateSetting:self.mysetting];
}

@end
