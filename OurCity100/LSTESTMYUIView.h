//
//  LSTESTMYUIView.h
//  OurCity100
//
//  Created by linson on 2018/8/10.
//  Copyright © 2018年 linson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LSFUNUIHeads.h"
#import "LSFUNUIRowButtons.h"
#import "LSGBLVariable.h"
#import "LSFUNUIDatepicker.h"

@interface LSTESTMYUIView : UIView
@property(nonatomic)UIButton *btn_city;
@property(nonatomic)UIButton *btn_date;
@property(nonatomic)UIButton *btn_cv;
@property(nonatomic)LSFUNUIRowButtons *btns_test;

@property(nonatomic)LSFUNUIDatepicker *dp_test;
-(id)initWithhandle:(UIViewController<IdpClick,iDatePicker>*)vc;
@end
