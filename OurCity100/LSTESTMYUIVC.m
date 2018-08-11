//
//  LSTESTMYUIVC.m
//  OurCity100
//
//  Created by linson on 2018/8/10.
//  Copyright © 2018年 linson. All rights reserved.
//

#import "LSTESTMYUIVC.h"
#import "LSFUNUIPopupCityVC.h"
#import "LSFUNUIPopupDateVC.h"
#import "LSGBLVariable.h"

@interface LSTESTMYUIVC ()
@property(nonatomic)NSDate *myfrom;
@property(nonatomic)NSDate *myto;
@end

@implementation LSTESTMYUIVC

-(void)loadView
{
    self.view=_myview=[LSTESTMYUIView new];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self SetupBtncity];
    [self SetupDate];
    
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


-(void)SetupDate
{
    [self.myview.btn_date addTarget:self action:@selector(Popupdate) forControlEvents:UIControlEventTouchUpInside];
}

-(void)Popupdate
{
    LSFUNUIPopupDateVC *VC=[[LSFUNUIPopupDateVC alloc]initWithP:_myfrom to:_myto handle:self];
    [self.navigationController presentViewController:VC animated:YES completion:nil];
}

-(void)OnClickOK:(NSDate *)timefrom timeto:(NSDate *)timeto sender:(LSFUNUIPopupDateVC *)sender
{
    _myfrom=timefrom;
    _myto=timeto;
}
@end
