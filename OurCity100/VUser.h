#import <Foundation/Foundation.h>
@interface LSModel_VUser : NSObject
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