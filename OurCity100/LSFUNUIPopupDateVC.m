//
//  LSUIPopupDateVC.m
//  MyCityFun
//
//  Created by liangshun on 18/8/7.
//  Copyright © 2018年 liangshun. All rights reserved.
//

#import "LSFUNUIPopupDateVC.h"

@interface LSFUNUIPopupDateVC ()

@end

@implementation LSFUNUIPopupDateVC

-(id)initWithP:(NSDate*)from to:(NSDate*)to handle:(UIViewController<IdpClick>*)handle
{
    if(self=[super init])
    {
        self.intime=from;
        self.outtime=to;
        self.myhandle=handle;
    }
    return self;
}

-(void)loadView
{
    self.view=self.myview=[LSUIPopupDateVIew new];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self SetupControl];
    // Do any additional setup after loading the view.
}

-(void)SetupControl
{
    if(self.intime!=nil)
    {
        self.myview.viewDatepickerFrom.date=self.intime;
    }
    else
    {
        self.myview.viewDatepickerFrom.date=[NSDate date];
    }
    
    if(self.outtime!=nil)
    {
        self.myview.viewDatepickerTo.date=self.outtime;
    }
    else
    {
        self.myview.viewDatepickerTo.date=[NSDate date];
    }
    [_myview.view_main.btn_cancel addTarget:self action:@selector(OnClickCancel:) forControlEvents:UIControlEventTouchUpInside];
    [_myview.view_main.btn_ok addTarget:self action:@selector(OnClickOk:) forControlEvents:UIControlEventTouchUpInside];
}


-(void)OnClickCancel:(UIButton*)sender
{
    [_myhandle dismissViewControllerAnimated:NO completion:nil];
}

-(void)OnClickOk:(UIButton*)sender
{
    [_myhandle dismissViewControllerAnimated:NO completion:^{
        [_myhandle OnClickOK:_myview.viewDatepickerFrom.date timeto:_myview.viewDatepickerTo.date sender:self];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
