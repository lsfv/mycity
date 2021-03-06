//
//  LSGBLVariable.h
//  OurCity100
//
//  Created by linson on 2018/8/10.
//  Copyright © 2018年 linson. All rights reserved.
//

#ifndef LSGBLVariable_h
#define LSGBLVariable_h

#import "LSModel_LocalStruct.h"

//variable
extern int paddingtop;
extern int paddingleft;
extern int paddingright;
extern int paddingbottom;
extern NSMutableArray<struct_city*>* gbl_provinces;
extern NSMutableArray<NSMutableArray<struct_city*>*> *gbl_citys;

extern NSString *gbl_domain;
extern NSString *gbl_urlindexcategory;
extern NSString *gbl_urlindexSupplier;
extern NSString *gbl_urlsub_category;
extern NSString *gbl_urleat_supplier;
extern NSString *gbl_urlGoods_eatsp;
extern NSString *gbl_urlhouse_supplier;
extern NSString *gbl_urlhouse_supplierdate;
extern NSString *gbl_urlGoods_housesp;
extern NSString *gbl_urlUser_order;
extern NSString *gbl_urluser_regedit;
extern NSString *gbl_urluser_login;
extern NSString *gbl_urlcitys;
extern NSString *gbl_dateformat;


//enum
enum ET_filterType
{
    enum_category=1,
    enum_spfilter,
    enum_square,
    enum_distance,
    enum_orderby
};



enum ET_houseType
{
    enum_ht_nil=0,
    enum_1b1p=1,
    enum_1b2p,
    enum_2b2p,
    enum_2b4p
};




#endif /* LSGBLVariable_h */
