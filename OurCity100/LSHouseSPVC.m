//
//  LSHouseSPVC.m
//  OurCity100
//
//  Created by linson on 2018/8/15.
//  Copyright © 2018年 linson. All rights reserved.
//

#import "LSHouseSPVC.h"

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


- (void)viewDidLoad {
    [super viewDidLoad];
    
}


@end
