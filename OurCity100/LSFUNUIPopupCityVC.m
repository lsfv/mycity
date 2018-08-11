//
//  LSUIPopupCityVC.m
//  MyCityFun
//
//  Created by liangshun on 18/8/7.
//  Copyright © 2018年 liangshun. All rights reserved.
//

#import "LSFUNUIPopupCityVC.h"

@interface LSFUNUIPopupCityVC ()
@property(nonatomic)NSInteger index_p;
@property(nonatomic)NSInteger index_c;
@end

@implementation LSFUNUIPopupCityVC


-(id)initWithP:(NSString*)cityCode provinces:(NSMutableArray<struct_city*>*) provinces citys:(NSMutableArray<NSMutableArray<struct_city*>*> *)citys handle:(UIViewController<IPOPCITY>*)handle
{
    if(self=[super init])
    {
        self.citycode=cityCode;
        self.provinces=provinces;
        self.citys=citys;
        self.myhandle=handle;
    }
    return self;
}

-(void)loadView
{
    self.view=self.myview=[LSUIPopupCity new];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self SetupViewPicker];
    
    
}


-(void)SetupViewPicker
{
    _myview.pv_citys.dataSource=self;
    _myview.pv_citys.delegate=self;
    self.modalPresentationStyle=UIModalPresentationOverFullScreen;
    self.modalTransitionStyle=UIModalTransitionStyleCoverVertical;
    
    [_myview.view_main.btn_cancel addTarget:self action:@selector(OnClickCancel:) forControlEvents:UIControlEventTouchUpInside];
    [_myview.view_main.btn_ok addTarget:self action:@selector(OnClickOk:) forControlEvents:UIControlEventTouchUpInside];
    [LSBLLLocalData GetIndexFromCode:self.citycode province:&_index_p city:&_index_c allcitys:self.citys];
}

-(void)SetupData
{
    
}

-(void)OnClickCancel:(UIButton*)sender
{
    [_myhandle dismissViewControllerAnimated:NO completion:nil];
}

-(void)OnClickOk:(UIButton*)sender
{
    [_myhandle dismissViewControllerAnimated:NO completion:^{
        [_myhandle OnClickOK:self.citycode sender:self];
    }];
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if(component==0)
    {
        return _provinces.count;
    }
    else
    {
        return self.citys[_index_p].count;
    }
}

-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if(component==0)
    {
        return _provinces[row].name;
    }
    else
    {
        return self.citys[_index_p][row].name;
    }
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if(component==0)
    {
        _index_p=row;
        [self.myview.pv_citys reloadComponent:1];
        [self.myview.pv_citys selectRow:0 inComponent:1 animated:NO];
        _index_c=0;
    }
    else
    {
        _index_c=row;
    }
    self.citycode=self.citys[_index_p][_index_c].codeID;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
    [self.myview.pv_citys selectRow:_index_p inComponent:0 animated:NO];
    [self.myview.pv_citys selectRow:_index_c inComponent:1 animated:NO];
}

@end
