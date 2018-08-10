//
//  LSUIPopupCityVC.h
//  MyCityFun
//#import <Foundation/Foundation.h>
//@interface LSModel_VCity : NSObject
//@property (strong,nonatomic) NSString *codeID;
//@property (strong,nonatomic) NSString *name;
//@property (strong,nonatomic) NSString *parentID;
//@end
//  Created by liangshun on 18/8/7.
//  Copyright © 2018年 liangshun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LSUIPopupCity.h"
#import "LSModel_LocalStruct.h"
#import "LSBLLLocalData.h"

@class LSFUNUIPopupCityVC;
@protocol IPOPCITY <NSObject>
-(void)OnClickOK:(NSString*)mycity sender:(LSFUNUIPopupCityVC*)sender;
@end

@interface LSFUNUIPopupCityVC : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource>
-(id)initWithP:(NSString*)cityCode provinces:(NSMutableArray<struct_city*>*) provinces citys:(NSMutableArray<NSMutableArray<struct_city*>*> *)citys handle:(UIViewController<IPOPCITY>*)handle;
@property(nonatomic)LSUIPopupCity *myview;
@property(nonatomic)NSString *citycode;
@property(nonatomic)UIViewController<IPOPCITY> *myhandle;
@property(nonatomic)NSMutableArray<struct_city*>* provinces;
@property(nonatomic)NSMutableArray<NSMutableArray<struct_city*>*> *citys;
@end
