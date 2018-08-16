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
#import "LSFUNPopupcvVC.h"
#import "LSBLLSupplier.h"
#import "LSBLLCommon.h"

@interface LSTESTMYUIVC ()
@property(nonatomic)NSDate *myfrom;
@property(nonatomic)NSDate *myto;
@property(nonatomic)NSMutableArray<NSIndexPath *> *preselect;
@property(nonatomic)NSArray<struct_btn*>* filterdata;

@property(nonatomic)NSDate *myfrom2;
@property(nonatomic)NSDate *myto2;
@end

@implementation LSTESTMYUIVC

-(void)loadView
{
    self.view=_myview=[[LSTESTMYUIView alloc]initWithhandle:self];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self SetupBtncity];
    [self SetupDate];
    [self Setupcv];
    [self SetupRBtns];
    
}

-(void)OnClickBtns_updateParemeters:(NSDate *__autoreleasing *)indate outdate:(NSDate *__autoreleasing *)outdate
{
    *indate=self.myfrom2;
    *outdate=self.myto2;
}

-(void)SetupRBtns
{
    self.filterdata=[LSBLLSupplier InitHouseTypeData];
    self.myview.btns_test.datasorceHandler=self;
}

-(NSInteger)NumberOfBtns:(LSFUNUIRowButtons *)LSEB
{
    return self.filterdata.count;
}

-(UIButton*)ButtonForIndex:(LSFUNUIRowButtons *)LSEB btnindex:(NSInteger)btnindex
{
    UIButton * ret=[UIButton LSDefault:self.filterdata[btnindex].btntext font:nil frontcolor:nil bgcolor:nil tag:self.filterdata[btnindex].btntag];
    return ret;
}

-(void)Setupcv
{
    [self.myview.btn_cv addTarget:self action:@selector(Popupcv) forControlEvents:UIControlEventTouchUpInside];
}

-(void)Popupcv
{
    NSMutableArray<NSString*>* data=[NSMutableArray new];
    [data addObject:@"abc1"];
    [data addObject:@"abc2"];
    [data addObject:@"abc3"];
    [data addObject:@"abc4"];
    [data addObject:@"abc5"];
    
    LSFUNPopupcvVC *vc=[[LSFUNPopupcvVC alloc]initWithP:data preselect:self.preselect handle:self mulsel:false];
    [self.navigationController presentViewController:vc animated:YES completion:nil];
}

-(void)OnCVClickOK:(NSMutableArray<NSIndexPath *> *)myChoose sender:(LSFUNPopupcvVC *)sender
{
    self.preselect=myChoose;
}

-(void)SetupBtncity
{
    [self.myview.btn_city setTitle:[LSBLLLocalData GetCityNameById:self.mysetting.mycity allcitys:gbl_citys] forState:UIControlStateNormal];
    [self.myview.btn_city addTarget:self action:@selector(PopCity) forControlEvents:UIControlEventTouchUpInside];
}

-(void)PopCity
{
    LSFUNUIPopupCityVC *vc=[[LSFUNUIPopupCityVC alloc]initWithP_cityCode:self.mysetting.mycity provinces:gbl_provinces citys:gbl_citys handle:self];
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
    if(sender==_myview.dp_test.vc)
    {
        _myfrom2=timefrom;
        _myto2=timeto;
        [_myview.dp_test.btn_intime setTitle:[LSBLLCommon GetDatewithFormat:gbl_dateformat mydate:_myfrom2] forState:UIControlStateNormal];
        [_myview.dp_test.btn_outtime setTitle:[LSBLLCommon GetDatewithFormat:gbl_dateformat mydate:_myto2] forState:UIControlStateNormal];
    }
    else
    {
        _myfrom=timefrom;
        _myto=timeto;
    }
}
@end
