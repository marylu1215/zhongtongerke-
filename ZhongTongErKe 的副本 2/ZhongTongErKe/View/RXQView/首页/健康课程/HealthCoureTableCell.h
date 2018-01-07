//
//  HealthCoureTableCell.h
//  ZhongTongErKe
//
//  Created by khj on 2017/6/18.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "XFBaseLineTableCell.h"
#import "HealthTitleBtn.h"

@interface HealthCoureTableCell : XFBaseLineTableCell

@property (nonatomic ,strong) NSArray *coureArray;

@property (nonatomic ,copy) void (^selectCourseBlock)(HealthTitleBtn *btn);

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
