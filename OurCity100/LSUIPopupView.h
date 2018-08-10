//
//  LSUIPopupView.h
//  MyCityFun
//
//  Created by liangshun on 18/8/6.
//  Copyright © 2018年 liangshun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"
#import "LSFUNUICategory.h"

@interface LSUIPopupView : UIView
@property(nonatomic)UIView *view_shadow;
@property(nonatomic)UIView *view_contect;
@property(nonatomic)UIView *view_btns;
@property(nonatomic)UIButton *btn_cancel;
@property(nonatomic)UIButton *btn_ok;
@end
