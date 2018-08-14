//
//  LSMainIndexVC.m
//  OurCity100
//
//  Created by linson on 2018/8/14.
//  Copyright © 2018年 linson. All rights reserved.
//

#import "LSMainIndexVC.h"
#import "LSBLLLocalData.h"
#import "LSGBLVariable.h"
#import "LSFUNUIPopupCityVC.h"

@interface LSMainIndexVC ()

@end

@implementation LSMainIndexVC

-(void)loadView
{
    self.view=_myview=[LSMainIndexView new];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self SetupCity];
}

-(void)SetupCity
{
    NSString *cityname=[LSBLLLocalData GetCityNameById:self.mysetting.mycity allcitys:gbl_citys];
    [_myview.btn_city setTitle:cityname forState:UIControlStateNormal];
    [_myview.btn_city addTarget:self action:@selector(OnClickCity) forControlEvents:UIControlEventTouchUpInside];
}

-(void)OnClickCity
{
    LSFUNUIPopupCityVC *vc=[[LSFUNUIPopupCityVC alloc]initWithP_cityCode:self.mysetting.mycity provinces:gbl_provinces citys:gbl_citys handle:self];
    [self.navigationController presentViewController:vc animated:YES completion:nil];
}

-(void)OnClickOK:(NSString *)mycity sender:(LSFUNUIPopupCityVC *)sender
{
    self.mysetting.mycity=mycity;
    [self UpdateSetting:self.mysetting];
    
    NSString *cityname=[LSBLLLocalData GetCityNameById:self.mysetting.mycity allcitys:gbl_citys];
    [_myview.btn_city setTitle:cityname forState:UIControlStateNormal];
}
@end
