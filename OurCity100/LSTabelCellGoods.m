//
//  LSTabelCellGoods.m
//  MyCity100
//
//  Created by liangshun on 18/7/11.
//  Copyright © 2018年 liangshun. All rights reserved.
//

#import "LSTabelCellGoods.h"

@implementation LSTabelCellGoods


-(id)init
{
    if(self=[super init])
    {
        _view_pic=[UIImageView new];
        //_view_pic.backgroundColor=[UIColor greenColor];
        _view_right=[UIView new];
        //_view_right.backgroundColor=[UIColor blueColor];
        _label_name=[UILabel new];
        //_label_name.backgroundColor=[UIColor grayColor];
        _label_simpleinfo=[UILabel new];
        //_label_simpleinfo.backgroundColor=[UIColor cyanColor];
        _label_opendate=[UILabel new];
        //_label_opendate.backgroundColor=[UIColor yellowColor];
        _label_price=[UILabel new];
        
        
        [self addSubview:_view_pic];
        [self addSubview:_view_right];
        [_view_right addSubview:_label_simpleinfo];
        [_view_right addSubview:_label_name];
        [_view_right addSubview:_label_price];
        [_view_right addSubview:_label_opendate];
        
        _label_name.font=[UIFont LSTitle];
        _label_simpleinfo.font=[UIFont  LSContect];
        _label_simpleinfo.textColor=[UIColor LSColorOrange];
        _label_opendate.font=[UIFont LSContect];
        _label_price.font=[UIFont LSContect];
        _label_price.textColor=[UIColor LSColorOrange];
        
    }
    return self;
}

+(BOOL)requiresConstraintBasedLayout
{
    return YES;
}

-(void)updateConstraints
{
    [_view_pic mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top);
        make.left.equalTo(self.mas_left);
        make.width.offset(100);
        make.bottom.equalTo(self.mas_bottom).offset(-1);
    }];
    
    [_view_right mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top);
        make.left.equalTo(_view_pic.mas_right).offset(2);
        make.right.equalTo(self.mas_right);
        make.bottom.equalTo(self.mas_bottom);
    }];
    
    [_label_name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_view_right.mas_top);
        make.left.equalTo(_view_right.mas_left);
        make.right.equalTo(_view_right.mas_right);
        make.height.equalTo(@17);
    }];
    
    [_label_simpleinfo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_label_name.mas_bottom).offset(2);
        make.left.equalTo(_view_right.mas_left);
        make.right.equalTo(_view_right.mas_right);
        make.height.equalTo(@14);
    }];
    [_label_opendate mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_label_simpleinfo.mas_bottom).offset(2);
        make.left.equalTo(_view_right.mas_left);
        make.right.equalTo(_view_right.mas_right);
        make.height.equalTo(@14);
    }];
    [_label_price mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_label_opendate.mas_bottom).offset(2);
        make.left.equalTo(_view_right.mas_left);
        make.right.equalTo(_view_right.mas_right);
        make.height.equalTo(@14);
    }];

    
   
    [super updateConstraints];
}


+(int)MinHeight
{
    return 67+2;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
