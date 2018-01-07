//
//  MyCourseDetailsTableCell.h
//  ZhongTongErKe
//
//  Created by khj on 2017/6/20.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "XFBaseLineTableCell.h"
#import "Course.h"

@interface MyCourseDetailsTableCell : XFBaseLineTableCell

@property (nonatomic ,strong) Course *course;
@property (nonatomic ,strong) UIView *vView;

+ (instancetype)cellWithTableView:(UITableView *)tableView;


@end
