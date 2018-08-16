//
//  LSTESTMYUIVC.h
//  OurCity100
//
//  Created by linson on 2018/8/10.
//  Copyright © 2018年 linson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LSTESTMYUIView.h"
#import "LSFUNUIPopupCityVC.h"
#import "LSFUNUIPopupDateVC.h"
#import "LSBaseVC.h"
#import "LSFUNPopupcvVC.h"

@interface LSTESTMYUIVC : LSBaseVC<IPOPCITY,IdpClick,IcvClick,IRowBtnsData,iDatePicker>
@property(nonatomic)LSTESTMYUIView *myview;
@end
