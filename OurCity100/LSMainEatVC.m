//
//  LSMainEatVC.m
//  OurCity100
//
//  Created by linson on 2018/8/14.
//  Copyright © 2018年 linson. All rights reserved.
//

#import "LSMainEatVC.h"
#import "LSBLLEat.h"
#import "LSBLLCategory.h"
#import "LSFUNPopupcvVC.h"
#import "LSTableCellSupplier.h"


@interface LSMainEatVC ()
@property(nonatomic)NSArray<struct_btn*>* filterBarData;
@property(nonatomic)NSMutableArray<LSModel_VCategory_All*>* array_eatcategory;
@property(nonatomic)NSMutableArray<LSModel_VSupplier_FatherCategory_Eat_Extend*>* array_eatSupplier;
@property(nonatomic)NSMutableArray<LSModel_VSupplier_FatherCategory_Eat_Extend*>* array_filter_eatSupplier;
@property(nonatomic)struct_eatSearch *myFilterStruct;
@end

@implementation LSMainEatVC

-(void)loadView
{
    self.view=_myview=[[LSMainEatView alloc]initWithvc:self];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    _myFilterStruct=[struct_eatSearch new];
    
    [LSBLLCategory GetSubCategory:_mycgid handle:^(NSDictionary *data) {
        _array_eatcategory=[LSFun_Http ConverDict2Model:data cc:[LSModel_VCategory_All class] isArray:YES];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self setupCategory];
        });
    }];
    
    [self setupFilter];
    
    [LSBLLEat GetEatSuppliers:self.mysetting.mycity handle:^(NSDictionary *data) {
        _array_eatSupplier=[LSFun_Http ConverDict2Model:data cc:[LSModel_VSupplier_FatherCategory_Eat_Extend class] isArray:YES];
        _array_filter_eatSupplier=[_array_eatSupplier mutableCopy];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self setupTable];
        });
    }];
}

//reload data;
-(void)RefleshData
{
        //根据每个小类选择条件，逐步进行并过滤。
        //条件内部有并和或。把或的组合到一起处理一次并过滤。
        _array_filter_eatSupplier=nil;
        _array_filter_eatSupplier=[_array_eatSupplier mutableCopy];
        if(self.myFilterStruct.subCategory!=0)
        {
            NSString *strpredict=[NSString stringWithFormat:@"sp_cgid=%i",(int)self.myFilterStruct.subCategory];
            NSLog(@"predit:%@",strpredict);
            NSPredicate *predicte1=[NSPredicate predicateWithFormat:strpredict];
            [_array_filter_eatSupplier filterUsingPredicate:predicte1];
        }
//        if(self.myFilterStruct.eatPeople.count>0)
//        {
//            NSString *eatPredict=[LSBLL GetEetPopeleCountPredict:self.myFilterStruct.eatPeople];
//            NSPredicate *predicte1=[NSPredicate predicateWithFormat:eatPredict];
//            [_array_filter_eatSupplier filterUsingPredicate:predicte1];
//        }
        if(self.myFilterStruct.distance!=0)
        {
            if(self.myFilterStruct.distance==enum_1km)
            {
                //限定为1000米
                NSLog(@"限定为1000米");
            }
            else if(self.myFilterStruct.distance==enum_2km)
            {
                //限定为1000米
                NSLog(@"限定为2000米");
            }
            
        }
        [_myview.view_table reloadData];
}



//table
-(void)setupTable
{
    _myview.view_table.dataSource=self;
    _myview.view_table.delegate=self;
    [_myview.view_table reloadData];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _array_filter_eatSupplier.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(_array_filter_eatSupplier !=nil)
    {
        LSTableCellSupplier * temp=[LSTableCellSupplier new];
        temp.label_distance.text=@"1.3km";
        temp.label_name.text=_array_filter_eatSupplier[indexPath.row].sp_name;
        temp.label_socre.text=[NSString stringWithFormat:@"评分:%.1f",_array_filter_eatSupplier[indexPath.row].sp_score];
        temp.label_address.text=_array_filter_eatSupplier[indexPath.row].sp_address;
        temp.label_simpledesc.text=_array_filter_eatSupplier[indexPath.row].sp_action;
        [LSBLLCommon LoadHttpPicDefault:_array_filter_eatSupplier[indexPath.row].sp_smallpic control:temp.view_pic];
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


//setupFilter
-(void)setupFilter
{
    _filterBarData=[LSBLLEat InitBardata];
    _myview.view_filter.datasorceHandler=self;
}


//category
-(void)setupCategory
{
    if(_array_eatcategory!=nil&&_array_eatcategory.count==8)
    {
        _myview.view_subCategorys.datasorceHandler=self;
        _myview.view_subCategorys2.datasorceHandler=self;
    }
}

-(NSInteger)NumberOfBtns:(LSFUNUIRowButtons *)LSEB
{
    if(LSEB==_myview.view_subCategorys||LSEB==_myview.view_subCategorys2)
    {
        return 4;
    }
    else if (LSEB==_myview.view_filter)
    {
        return _filterBarData.count;
    }
    else
    {
        return 0;
    }
}

-(UIButton*)ButtonForIndex:(LSFUNUIRowButtons *)LSEB btnindex:(NSInteger)btnindex
{
    UIButton * ret=nil;
    if(LSEB==_myview.view_subCategorys||LSEB==_myview.view_subCategorys2)
    {
        if(_array_eatcategory.count>=8)
        {
            ret=[UIButton new];
            int preindex=0;
            if(LSEB==_myview.view_subCategorys2)
            {
                preindex=4;
            }
            [LSBLLCommon LoadHttpPicDefault:self.array_eatcategory[preindex+btnindex].cg_pic control:ret];
            [ret setTag:_array_eatcategory[preindex+btnindex].cg_id];
            ret.titleLabel.text=self.array_eatcategory[preindex+btnindex].cg_name;//如果不想显示，但作为数据存储，可以用这种方式。否则应该call function.
            [ret addTarget:self action:@selector(OnClick_category:) forControlEvents:UIControlEventTouchUpInside];
        }
    }
    else if (LSEB==_myview.view_filter)
    {
        ret=[UIButton LSRoundBTN:_filterBarData[btnindex].btntext font:nil frontcolor:nil bgcolor:nil tag:_filterBarData[btnindex].btntag bordercolor:nil];
        [ret addTarget:self action:@selector(PopupView:) forControlEvents:UIControlEventTouchUpInside];
    }
    return ret;
}

-(void)OnCVClickOK:(NSMutableArray<NSIndexPath *> *)myChoose sender:(LSFUNPopupcvVC *)sender
{
    if([sender.title isEqual:@"et"])
    {
        _myFilterStruct.eatPeople=myChoose;
        [self RefleshData];
    }
}


-(void)PopupView:(UIButton*)sender
{
    int tag=(int)sender.tag;
    NSLog(@"tag:%i",(int)tag);
    if(tag==enum_category)
    {
        //pop view. and then define view and protocal .and impl it in here. and then chanage filter sturct .and then reflesh.
    }
    else if(tag==enum_spfilter)
    {
        NSMutableArray<NSString*>* data=(NSMutableArray<NSString*>*)[LSBLLEat InitEatTypeDate];
        
        LSFUNPopupcvVC *vc=[[LSFUNPopupcvVC alloc]initWithP:data preselect:_myFilterStruct.eatPeople handle:self mulsel:YES];
        vc.title=@"et";
        [self.navigationController presentViewController:vc animated:YES completion:nil];
    }
    else if(tag==enum_square)
    {
        
    }
    else if(tag==enum_distance)
    {
        
    }
    else if(tag==enum_orderby)
    {
        
    }
}


-(void)OnClick_category:(UIButton*)sender
{
    _myFilterStruct.subCategory=sender.tag;
    [self RefleshData];
}
@end
