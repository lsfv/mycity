//
//  LSReuseDatepicker.h
//  MyCity100
//
//  Created by liangshun on 18/7/21.
//  Copyright © 2018年 liangshun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LSFUNUIPopupDateVC.h"

@protocol iDatePicker <NSObject>
-(void)OnClickBtns_updateParemeters:(NSDate**)indate outdate:(NSDate**)outdate;
@end

@interface LSFUNUIDatepicker : UIView
@property(nonatomic)UILabel *label_intime;
@property(nonatomic)UIButton *btn_intime;
@property(nonatomic)UILabel *label_outtime;
@property(nonatomic)UIButton *btn_outtime;
@property(nonatomic)UIViewController<iDatePicker,IdpClick>* myDelegater;
@property(nonatomic)LSFUNUIPopupDateVC *vc;

-(id)initWithhandle:(UIViewController<iDatePicker,IdpClick> *)handle;
+(NSNumber*)myHeight;
@end
