//
//  LSUIPopupDateVC.h
//  MyCityFun
//
//  Created by liangshun on 18/8/7.
//  Copyright © 2018年 liangshun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LSFUNUIPopupDateVIew.h"

@class LSFUNUIPopupDateVC;
@protocol IdpClick <NSObject>
-(void)OnClickOK:(NSDate*)timefrom timeto:(NSDate*)timeto sender:(LSFUNUIPopupDateVC*)sender;
@end

@interface LSFUNUIPopupDateVC : UIViewController
-(id)initWithP:(NSDate*)from to:(NSDate*)to handle:(UIViewController<IdpClick>*)handle;
@property(nonatomic)LSUIPopupDateVIew *myview;
@property(nonatomic)NSDate *intime;
@property(nonatomic)NSDate *outtime;
@property(nonatomic)UIViewController<IdpClick> *myhandle;
@end
