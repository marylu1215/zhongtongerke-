//
//  HealthCoureTableCell.m
//  ZhongTongErKe
//
//  Created by khj on 2017/6/18.
//  Copyright © 2017年 Claf. All rights reserved.
//

#define HealthCoureIdentifier @"HealthCoureTableCellIdentifier"

#import "HealthCoureTableCell.h"


@implementation HealthCoureTableCell

+(instancetype)cellWithTableView:(UITableView *)tableView{
    
    HealthCoureTableCell *cell = [tableView dequeueReusableCellWithIdentifier:HealthCoureIdentifier];
    if (!cell) {
        cell = [[HealthCoureTableCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:HealthCoureIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
       
        
    }
    return self;
}



-(void)setCoureArray:(NSArray *)coureArray
{
    _coureArray = coureArray;
    
    //列
    int totalloc = 3;
    CGFloat btnWidth = kScreenWidth/totalloc;
    CGFloat btnHeight = btnWidth;
    CGFloat btnX = 0;
    CGFloat btnY = 0;
    for (int index=0; index<coureArray.count; index++)  {
        
        // 行号
        int row = index / totalloc;
        // 列号
        int col = index % totalloc;
        
        btnX = btnWidth*col;
        btnY = btnHeight*row;
        
       HealthTitleBtn *verButton = [[HealthTitleBtn alloc] init];
        verButton.tag = index;
        verButton.frame = CGRectMake(btnX, btnY, btnWidth, btnHeight);
        verButton.course = coureArray[index];
        [verButton addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:verButton];
    }
    
    CGFloat superMsgViewH = 0;
    
    superMsgViewH = CGRectGetMaxY(self.contentView.subviews.lastObject.frame)+px(22);
    CGRect bounds = self.bounds;
    bounds.size.height = superMsgViewH;
    self.bounds=bounds;
}

-(void)btnClick:(HealthTitleBtn* )btn
{
    if (self.selectCourseBlock) {
        
        self.selectCourseBlock(btn);
        
    }
}


@end
