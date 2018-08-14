//
//  LSReuseSearchBar.h
//  OurCity100
//
//  Created by linson on 2018/8/14.
//  Copyright © 2018年 linson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"

@interface LSReuseSearchBar : UIView
@property(nonatomic,strong)UIButton * btn_back;
@property(nonatomic,strong)UISearchBar *searchBar;
@property(nonatomic)UIViewController *currentvc;
+(NSInteger)MyHeight;
-(id)initWithP_currentvc:(UIViewController*)vc;
@end
