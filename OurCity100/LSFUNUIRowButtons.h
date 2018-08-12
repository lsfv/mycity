//
//  LSUIOneLineButtons.h
//  MyCityFun
//
//  Created by liangshun on 18/8/5.
//  Copyright © 2018年 liangshun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"

@class LSFUNUIRowButtons;

@protocol IRowBtnsData <NSObject>
-(NSInteger)NumberOfBtns:(LSFUNUIRowButtons*)LSEB;
-(UIButton*)ButtonForIndex:(LSFUNUIRowButtons*)LSEB btnindex:(NSInteger)btnindex;
@end

@interface LSFUNUIRowButtons : UIView
-(id)initWithBtnParemater_left:(NSInteger)paddingleft paddingright:(NSInteger)paddingright btnwidth:(NSInteger)btnwidth bgcolor:(UIColor*)bgcolor;
@property(nonatomic)NSInteger paddingleft;
@property(nonatomic)NSInteger paddingright;
@property(nonatomic)NSInteger btnwidth;
-(void)LoadDate;
@property(nonatomic)id<IRowBtnsData> datasorceHandler;
@end
