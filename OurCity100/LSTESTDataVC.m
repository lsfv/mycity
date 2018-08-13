//
//  LSTESTDataVC.m
//  OurCity100
//
//  Created by linson on 2018/8/13.
//  Copyright © 2018年 linson. All rights reserved.
//

#import "LSTESTDataVC.h"


@interface LSTESTDataVC ()
@property(nonatomic)NSMutableArray<LSModel_VSupplier_ALLCategory_Base*>* data_sp;
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
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _data_sp.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    UITableViewCell* ret=nil;
//    return ret;
    LSTableCellSupplier *ret=[LSTableCellSupplier new];
    ret.label_name.text=_data_sp[indexPath.row].sp_name;
    
    
    return ret;
}

@end
