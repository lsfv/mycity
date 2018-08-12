//
//  LSPopupcvVC.m
//  MyCityFun
//
//  Created by liangshun on 18/8/7.
//  Copyright © 2018年 liangshun. All rights reserved.
//

#import "LSFUNPopupcvVC.h"
#import "LSPopcvCell.h"

@interface LSFUNPopupcvVC ()

@end

@implementation LSFUNPopupcvVC

-(id)initWithP:(NSMutableArray<NSString*>*)data preselect:(NSMutableArray<NSIndexPath*>*)preselect  handle:(UIViewController<IcvClick> *)handle;
{
    if(self=[super init])
    {
        self.data=data;
        self.preselect=preselect;
        self.myhandle=handle;
    }
    return self;
}

-(void)loadView
{
    self.view=self.myview=[LSUIPopupcvView new];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self SetupCV];
}


-(void)SetupCV
{
    _myview.cv_collection.dataSource=self;
    _myview.cv_collection.delegate=self;
    _myview.cv_collection.backgroundColor=[UIColor whiteColor];
    [self.myview.cv_collection registerClass:[LSPopcvCell class] forCellWithReuseIdentifier:@"cellId"];
    [_myview.view_main.btn_cancel addTarget:self action:@selector(OnClickCancel:) forControlEvents:UIControlEventTouchUpInside];
    [_myview.view_main.btn_ok addTarget:self action:@selector(OnClickOk:) forControlEvents:UIControlEventTouchUpInside];
    
    for(int i=0;i<self.preselect.count;i++)
    {
        [_myview.cv_collection selectItemAtIndexPath:_preselect[i] animated:NO scrollPosition:UICollectionViewScrollPositionNone];
    }
}


-(void)OnClickCancel:(UIButton*)sender
{
    [_myhandle dismissViewControllerAnimated:NO completion:nil];
}


-(void)OnClickOk:(UIButton*)sender
{
    [_myhandle dismissViewControllerAnimated:NO completion:^{
        [_myhandle OnCVClickOK:(NSMutableArray<NSIndexPath*>*)[_myview.cv_collection indexPathsForSelectedItems] sender:self];
    }];
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.data.count;
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LSPopcvCell *cell = (LSPopcvCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"cellId" forIndexPath:indexPath];
    
    cell.botlabel.text=self.data[indexPath.row];
    cell.botlabel.tag=indexPath.row;
    
    if(cell.selected)
    {
        cell.botlabel.backgroundColor=[UIColor blueColor];
        cell.botlabel.textColor=[UIColor whiteColor];
    }
    else
    {
        cell.botlabel.backgroundColor=[UIColor whiteColor];
        cell.botlabel.textColor=[UIColor blackColor];
    }
    
    return (UICollectionViewCell*)cell;
}

//auto fire event:choose
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"did%i,%i",(int)indexPath.row,(int)collectionView.visibleCells.count);
    ( (LSPopcvCell *)[collectionView cellForItemAtIndexPath:indexPath]).botlabel.backgroundColor=[UIColor blueColor];
    ( (LSPopcvCell *)[collectionView cellForItemAtIndexPath:indexPath]).botlabel.textColor=[UIColor whiteColor];
}

//auto fire event:preselect and then choose other.
- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    NSLog(@"undid%i,%i",(int)indexPath.row,(int)collectionView.visibleCells.count);
    ( (LSPopcvCell *)[collectionView cellForItemAtIndexPath:indexPath]).botlabel.backgroundColor=[UIColor whiteColor];
    ( (LSPopcvCell *)[collectionView cellForItemAtIndexPath:indexPath]).botlabel.textColor=[UIColor blackColor];
}



@end
