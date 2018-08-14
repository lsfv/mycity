//
//  LSFUNUICategory.m
//  MyCityFun
//
//  Created by liangshun on 18/8/3.
//  Copyright © 2018年 liangshun. All rights reserved.
//

#import "LSFUNUICategory.h"

@implementation UILabel(LSCATEGORY)

+(UILabel*)LSDefault:(NSString*)mytext font:(UIFont*)font frontcolor:(UIColor*)frontcolor bgcolor:(UIColor*)bgcolor
{
    UILabel *mylabel=[UILabel new];
    [mylabel setText:mytext];
    if(font!=nil)
    {
        [mylabel setFont:font];
    }
    else
    {
        [mylabel setFont:[UIFont systemFontOfSize:14 weight:UIFontWeightRegular]];
    }
    if(frontcolor!=nil)
    {
        [mylabel setTextColor:frontcolor];
    }
    else
    {
        [mylabel setTextColor:[UIColor blackColor]];
    }
    if(bgcolor!=nil)
    {
        mylabel.backgroundColor=bgcolor;
    }
    else
    {
        mylabel.backgroundColor=[UIColor whiteColor];
    }
    
    return mylabel;
}


+(UILabel*)LSRound:(NSString*)mytext font:(UIFont*)font frontcolor:(UIColor*)frontcolor bgcolor:(UIColor*)bgcolor bordercolor:(UIColor*)bordercolor
{
    UILabel *mylabel=[UILabel LSDefault:mytext font:font frontcolor:frontcolor bgcolor:bgcolor];
    mylabel.textAlignment=NSTextAlignmentCenter;
    if(bordercolor==nil)
    {
        [mylabel.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    }
    else
    {
        [mylabel.layer setBorderColor:bordercolor.CGColor];
    }
    [mylabel.layer setBorderWidth:1];
    [mylabel.layer setMasksToBounds:YES];
    [mylabel.layer setCornerRadius:3];
    mylabel.layer.masksToBounds = YES;
    
    return mylabel;
}

@end

@implementation UIButton(LSCATEGORY)


+(UIButton*)LSDefault:(NSString*)text font:(UIFont*)font frontcolor:(UIColor*)frontcolor bgcolor:(UIColor*)bgcolor tag:(NSInteger)tag
{
    UIButton *ret=[UIButton new];
    [ret setTitle:text forState:UIControlStateNormal];
    [ret setTag:tag];
    if(font!=nil)
    {
        ret.titleLabel.font=font;
    }
    else
    {
        ret.titleLabel.font=[UIFont LSContect];
    }
    if(frontcolor!=nil)
    {
        [ret setTitleColor:frontcolor forState:UIControlStateNormal];
    }
    else
    {
        [ret setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    
    if(bgcolor!=nil)
    {
        ret.backgroundColor=bgcolor;
    }
    else
    {
        ret.backgroundColor=[UIColor whiteColor];
    }
    
    [ret.layer setBorderWidth:1];
    [ret.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    
    return ret;
}

+(UIButton*)LSRoundBTN:(NSString*)text font:(UIFont*)font frontcolor:(UIColor*)frontcolor bgcolor:(UIColor*)bgcolor tag:(NSInteger)tag bordercolor:(UIColor*)bordercolor
{
    UIButton *tempbtn=[UIButton LSDefault:text font:font frontcolor:frontcolor bgcolor:bgcolor tag:tag];
    tempbtn.titleLabel.textAlignment=NSTextAlignmentCenter;

    if(bordercolor!=nil)
    {
        [tempbtn.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    }
    else
    {
        [tempbtn.layer setBorderColor:bordercolor.CGColor];
    }
    [tempbtn.layer setBorderWidth:1];
    [tempbtn.layer setMasksToBounds:YES];
    [tempbtn.layer setCornerRadius:3];
    tempbtn.layer.masksToBounds = YES;
    
    return tempbtn;
}



@end


@implementation UITextField(LSCATEGORY)

+(UITextField*)LSReadonlyField:(NSString*)text
{
    UITextField *field=[UITextField new];
    field.text=text;
    field.textColor=[UIColor blackColor];
    field.borderStyle=UITextBorderStyleRoundedRect;
    field.userInteractionEnabled=false;
    return field;
}

@end

@implementation UIView(LSCATEGORY)
+(UIView*)LSRoundView:(UIColor*)borderColer
{
    UIView *myView=[UIView new];
    myView.layer.cornerRadius = 8;
    myView.layer.masksToBounds = YES;
    myView.layer.borderWidth = 1;
    if(borderColer==nil)
    {
        myView.layer.borderColor =[ [UIColor grayColor] CGColor];
    }
    else
    {
        myView.layer.borderColor=(__bridge CGColorRef _Nullable)(borderColer);
    }
    return myView;
}

+(UIView*)LSBGVIEW:(UIColor*)bgcolor
{
    UIView *myView=[UIView new];
    if(bgcolor==nil)
    {
        myView.backgroundColor =[UIColor blackColor];
    }
    else
    {
        myView.backgroundColor=bgcolor;
    }
    return myView;
}
@end


@implementation UIColor(LSCATEGORY)
+(UIColor*)LSColorOrange
{
    return [UIColor colorWithRed:1 green:(float)109/255 blue:0 alpha:1];
}
+(UIColor*)LSColorOrange_selectbg
{
    return  [UIColor colorWithRed:(float)97/255 green:(float)180/255 blue:(float)246/255 alpha:1];
}
+(UIColor*)LSColorBlue_btn
{
    return  [UIColor colorWithRed:(float)15/255 green:(float)130/255 blue:(float)235/255 alpha:1];
}
@end

@implementation UIFont(LSCATEGORY)
+(UIFont*)LSSubject
{
    return [UIFont systemFontOfSize:18 weight:UIFontWeightBold];
}
+(UIFont*)LSTitle
{
    return [UIFont systemFontOfSize:16 weight:UIFontWeightBold];
}
+(UIFont*)LSContect
{
    return [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];
}
+(UIFont*)LSFlag
{
    return [UIFont systemFontOfSize:12 weight:UIFontWeightRegular];
}
@end

