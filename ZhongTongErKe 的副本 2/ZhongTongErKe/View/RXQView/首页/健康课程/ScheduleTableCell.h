//
//  ScheduleTableCell.h
//  ZhongTongErKe
//
//  Created by khj on 2017/6/20.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "XFBaseLineTableCell.h"
#import "CourseButton.h"

@protocol  ScheduleTableCellDelegate <NSObject>
@optional
- (void)handleSelectedButtonActionWithSelectedIndexPath:(NSIndexPath *)selectedIndexPath button:(CourseButton *)button;

@end

@interface ScheduleTableCell : XFBaseLineTableCell

@property (nonatomic ,strong) NSArray *timeQuArray;


@property (nonatomic, weak) id<ScheduleTableCellDelegate> delegate;
@property (assign, nonatomic) NSIndexPath *selectedIndexPath;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
