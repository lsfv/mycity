//
//  LSMainSupplierVC.m
//  OurCity100
//
//  Created by linson on 2018/8/15.
//  Copyright © 2018年 linson. All rights reserved.
//

#import "LSMainSupplierVC.h"
#import "LSBLLCommon.h"
#import "LSTabelCellGoods.h"
#import "LSBLLEat.h"

@interface LSMainSupplierVC ()
@property(nonatomic)NSMutableArray<LSModel_VGoods_FatherCategory_Eat_Extend*>* allgoods;
@end

@implementation LSMainSupplierVC

-(void)loadView
{
    self.view=_myview=[LSMainSupplierView new];
    //self.view=_myview=[[LSMainSupplierView alloc]initWithvc:self];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self SetupSupplierInfo];
    
    [LSBLLEat GetGoodsFormEatSPID:self.mysp.sp_id handle:^(NSDictionary *data) {
        _allgoods=[LSFun_Http ConverDict2Model:data cc:[LSModel_VGoods_FatherCategory_Eat_Extend class] isArray:YES];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self setupTable];
        });
    }];
}

-(void)setupTable
{
    _myview.view_table.delegate=self;
    _myview.view_table.dataSource=self;
    [_myview.view_table reloadData];
}

-(void)SetupSupplierInfo
{
    if(_mysp!=nil)
    {
        _myview.view_supplier.label_name.text=_mysp.sp_name;
        _myview.view_supplier.label_address.text=[NSString stringWithFormat:@"地址:%@",_mysp.sp_address];
        _myview.view_supplier.label_simpleinfo.text=_mysp.sp_flag;
        _myview.view_supplier.label_actionword.text=_mysp.sp_action;
        _myview.view_supplier.label_tel.text=[NSString stringWithFormat:@"电话:%@",_mysp.sp_tel];
        [LSBLLCommon LoadHttpPicDefault:_mysp.sp_smallpic control:_myview.view_supplier.view_pic];
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _allgoods.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LSTabelCellGoods *ret=[LSTabelCellGoods new];
    ret.label_name.text=_allgoods[indexPath.row].gs_name;
    ret.label_simpleinfo.text=_allgoods[indexPath.row].gs_smpledesc;
    ret.label_opendate.text=@"开放时间:周一到周日";
    ret.label_price.text=[NSString stringWithFormat:@"价格:%.1f",_allgoods[indexPath.row].gs_price];
    [LSBLLCommon LoadHttpPicDefault:_allgoods[indexPath.row].gs_smallpic control:ret.view_pic];
    return ret;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [LSTabelCellGoods MinHeight];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
 //   LSModel_VGoods_FatherCategory_Eat_Extend *goods= _allgoods[indexPath.row];
    
//    LSOrderVC *ordervc=[LSOrderVC new];
//    ordervc.mysp=_mysp;
//    ordervc.mygoods=goods;
//    
//    [self.navigationController pushViewController:ordervc animated:NO];
}

@end
