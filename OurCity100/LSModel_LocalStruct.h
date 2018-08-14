//
//  LSGbl_Struct.h
//  OurCity100
//
//  Created by linson on 2018/8/10.
//  Copyright © 2018年 linson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface struct_btn : NSObject
@property(nonatomic) NSInteger btntag;
@property(nonatomic) NSString *btntext;
@property(nonatomic,weak)UIButton *btnptr;
@property(nonatomic) NSString *btnimg;
@end

@interface NavigationControllerInfo : NSObject
@property(nonatomic,strong) NSString* itemName;
@property(nonatomic)UIViewController* itemVC;
@property(nonatomic)UIImage * itemPic;
@end


@interface struct_mysetting : NSObject
@property(nonatomic)NSString *mycity;
@property(nonatomic)NSString *mysquares;
@end


@interface struct_me : NSObject
@property (nonatomic)NSInteger u_id;
@property (strong,nonatomic) NSString *u_loginname;
@property (strong,nonatomic) NSString *u_psw;
@property (strong,nonatomic) NSString *u_nick;
@property (nonatomic)NSInteger u_level;
@property (nonatomic)NSInteger u_score;
@property (strong,nonatomic) NSString *u_img;
@property (strong,nonatomic) NSString *u_keepitem;
@property (strong,nonatomic) NSDate * u_lastlogin;
@property (strong,nonatomic) NSString *u_extend;
@property (strong,nonatomic) NSString *u_tel;
@property (strong,nonatomic) NSString *u_type;
@property (strong,nonatomic) NSString *u_spid;
@end

@interface struct_city : NSObject
@property (strong,nonatomic) NSString *codeID;
@property (strong,nonatomic) NSString *name;
@property (strong,nonatomic) NSString *parentID;
@end

@interface struct_eatSearch : NSObject
@property(nonatomic) NSInteger subCategory;
@property(nonatomic) NSMutableArray<NSIndexPath *> * eatPeople;
@property(nonatomic) NSString * cityZone;
@property(nonatomic) NSString * orderby;
@property(nonatomic) NSInteger distance;
@property(nonatomic) NSInteger newsp;
@end

@interface struct_houseSearch : NSObject
@property(nonatomic) NSInteger housePeople;
@property(nonatomic) NSString * cityZone;
@property(nonatomic) NSString * orderby;
@property(nonatomic) NSInteger distance;
@property(nonatomic)NSDate *intime;
@property(nonatomic)NSDate *outtime;
@end
