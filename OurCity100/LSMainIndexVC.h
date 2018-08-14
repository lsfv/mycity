//
//  LSMainIndexVC.h
//  OurCity100
//
//  Created by linson on 2018/8/14.
//  Copyright © 2018年 linson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LSMainIndexView.h"
#import "LSBaseVC.h"
#import "LSFUNUIPopupCityVC.h"

@interface LSMainIndexVC : LSBaseVC<IPOPCITY>
@property(nonatomic)LSMainIndexView *myview;
@end
