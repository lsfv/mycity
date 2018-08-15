//
//  LSUIPopupcvView.h
//  MyCityFun
//
//  Created by liangshun on 18/8/7.
//  Copyright © 2018年 liangshun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"
#import "LSFUNUICategory.h"
#import "LSUIPopupView.h"

@interface LSUIPopupcvView : UIView
@property(nonatomic)LSUIPopupView *view_main;
@property(nonatomic)UICollectionView *cv_collection;
@property(nonatomic)BOOL mulSelect;

-(id)initWithP_MS:(BOOL)muls;
@end
