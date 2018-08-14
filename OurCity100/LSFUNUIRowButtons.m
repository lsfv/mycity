//
//  LSUIOneLineButtons.m
//  MyCityFun
//
//  Created by liangshun on 18/8/5.
//  Copyright © 2018年 liangshun. All rights reserved.
//

#import "LSFUNUIRowButtons.h"

@interface LSFUNUIRowButtons()
@property(nonatomic)NSMutableArray<UIButton*>* array_btn;
@end

@implementation LSFUNUIRowButtons
-(id)initWithBtnParemater_left:(NSInteger)paddingleft paddingright:(NSInteger)paddingright btnwidth:(NSInteger)btnwidth bgcolor:(UIColor*)bgcolor
{
    if(self=[super init])
    {
        _btnwidth=btnwidth;
        _paddingleft=paddingleft;
        _paddingright=paddingright;
        _array_btn=[NSMutableArray<UIButton*> new];
        if(bgcolor==nil)
        {
            self.backgroundColor=[UIColor whiteColor];
        }
        else
        {
            self.backgroundColor=bgcolor;
        }
        self.translatesAutoresizingMaskIntoConstraints=false;
    }
    return self;
}

-(void)setDatasorceHandler:(id<IRowBtnsData>)datasorceHandler
{
    _datasorceHandler  =datasorceHandler;
    [self LoadDate];
}

-(void)LoadDate
{
    if(_datasorceHandler!=nil)
    {
        
        int btnCount=(int)[_datasorceHandler NumberOfBtns:self];
        
        for(int i=0;i<btnCount;i++)
        {
            UIButton *tempBtn=[_datasorceHandler ButtonForIndex:self btnindex:i];
            if(tempBtn!=nil)
            {
                [_array_btn addObject:tempBtn];
                [self addSubview:tempBtn];
            }
        }
        [self setNeedsUpdateConstraints];
    }
}

-(void)updateConstraints
{
    if(_array_btn.count>1)
    {
        [_array_btn mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedItemLength:_btnwidth leadSpacing:_paddingleft tailSpacing:_paddingright];
        [_array_btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_top);
            make.height.equalTo(self.mas_height);
        }];
    }
    else if(_array_btn.count==1)
    {
        [_array_btn[0] mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self);
            make.left.equalTo(self.mas_left).offset(_paddingleft);
            make.width.offset(_btnwidth);
            make.height.equalTo(self);
        }];
    }
    [super updateConstraints];
}

@end
