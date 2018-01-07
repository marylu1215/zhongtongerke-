//
//  SSHotDoctorTableCell.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/10.
//  Copyright © 2017年 Claf. All rights reserved.
//
#define  SSHotDoctorTableCellIdentifier @"SSHotDoctorTableCellIdentifier"
#import "SSHotDoctorTableCell.h"
#import "Doctor.h"
@implementation SSHotDoctorTableCell

+(instancetype)cellWithTableView:(UITableView *)tableView{
    
   SSHotDoctorTableCell *cell = [tableView dequeueReusableCellWithIdentifier:SSHotDoctorTableCellIdentifier];
    if (!cell) {
        cell = [[SSHotDoctorTableCell  alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:SSHotDoctorTableCellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

-(void)setDoctorArray:(NSArray *)doctorArray
{
    _doctorArray = doctorArray;
    
    //列
    int totalloc = 4;
    CGFloat btnWidth = px(130);
    CGFloat btnHeight = px(230);
    CGFloat btnX = 0;
    CGFloat btnY = 0;
    
    CGFloat margin=(kScreenWidth - totalloc * btnWidth-2*px(20))/(totalloc-1);
    
    for (int i = 0; i < doctorArray.count; i++) {
        
     Doctor  *doctor= doctorArray[i];
        // 行号
        int row = i / totalloc;
        // 列号
        int col = i % totalloc;
        
        btnX = px(20) + (margin + btnWidth) * col;
        btnY = px(10) + (px(10) + btnHeight) * row;
        
        SSHotDoctorButton *docButton = [[SSHotDoctorButton alloc] init];
        //docButton.backgroundColor = [UIColor redColor];
        docButton.tag = i;
        docButton.doctor = doctor;
        docButton.frame = CGRectMake(btnX, btnY, btnWidth, btnHeight);
        [docButton addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:docButton];
    }
    CGFloat superMsgViewH = 0;
    superMsgViewH = CGRectGetMaxY(self.contentView.subviews.lastObject.frame)+px(10);
    CGRect bounds = self.bounds;
    bounds.size.height = superMsgViewH;
    self.bounds=bounds;
}

-(void)btnClick:(SSHotDoctorButton *)button
{
    if (self.backDoctorBlock) {
        
        self.backDoctorBlock (button);
    }
}




@end
