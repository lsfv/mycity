//
//  LSMainSupplierView.m
//  OurCity100
//
//  Created by linson on 2018/8/15.
//  Copyright © 2018年 linson. All rights reserved.
//

#import "LSMainSupplierView.h"

@interface LSMainSupplierView()
-(id)init;
@end

@implementation LSMainSupplierView

-(id)init
{
    return nil;
}

-(id)initWithvc:(UIViewController*)vc
{
    if(self=[super init])
    {
        _view_searchbar=[[LSReuseSearchBar alloc]initWithP_currentvc:vc];
        [self addSubview:_view_searchbar];
        
        _view_supplier=[LSReuseSupplier new];
        //_view_supplier.backgroundColor=[UIColor redColor];
        [self addSubview:_view_supplier];
        _view_supplier.translatesAutoresizingMaskIntoConstraints=NO;
        
        _view_table=[UITableView new];
        [self addSubview:_view_table];
    }
    return self;
}

+(BOOL)requiresConstraintBasedLayout
{
    return true;
}


-(void)updateConstraints
{
    [_view_searchbar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(paddingtop);
        make.left.equalTo(self.mas_left).offset(paddingleft);
        make.right.equalTo(self.mas_right).offset(-paddingright);
        make.height.equalTo([NSNumber numberWithInteger:[LSReuseSearchBar MyHeight]]);
    }];
    
    [_view_supplier mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_view_searchbar.mas_bottom).offset(3);
        make.left.equalTo(self.mas_left).offset(paddingleft);
        make.right.equalTo(self.mas_right).offset(-paddingright);
        make.height.equalTo([LSReuseSupplier myHeight]);
    }];
    
    [_view_table mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_view_supplier.mas_bottom).offset(7);
        make.left.equalTo(self.mas_left).offset(paddingleft);
        make.right.equalTo(self.mas_right).offset(-paddingright);
        make.bottom.equalTo(self.mas_bottom).offset(-1);
    }];
    
    [super updateConstraints];
}
@end
