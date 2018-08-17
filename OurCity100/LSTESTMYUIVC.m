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
#import "LSBLLHouse.h"

@interface LSTESTMYUIVC ()
@property(nonatomic)NSDate *myfrom;
@property(nonatomic)NSDate *myto;
//@property(nonatomic)NSMutableArray<NSIndexPath *> *preselect;
@property(nonatomic)NSMutableArray<NSNumber*> *preselect_number;
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


-(void)Testkeyvalue
{
//    NSArray<struct_keyValue*>* data=[LSBLLHouse InitTypeData_House];
//    NSArray<NSString*> *arraydisplay=[LSBLLCommon GetArrayValueFromKeyvalue:data];
//    
//    NSMutableArray<NSIndexPath*>* tempret=[NSMutableArray<NSIndexPath*> new];
//    
//    [tempret addObject:[NSIndexPath indexPathForRow:1 inSection:0]];
//    [tempret addObject:[NSIndexPath indexPathForRow:6 inSection:0]];
//    
//    NSMutableArray<NSNumber*>* mysave=[LSBLLCommon GetArraykeyFromIndexpath:tempret data:data];
//    
//    
//    NSMutableArray<NSIndexPath*>* convertret=[LSBLLCommon GetIndexPathFromArraykey:mysave data:data];
//    
//    //1.nil.2.beyond.
//    int a=5;
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

//cv
-(void)Setupcv
{
    [self.myview.btn_cv addTarget:self action:@selector(Popupcv) forControlEvents:UIControlEventTouchUpInside];
}

-(void)Popupcv
{
    NSArray<struct_keyValue*>* data=[LSBLLHouse InitTypeData_House];
    NSArray<NSString*> *arraydisplay=[LSBLLCommon GetArrayValueFromKeyvalue:data];
    NSMutableArray<NSIndexPath*>* preindex=[LSBLLCommon GetIndexPathFromArraykey:_preselect_number data:data];
    
    LSFUNPopupcvVC *vc=[[LSFUNPopupcvVC alloc]initWithP:(NSMutableArray<NSString*>*)arraydisplay preselect:preindex handle:self mulsel:YES];
    [self.navigationController presentViewController:vc animated:YES completion:nil];
}

-(void)OnCVClickOK:(NSMutableArray<NSIndexPath *> *)myChoose sender:(LSFUNPopupcvVC *)sender
{
    NSArray<struct_keyValue*>* data=[LSBLLHouse InitTypeData_House];
    NSMutableArray<NSNumber*>* ret=[LSBLLCommon GetArraykeyFromIndexpath:myChoose data:data];
    self.preselect_number=ret;
}
//cv end


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
