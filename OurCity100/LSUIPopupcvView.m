//
//  LSUIPopupcvView.m
//  MyCityFun
//
//  Created by liangshun on 18/8/7.
//  Copyright © 2018年 liangshun. All rights reserved.
//

#import "LSUIPopupcvView.h"

@interface LSUIPopupcvView()

@end

@implementation LSUIPopupcvView

-(id)initWithP_MS:(BOOL)muls
{
    if(self=[super init])
    {
        _mulSelect=muls;
        self.view_main=[LSUIPopupView new];
        [self addSubview:_view_main];
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize=CGSizeMake(120, 30);
        layout.minimumLineSpacing=20;
        layout.minimumInteritemSpacing=20;
        
        //layout.sectionInset=[UIEdgeInsetsMake(0, 0, 0, 0);];
        
//        @property (nonatomic) CGFloat minimumLineSpacing;
//        @property (nonatomic) CGFloat minimumInteritemSpacing;
//        @property (nonatomic) CGSize itemSize;
//        @property (nonatomic) CGSize estimatedItemSize NS_AVAILABLE_IOS(8_0); // defaults to CGSizeZero - setting a non-zero size enables cells that self-size viapreferredLayoutAttributesFittingAttributes:
//        @property (nonatomic) UICollectionViewScrollDirection scrollDirection; // default is UICollectionViewScrollDirectionVertical
//        @property (nonatomic) CGSize headerReferenceSize;
//        @property (nonatomic) CGSize footerReferenceSize;
//        @property (nonatomic) UIEdgeInsets sectionInset;
        
        
        [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
        self.cv_collection=[[UICollectionView alloc]initWithFrame:CGRectMake(1, 1, 1  , 1) collectionViewLayout:layout];
        self.cv_collection.allowsMultipleSelection=_mulSelect;
        
        [self.view_main.view_contect addSubview:_cv_collection];
    }
    return self;
}

+(BOOL)requiresConstraintBasedLayout
{
    return true;
}

-(void)updateConstraints
{
    [_view_main mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.and.top.and.bottom.offset(0);
    }];
    
    [_cv_collection mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(10);
        make.left.offset(10);
        make.right.offset(-10);
        make.bottom.offset(-70);
    }];
    [super updateConstraints];
}

@end
