//
//  LSPopupcvVC.h
//  MyCityFun
//
//  Created by liangshun on 18/8/7.
//  Copyright © 2018年 liangshun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LSUIPopupcvView.h"

@class LSFUNPopupcvVC;
@protocol IcvClick <NSObject>
-(void)OnCVClickOK:(NSMutableArray<NSIndexPath*>*)myChoose sender:(LSFUNPopupcvVC*)sender;
@end

@interface LSFUNPopupcvVC : UIViewController<UICollectionViewDelegate,UICollectionViewDataSource>
-(id)initWithP:(NSMutableArray<NSString*>*)data preselect:(NSMutableArray<NSIndexPath*>*)preselect  handle:(UIViewController<IcvClick> *)handle mulsel:(BOOL)mulsel;
@property(nonatomic)LSUIPopupcvView *myview;
@property(nonatomic)UIViewController<IcvClick> *myhandle;
@property(nonatomic)NSMutableArray<NSIndexPath*> *preselect;
@property(nonatomic)NSMutableArray<NSString*> *data;
@property(nonatomic)BOOL mulsel;
@end
