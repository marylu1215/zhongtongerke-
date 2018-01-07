//
//  WorkTableViewCell.m
//  MagicFinger
//
//  Created by khj on 16/5/20.
//  Copyright © 2016年 zeenc. All rights reserved.
//

#define WorkCellIdentifier  @"WorkCellIdentifier"

#import "WorkTableViewCell.h"
#import "Administrative.h"

@interface WorkTableViewCell ()
@property (nonatomic,strong)UIView *lineV1;
@property (nonatomic,strong)UIView *lineV2;
@property (nonatomic,strong)UIView *lineV3;
@property (nonatomic,strong)UIView *bottomLine;

@end

@implementation WorkTableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    
   WorkTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:WorkCellIdentifier];
    if (cell == nil) {
        cell = [[WorkTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:WorkCellIdentifier];
    }
    
    return cell;
}


-(void)setAdminArray:(NSArray *)adminArray
{
    _adminArray = adminArray;
    
    //列
    int totalloc = 3;
    CGFloat btnWidth = kScreenWidth/totalloc;
    CGFloat btnHeight = px(188)*kScreenHeightScale;
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

-(void)setAssessmentArray:(NSArray *)assessmentArray
{
    _assessmentArray = assessmentArray;
    
    //列
    int totalloc = 3;
    CGFloat btnWidth = kScreenWidth/totalloc;
    CGFloat btnHeight = px(190);
    CGFloat btnX = 0;
    CGFloat btnY = 0;
    
    for (int index = 0; index < assessmentArray.count; index++) {
        
        // 行号
        int row = index / totalloc;
        // 列号
        int col = index % totalloc;
        
        btnX =  btnWidth* col;
        btnY =  btnHeight * row;
        
        TitleButton *titleButton = [[TitleButton alloc]initWithFrame:CGRectMake(btnX,  btnY, btnWidth, btnHeight)];
        titleButton.assessment =  assessmentArray[index];
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
@end
