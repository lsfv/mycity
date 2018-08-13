#import <Foundation/Foundation.h>
@interface LSModel_VOrder : NSObject
@property (nonatomic)NSInteger order_id;
@property (nonatomic)NSInteger order_uid;
@property (nonatomic)NSInteger gs_id;
@property (nonatomic)NSInteger order_qt;
@property (nonatomic) float order_sumPrice;
@property (nonatomic)NSInteger order_statue;
@property (strong,nonatomic) NSDate * order_in;
@property (strong,nonatomic) NSDate * order_out;
@property (strong,nonatomic) NSString *order_extend;
@property (strong,nonatomic) NSString *order_ps;
@property (strong,nonatomic) NSString *order_wxno;
@property (strong,nonatomic) NSDate * order_starttime;
@property (strong,nonatomic) NSDate * order_endtime;
@property (strong,nonatomic) NSString *order_otherinfo;
@property (strong,nonatomic) NSString *order_tempno;
@property (strong,nonatomic) NSString *order_refPeople;
@property (strong,nonatomic) NSString *order_tel;
@property (strong,nonatomic) NSString *gs_name;
@property (nonatomic)NSInteger gs_spid;
@property (strong,nonatomic) NSString *sp_name;
@property (nonatomic)NSInteger sp_cgid;
@property (strong,nonatomic) NSString *cg_name;
@end