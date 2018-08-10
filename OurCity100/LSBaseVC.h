//
//  LSBaseVC.h
//  OurCity100
//
//  Created by linson on 2018/8/10.
//  Copyright © 2018年 linson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LSModel_LocalStruct.h"
#import "LSBLLLocalData.h"

@interface LSBaseVC : UIViewController
@property(nonatomic)LSBLLLocalData *bll_localdata;
@property(nonatomic)struct_mysetting *mysetting;
@property(nonatomic)struct_me *me;

-(void)Login:(struct_me*)meinfo;
-(void)LoginOut;
-(void)UpdateMe:(struct_me*)meinfo;

-(void)UpdateSetting:(struct_mysetting*)msetting;

-(BOOL)IsLogin;
@end
