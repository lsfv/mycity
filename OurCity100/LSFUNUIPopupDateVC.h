//
//  LSUIPopupDateVC.h
//  MyCityFun
//
//  Created by liangshun on 18/8/7.
//  Copyright © 2018年 liangshun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LSFUNUIPopupDateVIew.h"

@class LSUIPopupDateVC;
@protocol dpClick <NSObject>
-(void)OnClickOK:(NSDate*)timefrom timeto:(NSDate*)timeto sender:(LSUIPopupDateVC*)sender;
@end

@interface LSUIPopupDateVC : UIViewController
@property(nonatomic)LSUIPopupDateVIew *myview;
@property(nonatomic)NSDate *intime;
@property(nonatomic)NSDate *outtime;
@property(nonatomic)UIViewController<dpClick> *myhandle;
@end
