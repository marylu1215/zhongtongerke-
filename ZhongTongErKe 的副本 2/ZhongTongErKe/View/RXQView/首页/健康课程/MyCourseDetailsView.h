//
//  MyCourseDetailsView.h
//  ZhongTongErKe
//
//  Created by khj on 2017/6/20.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Course.h"
@interface MyCourseDetailsView : UIView

@property (nonatomic ,strong) Course *course;

@property (nonatomic ,copy) void (^telBlock)();

@property (nonatomic ,copy) void (^lookBlock)();

@end
