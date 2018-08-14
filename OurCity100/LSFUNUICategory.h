//
//  LSFUNUICategory.h
//  MyCityFun
//
//  Created by liangshun on 18/8/3.
//  Copyright © 2018年 liangshun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UILabel(LSCATEGORY)
+(UILabel*)LSDefault:(NSString*)mytext font:(UIFont*)font frontcolor:(UIColor*)frontcolor bgcolor:(UIColor*)bgcolor;
+(UILabel*)LSRound:(NSString*)mytext font:(UIFont*)font frontcolor:(UIColor*)frontcolor bgcolor:(UIColor*)bgcolor bordercolor:(UIColor*)bordercolor;
@end

@interface UIButton(LSCATEGORY)
+(UIButton*)LSRoundBTN:(NSString*)text font:(UIFont*)font frontcolor:(UIColor*)frontcolor bgcolor:(UIColor*)bgcolor tag:(NSInteger)tag bordercolor:(UIColor*)bordercolor;
+(UIButton*)LSDefault:(NSString*)text font:(UIFont*)font frontcolor:(UIColor*)frontcolor bgcolor:(UIColor*)bgcolor tag:(NSInteger)tag;
@end

@interface UITextField(LSCATEGORY)
+(UITextField*)LSReadonlyField:(NSString*)text;
@end

@interface UIView(LSCATEGORY)
+(UIView*)LSRoundView:(UIColor*)borderColer;
+(UIView*)LSBGVIEW:(UIColor*)bgcolor;
@end

@interface UIColor(LSCATEGORY)
+(UIColor*)LSColorOrange;
+(UIColor*)LSColorOrange_selectbg;
+(UIColor*)LSColorBlue_btn;
@end

@interface UIFont(LSCATEGORY)
+(UIFont*)LSSubject;
+(UIFont*)LSTitle;
+(UIFont*)LSContect;
+(UIFont*)LSFlag;
@end
