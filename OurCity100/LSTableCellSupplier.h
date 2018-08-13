//
//  LSTableCellSupplier.h
//  MyCity100
//
//  Created by liangshun on 18/7/3.
//  Copyright © 2018年 liangshun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LSTableCellSupplier : UITableViewCell
@property(nonatomic)UIImageView* view_pic;
@property(nonatomic)UIView *view_content;
@property(nonatomic)UILabel* label_name;
@property(nonatomic)UILabel* label_socre;
@property(nonatomic)UILabel* label_simpledesc;
@property(nonatomic)UILabel* label_address;
@property(nonatomic)UILabel* label_distance;
@property(nonatomic)UIImageView *image_map;
+(NSInteger)GetCellHeight;
@end
