//
//  SSTodayPlanDetail.h
//  ZhongTongErKe
//
//  Created by Claf on 17/5/2.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Course.h"

@interface SSTodayPlanDetail : UIView

@property(nonatomic,strong)  UIImageView *imageView;
@property(nonatomic,strong)  UILabel *label;

@property (nonatomic ,strong) Course *course;

@end
