//
//  APPFrameWork.m
//  OurCity100
//
//  Created by linson on 2018/8/10.
//  Copyright © 2018年 linson. All rights reserved.
//


#import "APPFrameWork.h"
#import "LSModel_LocalStruct.h"
#import "LSBLLLocalData.h"
//pages
#import "LSTestGblUiVC.h"
#import "LSTESTMYUIVC.h"
#import "LSTESTDataVC.h"

#import "LSMainIndexVC.h"

//全局变量
int paddingtop=0;
int paddingleft=0;
int paddingright=0;
int paddingbottom=0;
NSMutableArray<struct_city*>* gbl_provinces;
NSMutableArray<NSMutableArray<struct_city*>*> *gbl_citys;
NSString *gbl_domain=@"http://120.79.79.80:8044";
NSString *gbl_urlindexcategory=@"http://120.79.79.80:8044/MainPage.asmx/Category_MainCategory";
NSString *gbl_urlindexSupplier=@"http://120.79.79.80:8044/MainPage.asmx/Supplier_indexRecommend";
NSString *gbl_urlsub_category=@"http://120.79.79.80:8044/MainPage.asmx/Category_GetSubCategoryByFatherID";
NSString *gbl_urleat_supplier=@"http://120.79.79.80:8044/MainPage.asmx/Supplier_Eat";
NSString *gbl_urlGoods_eatsp=@"http://120.79.79.80:8044/MainPage.asmx/Goods_Eat";
NSString *gbl_urlhouse_supplier=@"http://120.79.79.80:8044/MainPage.asmx/Supplier_House";
NSString *gbl_urlhouse_supplierdate=@"http://120.79.79.80:8044/MainPage.asmx/Supplier_HouseByInOutDate";
NSString *gbl_urlGoods_housesp=@"http://120.79.79.80:8044/MainPage.asmx/Goods_HouseByInOutDate";
NSString *gbl_urlUser_order=@"http://120.79.79.80:8044/MainPage.asmx/User_GetOrders";
NSString *gbl_urluser_regedit=@"http://120.79.79.80:8044/MainPage.asmx/User_RegeditUser";
NSString *gbl_urluser_login=@"http://120.79.79.80:8044/MainPage.asmx/User_GetUserByID";
NSString *gbl_urlcitys=@"http://120.79.79.80:8044/MainPage.asmx/Citys_AllCitys";




@interface APPFrameWork()
@property(nonatomic)BOOL isTest;
@end

@implementation APPFrameWork
//布局程序框架，初始化程序环境，保存环境参数，等初始化工作。
-(void)SetupApp:(UIWindow *)appWindow
{
    //布局程序框架:tabbar+navinationcontrol
    self.isTest=true;
    UITabBarController *mytabController=[UITabBarController new];//tabcontrol
    NSMutableArray<UINavigationController*> *mynavigation=[self InitNavigationControls];
    mytabController.viewControllers=mynavigation;
    appWindow.rootViewController=mytabController;
    [appWindow makeKeyAndVisible];
    
    [self InitParemeters:appWindow];//修改全局变量,保存环境参数
}


-(void)InitParemeters:(UIWindow *)appWindow
{
    //me
    LSBLLLocalData *bll_localdata=[LSBLLLocalData new];
    if([bll_localdata GetMe]==nil)
    {
        struct_me *meinfo=[struct_me new];
        meinfo.u_id=1;
        meinfo.u_loginname=@"linson";
        [bll_localdata UpdateMe:meinfo];
    }
    
    //mysetting
    if([bll_localdata GetMySetting]==nil)
    {
        struct_mysetting *defaultSetting=[struct_mysetting new];
        defaultSetting.mycity=@"360300";
        defaultSetting.mysquares=@"360301,360302";
        [bll_localdata UpdateMySetting:defaultSetting];
    }
    
    //gbl variable
    CGRect statusRect = [[UIApplication sharedApplication] statusBarFrame];
    paddingtop=statusRect.size.height;
    paddingbottom=appWindow.rootViewController.tabBarController.tabBar.frame.size.height;
    paddingleft=10;
    paddingright=10;
    
    //citys and provinces
    NSString* cityfilename=@"mycitys.json";
    NSMutableArray<struct_city*>* allcity=[LSBLLLocalData GetAllCitys:cityfilename];
    gbl_provinces=[LSBLLLocalData GetProvinces:allcity];
    
    gbl_citys=[NSMutableArray<NSMutableArray<struct_city*>*>  new];
    for(int i=0;i<gbl_provinces.count;i++)
    {
        NSMutableArray<struct_city*>* tempcitys=[LSBLLLocalData GetcitysFromProvince:gbl_provinces[i] allcitys:allcity];
        if(tempcitys!=nil)
        {
            [gbl_citys addObject:tempcitys];
        }
    }
    
}



-(NSMutableArray<UINavigationController*>*) InitNavigationControls
{
    NSMutableArray<UINavigationController*>* ret=[NSMutableArray<UINavigationController*> new];
    NSMutableArray<NavigationControllerInfo*>* items=nil;
    if(self.isTest)
    {
        items=[self GetNavigationControllerInfoTest];
    }
    else
    {
        items=[self GetNavigationControllerInfo];
    }
    for(int i=0;i<items.count;i++)
    {
        UINavigationController *tempNVControl=[[UINavigationController alloc] initWithRootViewController:items[i].itemVC];
        [tempNVControl setNavigationBarHidden:YES];
        tempNVControl.tabBarItem.image=items[i].itemPic;
        tempNVControl.tabBarItem.title=items[i].itemName;
        tempNVControl.tabBarItem.tag=i;
        [ret addObject:tempNVControl];
    }
    return ret;
}



-(NSMutableArray<NavigationControllerInfo*>*) GetNavigationControllerInfo
{
    NSMutableArray<NavigationControllerInfo*>* items=[NSMutableArray<NavigationControllerInfo*> new];
    
    NavigationControllerInfo *mainpage=[NavigationControllerInfo new];
    mainpage.itemPic=[[UIImage imageNamed:@"home"]imageWithRenderingMode:UIImageRenderingModeAutomatic];
    mainpage.itemName=@"首页";
    mainpage.itemVC=[LSMainIndexVC new];//[LSIndexPage new];
    [items addObject:mainpage];
    
    NavigationControllerInfo *message=[NavigationControllerInfo new];
    message.itemPic=[[UIImage imageNamed:@"message"]imageWithRenderingMode:UIImageRenderingModeAutomatic];
    message.itemName=@"消息";
    message.itemVC=[UIViewController new];//[LSIndexPage new];
    [items addObject:message];
    
    NavigationControllerInfo *my=[NavigationControllerInfo new];
    my.itemPic=[[UIImage imageNamed:@"order"]imageWithRenderingMode:UIImageRenderingModeAutomatic];
    my.itemName=@"订单";
    my.itemVC=[UIViewController new];//[LSIndexPage new];
    [items addObject:my];
    
    NavigationControllerInfo *setting=[NavigationControllerInfo new];
    setting.itemPic=[[UIImage imageNamed:@"my"]imageWithRenderingMode:UIImageRenderingModeAutomatic];
    setting.itemName=@"我的";
    setting.itemVC=[UIViewController new];//[LSIndexPage new];
    [items addObject:setting];
    
    return items;
}

//GBL(me+setting).basevc.+myui.  + system+ui. + page(main page,master+detail)
-(NSMutableArray<NavigationControllerInfo*>*) GetNavigationControllerInfoTest
{
    NSMutableArray<NavigationControllerInfo*>* items=[NSMutableArray<NavigationControllerInfo*> new];
    NavigationControllerInfo *mainpage=[NavigationControllerInfo new];
    mainpage.itemPic=[[UIImage imageNamed:@"home"]imageWithRenderingMode:UIImageRenderingModeAutomatic];
    mainpage.itemName=@"ui";
    mainpage.itemVC=[LSTestGblUiVC new];//[LSIndexPage new];
    [items addObject:mainpage];
    
    NavigationControllerInfo *message=[NavigationControllerInfo new];
    message.itemPic=[[UIImage imageNamed:@"message"]imageWithRenderingMode:UIImageRenderingModeAutomatic];
    message.itemName=@"myui";
    message.itemVC=[LSTESTMYUIVC new];//[LSIndexPage new];
    [items addObject:message];
    
    NavigationControllerInfo *my=[NavigationControllerInfo new];
    my.itemPic=[[UIImage imageNamed:@"order"]imageWithRenderingMode:UIImageRenderingModeAutomatic];
    my.itemName=@"data";
    my.itemVC=[LSTESTDataVC new];//[LSIndexPage new];
    [items addObject:my];
    
    NavigationControllerInfo *setting=[NavigationControllerInfo new];
    setting.itemPic=[[UIImage imageNamed:@"my"]imageWithRenderingMode:UIImageRenderingModeAutomatic];
    setting.itemName=@"我的";
    setting.itemVC=[UIViewController new];//[LSIndexPage new];
    [items addObject:setting];
    
    return items;
}

@end
