//
//  LSHouseSPVC.m
//  OurCity100
//
//  Created by linson on 2018/8/15.
//  Copyright © 2018年 linson. All rights reserved.
//

#import "LSHouseSPVC.h"
#import "LSBLLHouse.h"
#import "LSBLLCommon.h"
#import "LSTableCellSupplier.h"
#import "LSFUNPopupcvVC.h"

@interface LSHouseSPVC ()
@property(nonatomic)NSArray<struct_btn*>* filterBarData;
@property(nonatomic)struct_houseSearch *myFilterStruct;
@property(nonatomic)NSMutableArray<LSModel_VSupplier_FatherCategory_house_Extend*>* array_sp;
@property(nonatomic)NSMutableArray<LSModel_VSupplier_FatherCategory_house_Extend*>* array_filter_sp;
@property(nonatomic)NSArray<LSModel_VSupplier_FatherCategory_house_Extend*>* ret;//pics
@end

@implementation LSHouseSPVC

-(void)loadView
{
    self.view=_myview=[[LSHouseSPView alloc]initWithhandle:self];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.myFilterStruct=[struct_houseSearch new];
    _myFilterStruct.intime=[NSDate date];
    _myFilterStruct.outtime=[NSDate date];
    NSString *strindate=[LSBLLCommon GetDatewithFormat:@"yyyy-MM-dd" mydate:_myFilterStruct.intime];
    NSString *stroutdate=[LSBLLCommon GetDatewithFormat:@"yyyy-MM-dd" mydate:_myFilterStruct.outtime];
    
    [LSBLLHouse GetHouseSuppliers:self.mysetting.mycity indate:strindate outdate:stroutdate handle:^(NSDictionary *data)
    {
        _array_sp=[LSFun_Http ConverDict2Model:data cc:[LSModel_VSupplier_FatherCategory_house_Extend class] isArray:YES];
        _array_filter_sp=[_array_sp mutableCopy];
        NSPredicate *pre_ads=[NSPredicate predicateWithFormat:@"sp_display =1 "];
        _ret=[_array_sp filteredArrayUsingPredicate:pre_ads];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self SetupPics];
            [self SetupTable];
        });
    }];
    
    [self SetupFilter];
}

//filter
-(void)SetupFilter
{
    _filterBarData=[LSBLLHouse InitBardataHouse];
    _myview.view_filter.datasorceHandler=self;
}
-(NSInteger)NumberOfBtns:(LSFUNUIRowButtons *)LSEB
{
    return _filterBarData.count;
}

-(UIButton*)ButtonForIndex:(LSFUNUIRowButtons *)LSEB btnindex:(NSInteger)btnindex
{
    UIButton *ret=nil;
    ret=[UIButton LSRoundBTN:_filterBarData[btnindex].btntext font:nil frontcolor:nil bgcolor:nil tag:_filterBarData[btnindex].btntag bordercolor:nil];
    [ret addTarget:self action:@selector(PopupView:) forControlEvents:UIControlEventTouchUpInside];
    return ret;
}


-(void)RefleshData
{
    
}

-(void)OnCVClickOK:(NSMutableArray<NSIndexPath *> *)myChoose sender:(LSFUNPopupcvVC *)sender
{
    if([sender.title isEqual:@"housetype"])
    {
        if(myChoose!=nil&&myChoose.count>0)
        {
            _myFilterStruct.housePeople=myChoose[0].row;
        }
        else
        {
            _myFilterStruct.housePeople=-1;
        }
        [self RefleshData];
    }
    
    
//    if([sender.title isEqual:@"et"])
//    {
//        _myFilterStruct.eatPeople=myChoose;
//        [self RefleshData];
//    }
//    else if([sender.title isEqual:@"ecategory"])
//    {
//        if(myChoose!=nil&&myChoose.count>0)
//        {
//            self.myFilterStruct.subCategory=_array_eatcategory[myChoose[0].row].cg_id;
//        }
//        else
//        {
//            self.myFilterStruct.subCategory=0;
//        }
//        [self RefleshData];
//    }
}


-(void)PopupView:(UIButton*)sender
{
    int tag=(int)sender.tag;
    NSLog(@"tag:%i",(int)tag);
    if(tag==enum_spfilter)
    {
        NSMutableArray<struct_btn*>* data=(NSMutableArray<struct_btn*>*)[LSBLLHouse InitHouseTypeData];
        NSMutableArray<NSIndexPath*>* preselect=[LSBLLHouse GetindexPath4Select_housetype:data selectindex:_myFilterStruct.housePeople];
        LSFUNPopupcvVC *vc=[[LSFUNPopupcvVC alloc]initWithP:data preselect:preselect handle:self mulsel:NO];
        vc.title=@"housetype";
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


//datepicker
-(void)OnClickBtns_updateParemeters:(NSDate *__autoreleasing *)indate outdate:(NSDate *__autoreleasing *)outdate
{
    *indate=_myFilterStruct.intime;
    *outdate=_myFilterStruct.outtime;
}
-(void)OnClickOK:(NSDate *)timefrom timeto:(NSDate *)timeto sender:(LSFUNUIPopupDateVC *)sender
{
    _myFilterStruct.intime=timefrom;
    _myFilterStruct.outtime=timeto;
    [_myview.view_date.btn_intime setTitle:[LSBLLCommon GetDatewithFormat:gbl_dateformat mydate:timefrom] forState:UIControlStateNormal];
    [_myview.view_date.btn_outtime setTitle:[LSBLLCommon GetDatewithFormat:gbl_dateformat mydate:timeto] forState:UIControlStateNormal];
}


-(void)SetupTable
{
    _myview.view_table.dataSource=self;
    _myview.view_table.delegate=self;
    [_myview.view_table reloadData];
}


//pic
-(void)SetupPics
{
    if(self.ret==nil)
    {
        return;
    }
    
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
        
        _myview.view_bigpic.delegate = self;
        _myview.view_bigpic.placeholderImage = [UIImage imageNamed:@"placeholder"];
        _myview.view_bigpic.imageArray = arr;
        _myview.view_bigpic.describeArray = describeArray;
        _myview.view_bigpic.time = 5;
        _myview.view_bigpic.gifPlayMode=GifPlayModePauseWhenScroll;
    }
    else
    {
        _myview.view_bigpic.delegate = self;
        _myview.view_bigpic.placeholderImage = [UIImage imageNamed:@"placeholder"];
        _myview.view_bigpic.imageArray = [NSMutableArray new];
        _myview.view_bigpic.describeArray = [NSMutableArray new];
        _myview.view_bigpic.time = 5;
        _myview.view_bigpic.gifPlayMode=GifPlayModePauseWhenScroll;
    }
}

-(void)carouselView:(XRCarouselView *)carouselView clickImageAtIndex:(NSInteger)index
{
    
}


//table
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _array_filter_sp.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(_array_filter_sp !=nil)
    {
        LSTableCellSupplier * temp=[LSTableCellSupplier new];
        temp.label_distance.text=@"1.3km";
        temp.label_name.text=_array_filter_sp[indexPath.row].sp_name;
        temp.label_socre.text=[NSString stringWithFormat:@"评分:%.1f",_array_filter_sp[indexPath.row].sp_score];
        temp.label_address.text=_array_filter_sp[indexPath.row].sp_address;
        temp.label_simpledesc.text=_array_filter_sp[indexPath.row].sp_action;
        [LSBLLCommon LoadHttpPicDefault:_array_filter_sp[indexPath.row].sp_smallpic control:temp.view_pic];
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

@end
