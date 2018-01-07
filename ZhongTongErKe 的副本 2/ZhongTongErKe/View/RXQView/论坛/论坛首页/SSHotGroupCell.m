//
//  SSHotGroupCell.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/25.
//  Copyright © 2017年 Claf. All rights reserved.
//
#define SSHotGroupCellIdentifier @"SSHotGroupCelldentifier"
#import "SSHotGroupCell.h"
#import "GroupButton.h"
#import "HotGroup.h"

@implementation SSHotGroupCell
+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    SSHotGroupCell *cell = [tableView dequeueReusableCellWithIdentifier:SSHotGroupCellIdentifier];
    if (cell == nil) {
        cell = [[SSHotGroupCell  alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:SSHotGroupCellIdentifier];
        
    }
    
    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
    }
    return self;
}

-(void)setHotGroupArray:(NSArray *)hotGroupArray
{
    _hotGroupArray= hotGroupArray;
    
    //列
    int totalloc = 4;
    CGFloat btnWidth = px(130);
    CGFloat btnHeight = px(160);
    CGFloat btnX = 0;
    CGFloat btnY = 0;
    
    CGFloat margin = (kScreenWidth - totalloc * btnWidth-2*px(20))/(totalloc - 1);
    
    for (int i = 0; i < hotGroupArray.count; i++) {
      
        HotGroup  * hotGroup = hotGroupArray[i];
        // 行号
        int row = i / totalloc;
        // 列号
        int col = i % totalloc;
        
        btnX = px(30) + (margin + btnWidth) * col;
        btnY = (px(20) + btnHeight) * row;
        
        GroupButton *verButton = [[GroupButton alloc] initWithFrame: CGRectMake(btnX, btnY, btnWidth, btnHeight)];
        verButton.tag = i;
        verButton.groupLabel.text = hotGroup.group_name;
        [verButton.groupImageView sd_setImageWithURL:[NSURL URLWithString:hotGroup.img] placeholderImage:[UIImage imageNamed:@"pic-2"]];
        [verButton addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:verButton];
    }
    
    CGFloat superMsgViewH = 0;
    superMsgViewH = CGRectGetMaxY(self.contentView.subviews.lastObject.frame)+px(30);
    CGRect bounds = self.bounds;
    bounds.size.height = superMsgViewH;
    self.bounds=bounds;
    
}


- (void)btnClick:(KJVerticalButton  *)button
{
    
    if (self.selectGroupBlock) {
        
        self.selectGroupBlock(button);
        
    }
}


@end
