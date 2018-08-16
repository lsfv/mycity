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
#import "modelsHeads.h"
#import "LSBLLSupplier.h"
#import "LSBLLCommon.h"
#import "LSBLLCategory.h"
#import "LSMainEatVC.h"
#import "LSHouseSPVC.h"

@interface LSMainIndexVC ()
@property(nonnull) NSMutableArray<LSModel_VCategory_All*>* data_category;
@property(nonnull)  NSMutableArray<LSModel_VSupplier_ALLCategory_Base*>* data_supplier;
@property(nonnull)  NSArray<LSModel_VSupplier_ALLCategory_Base*>* ret;
@end

@implementation LSMainIndexVC

-(void)loadView
{
    self.view=_myview=[LSMainIndexView new];
}

-(void)viewDidLoad {
    [super viewDidLoad];
    [self SetupCity];
    
    [LSBLLSupplier GetIndexSupplier_cityid:self.mysetting.mycity handle:^(NSMutableArray<LSModel_VSupplier_ALLCategory_Base *> *data) {
        dispatch_async(dispatch_get_main_queue(), ^{
            _data_supplier=data;
            [self SetupPics];
            [self SetupTable];
        });
    }];
    
    [LSBLLCategory GetMainCategory:^(NSMutableArray<LSModel_VCategory_All *> *data) {
        _data_category=data;
        dispatch_async(dispatch_get_main_queue(), ^{
            [self SetupCategory];
        });
    }];
    
    
    [self SetupPics];
}

//tableinfo
-(void)SetupTable
{
    _myview.view_suppliers.dataSource=self;
    _myview.view_suppliers.delegate=self;
    [_myview.view_suppliers reloadData];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _data_supplier.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(_data_supplier!=nil)
    {
        LSTableCellSupplier * temp=[LSTableCellSupplier new];
        temp.label_distance.text=@"1.3km";
        temp.label_name.text=_data_supplier[indexPath.row].sp_name;
        temp.label_socre.text=[NSString stringWithFormat:@"评分:%.1f",_data_supplier[indexPath.row].sp_score];
        temp.label_address.text=_data_supplier[indexPath.row].sp_address;
        temp.label_simpledesc.text=_data_supplier[indexPath.row].sp_action;
        [LSBLLCommon LoadHttpPicDefault:_data_supplier[indexPath.row].sp_smallpic control:temp.view_pic];
        return temp;
    }
    else
    {
        return [UITableViewCell new];
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [LSTableCellSupplier GetCellHeight];
}


//category
-(void)SetupCategory
{
    _myview.view_categories.datasorceHandler=self;
}

-(NSInteger)NumberOfBtns:(LSFUNUIRowButtons *)LSEB
{
    return _data_category.count;
}

-(UIButton*)ButtonForIndex:(LSFUNUIRowButtons *)LSEB btnindex:(NSInteger)btnindex
{
    UIButton *ret=[UIButton LSRoundBTN:@"" font:nil frontcolor:nil bgcolor:nil tag:_data_category[btnindex].cg_id bordercolor:nil];
    ret.layer.borderWidth=0;
    [LSBLLCommon LoadHttpPicDefault:_data_category[btnindex].cg_pic control:ret];
    [ret addTarget:self action:@selector(OnClickCategory:) forControlEvents:UIControlEventTouchUpInside];
    return ret;
}

-(void)OnClickCategory:(UIButton*)sender
{
    NSLog(@"点击了第%i张图片",(int)sender.tag);
    switch (sender.tag) {
        case 1://eat
        {
            LSMainEatVC *vc=[[LSMainEatVC alloc]init];
            vc.mycgid=1;
            [self.navigationController pushViewController:vc animated:NO];
            break;
        }
        case 2://house
        {
            LSHouseSPVC *vc=[[LSHouseSPVC alloc]init];
            vc.myCategory=2;
            [self.navigationController pushViewController:vc animated:NO];
            break;
        }
        default:
            break;
    }
}


//pics
-(void)SetupPics
{
    if(_data_supplier!=nil)
    {
        NSPredicate *pre_ads=[NSPredicate predicateWithFormat:@"sp_display =1 "];
        self.ret=[_data_supplier filteredArrayUsingPredicate:pre_ads];
        if(self.ret.count>0)
        {
            int piccount=(int)self.ret.count;
            NSMutableArray *arr=[NSMutableArray new];
            NSMutableArray *describeArray=[NSMutableArray new];
            for(int i=0;i<piccount;i++)
            {
                NSString *temppath=[LSBLLCommon GetFullPicPath:self.ret[i].sp_bigpic];
                [arr addObject:temppath];
                [describeArray addObject:self.ret[i].sp_name];
            }
            
            _myview.pics_index.delegate = self;
            _myview.pics_index.placeholderImage = [UIImage imageNamed:@"placeholder"];
            _myview.pics_index.imageArray = arr;
            _myview.pics_index.describeArray = describeArray;
            _myview.pics_index.time = 5;
            _myview.pics_index.gifPlayMode=GifPlayModePauseWhenScroll;
        }
        else
        {
            _myview.pics_index.delegate = self;
            _myview.pics_index.placeholderImage = [UIImage imageNamed:@"placeholder"];
            _myview.pics_index.imageArray = [NSMutableArray new];
            _myview.pics_index.describeArray = [NSMutableArray new];
            _myview.pics_index.time = 5;
            _myview.pics_index.gifPlayMode=GifPlayModePauseWhenScroll;
        }
    }
}

-(void)carouselView:(XRCarouselView *)carouselView clickImageAtIndex:(NSInteger)index
{
    NSLog(@"点击了第%@张图片", self.ret[index].sp_name);
}

//city
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
    
    [self loadView];
    [self viewDidLoad];
}

@end
