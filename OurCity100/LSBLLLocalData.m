//
//  LSBLLLocalData.m
//  OurCity100
//
//  Created by linson on 2018/8/10.
//  Copyright © 2018年 linson. All rights reserved.
//

#import "LSBLLLocalData.h"

@interface LSBLLLocalData()
@property(nonatomic)NSString *mefilename;
@property(nonatomic)NSString *settingname;
@property(nonatomic)NSString *citys;
@end

@implementation LSBLLLocalData
-(id)init
{
    _mefilename=@"MeInfo";
    _settingname=@"mysetting";
    _citys=@"citys";
    return self;
}

-(struct_me*)GetMe
{
    struct_me *ret=nil;
    
    NSString *jsonstr=[LSFun_IO GetStrFromFile:_mefilename];
    if(jsonstr!=nil)
    {
        ret=[[struct_me class]yy_modelWithJSON:jsonstr];
    }
    
    return ret;
}

-(void)UpdateMe:(struct_me *)me
{
    if(me!=nil)
    {
        NSString *jsonstr=[me yy_modelToJSONString];
        if(jsonstr!=nil)
        {
            [LSFun_IO UpdateFile:_mefilename content:jsonstr];
        }
    }
    else
    {
        [LSFun_IO UpdateFile:_mefilename content:@""];
    }
}


-(struct_mysetting*)GetMySetting
{
    struct_mysetting *ret=NULL;
    
    
    NSString *jsonstr=[LSFun_IO GetStrFromFile:self.settingname];
    if(jsonstr!=nil)
    {
        ret=[[struct_mysetting class]yy_modelWithJSON:jsonstr];
    }
    
    return ret;
}

-(void)UpdateMySetting:(struct_mysetting*)setting
{
    if(setting!=nil)
    {
        NSString *jsonstr=[setting yy_modelToJSONString];
        if(jsonstr!=nil)
        {
            [LSFun_IO UpdateFile:_settingname content:jsonstr];
        }
    }
    else
    {
        [LSFun_IO UpdateFile:_settingname content:@""];
    }
}

+(NSMutableArray<struct_city*>*) GetAllCitys:(NSString*)filename
{
    NSMutableArray<struct_city*>* ret=nil;
    NSString* strfile= [LSFun_IO readLocalFileWithName:filename];
    if(strfile!=nil)
    {
        NSDictionary * tempdict =[LSFun_Http ConverStr2Dict:strfile];
        ret=[LSFun_Http ConverDict2Model:tempdict cc:[struct_city class] isArray:YES];
    }
    
    return ret;
}

+(NSMutableArray<struct_city*>*) GetProvinces:(NSMutableArray<struct_city*>*)allcitys
{
    NSMutableArray<struct_city*>* ret=nil;
    if(allcitys!=nil)
    {
        NSPredicate * pre=[NSPredicate predicateWithFormat:@"_parentID like '0*'"];
        ret=(NSMutableArray*)[allcitys filteredArrayUsingPredicate:pre];
    }
    return ret;
}

+(NSMutableArray<struct_city*>*) GetcitysFromProvince:(struct_city *)provincecode allcitys:(NSMutableArray<struct_city*>*)allcitys
{
    NSMutableArray<struct_city*>* ret=nil;
    NSString * prestr=[NSString stringWithFormat:@"_parentID ='%@'",provincecode.codeID];
    if(provincecode!=nil)
    {
        NSPredicate * pre=[NSPredicate predicateWithFormat:prestr];
        ret=(NSMutableArray*)[allcitys filteredArrayUsingPredicate:pre];
    }
    return ret;
}

+(void)GetIndexFromCode:(NSString *)code province:(NSInteger *)province city:(NSInteger*)city allcitys:(NSMutableArray<NSMutableArray<struct_city*>*> *)allcitys
{
    int pc=(int)allcitys.count;
    for (int i=0; i<pc; i++) {
        int cc=(int)allcitys[i].count;
        
        for(int j=0;j<cc;j++)
        {
            if(allcitys[i][j].codeID==code)
            {
                *city=j;
                *province=i;
            }
        }
    }
}

+(NSString*)GetCityNameById:(NSString*)codeid allcitys:(NSMutableArray<NSMutableArray<struct_city*>*> *)allcitys
{
    NSString *ret=@"";
    int pc=(int)allcitys.count;
    for (int i=0; i<pc; i++) {
        int cc=(int)allcitys[i].count;
        
        for(int j=0;j<cc;j++)
        {
            if(allcitys[i][j].codeID==codeid)
            {
                ret=allcitys[i][j].name;
            }
        }
    }
    return ret;
}

@end
