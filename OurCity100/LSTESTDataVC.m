//
//  LSTESTDataVC.m
//  OurCity100
//
//  Created by linson on 2018/8/13.
//  Copyright © 2018年 linson. All rights reserved.
//

#import "LSTESTDataVC.h"
#import "LSBLLSupplier.h"
#import "LSBLLCommon.h"


@interface LSTESTDataVC ()
@property(nonatomic)NSMutableArray<LSModel_VSupplier_ALLCategory_Base*>* data_supplier;
@end

@implementation LSTESTDataVC

-(void)loadView
{
    self.view=_myview=[LSTESTDataView new];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self SetupTable];
}

-(void)SetupTable
{
    _myview.view_table.dataSource=self;
    _myview.view_table.delegate=self;
    [LSBLLSupplier GetIndexSupplier_cityid:self.mysetting.mycity handle:^(NSMutableArray<LSModel_VSupplier_ALLCategory_Base *> *data) {
        _data_supplier=data;
        dispatch_async(dispatch_get_main_queue(), ^{
            [_myview.view_table reloadData];
        });
    }];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [LSTableCellSupplier GetCellHeight];
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

@end
