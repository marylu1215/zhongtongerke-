//
//  SSProConsultCell.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/12.
//  Copyright © 2017年 Claf. All rights reserved.
//

#define ConsultCellIdentifier  @"ConsultCellIdentifier"
#import "SSProConsultCell.h"
#import "Administrative.h"

@interface SSProConsultCell ()

@property (nonatomic,strong)UIView *lineV1;
@property (nonatomic,strong)UIView *lineV2;
@property (nonatomic,strong)UIView *lineV3;
@property (nonatomic,strong)UIView *bottomLine;

@end

@implementation SSProConsultCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
   
   SSProConsultCell *cell = [tableView dequeueReusableCellWithIdentifier:ConsultCellIdentifier];
    if (cell == nil) {
        cell = [[SSProConsultCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ConsultCellIdentifier];
    }
    
    return cell;
}


-(void)setAdminArray:(NSArray *)adminArray
{
    _adminArray = adminArray;
    
    //列
    int totalloc = 4;
    CGFloat btnWidth = kScreenWidth/totalloc;
    CGFloat btnHeight = btnWidth;
    CGFloat btnX = 0;
    CGFloat btnY = 0;

    for (int index = 0; index < adminArray.count; index++) {
        
        // 行号
        int row = index / totalloc;
        // 列号
        int col = index % totalloc;
        
        btnX =  btnWidth* col;
        btnY =  btnHeight * row;
        
        TitleButton *titleButton = [[TitleButton alloc]initWithFrame:CGRectMake(btnX,  btnY, btnWidth, btnHeight)];
        titleButton.administrative =  adminArray[index];
        [titleButton addTarget:self action:@selector(selectACtion:) forControlEvents:UIControlEventTouchUpInside];
        titleButton.tag = index;
        [self.contentView addSubview:titleButton];
    }
    
    CGFloat superMsgViewH = 0;
    superMsgViewH = CGRectGetMaxY(self.contentView.subviews.lastObject.frame);
    CGRect bounds = self.bounds;
    bounds.size.height = superMsgViewH;
    self.bounds=bounds;
    
}

-(void)selectACtion:(TitleButton *)titleButton
{
    if (self.selectBlock) {
        
        self.selectBlock(titleButton);
    }
}
@end
