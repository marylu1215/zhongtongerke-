//
//  ScheduleTableCell.m
//  ZhongTongErKe
//
//  Created by khj on 2017/6/20.
//  Copyright © 2017年 Claf. All rights reserved.
//
#define ScheduleTableCellIdentifier @" ScheduleTableCellIdentifier"
#import "ScheduleTableCell.h"
#import "CourseTitleView.h"


@implementation ScheduleTableCell

+(instancetype)cellWithTableView:(UITableView *)tableView{
    
    ScheduleTableCell *cell = [tableView dequeueReusableCellWithIdentifier:ScheduleTableCellIdentifier];
    if (!cell) {
        cell = [[ScheduleTableCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:ScheduleTableCellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        
    }
    return self;
}



-(void)setTimeQuArray:(NSArray *)timeQuArray
{
    _timeQuArray = timeQuArray;
    
    CGFloat buttonW = (kScreenWidth-px(150))/7;
    CGFloat buttonH = px(54);
    for (int index=0; index<timeQuArray.count; index++) {
        
        CourseTitleView *titleView = [[CourseTitleView alloc]initWithFrame:CGRectMake(0, index*px(54), px(150), px(54))];
        [self.contentView addSubview:titleView];
        titleView.courseStr = timeQuArray[index];
        
        for (int jndex=0; jndex<7; jndex++) {
           
            CourseButton *button = [[CourseButton alloc]initWithFrame:CGRectMake(px(150)+jndex*buttonW, index*px(54), buttonW, buttonH)];
            [self.contentView addSubview:button];
        
           
            if (jndex%7 !=1) {
                 [button addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
                 [button setBackgroundColor:c255255255 forState:UIControlStateNormal];
                 [button setBackgroundColor:[UIColor colorWithHexString:@"f1b708"] forState:UIControlStateSelected];
            }
            else
            {
              [button setBackgroundColor:[UIColor colorWithHexString:@"e9e9e9"] forState:UIControlStateNormal];
            }
           
            button.tag = (index*10)+(jndex+1);
            
        }
    
    }
}

-(void)clickAction:(CourseButton *)button
{
    button.selected = !button.selected;
  
    if ([self.delegate respondsToSelector:@selector(handleSelectedButtonActionWithSelectedIndexPath: button:)]) {

    [self.delegate handleSelectedButtonActionWithSelectedIndexPath:self.selectedIndexPath button:button];
    }

    
}

@end
