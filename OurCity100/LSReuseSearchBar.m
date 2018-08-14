//
//  LSReuseSearchBar.m
//  OurCity100
//
//  Created by linson on 2018/8/14.
//  Copyright © 2018年 linson. All rights reserved.
//

#import "LSReuseSearchBar.h"

@implementation LSReuseSearchBar

-(id)initWithP_currentvc:(UIViewController*)vc
{
    if(self=[super init])
    {
        _currentvc=vc;
        self.translatesAutoresizingMaskIntoConstraints=NO;
        self.btn_back=[UIButton new];
        [self.btn_back setTitle:@"<" forState:UIControlStateNormal];
        [self.btn_back setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [self.btn_back setTag:1];
        [self addSubview:self.btn_back];
        self.searchBar=[UISearchBar new];
        [self.searchBar setTag:2];
        [self addSubview:self.searchBar];
        
        [self.btn_back addTarget:self action:@selector(OnClickBack:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

-(void)OnClickBack:(UIButton*)sender
{
    [_currentvc.navigationController popViewControllerAnimated:NO];
}

+(BOOL)requiresConstraintBasedLayout
{
    return true;
}

+(NSInteger)MyHeight
{
    return 40;
}

- (void)updateConstraints
{
    [_btn_back mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(0);
        make.top.offset(5);
        make.bottom.offset(-5);
        make.width.equalTo(@16);
        
    }];
    [_searchBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_btn_back.mas_right).offset(5);
        make.top.offset(0);
        make.right.offset(0);
        make.bottom.offset(0);
    }];
    [super updateConstraints];
}
@end
