//
//  HotReTableCell.m
//  ZhongTongErKe
//
//  Created by khj on 2017/6/2.
//  Copyright © 2017年 Claf. All rights reserved.
//

#define HotReTableCellIdentifier @"HotReTableCellIdentifier"

#import "HotReTableCell.h"

@implementation HotReTableCell

+(instancetype)cellWithTableView:(UITableView *)tableView{
    
    static NSString *ID =  HotReTableCellIdentifier;
    HotReTableCell  *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[HotReTableCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:ID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
     
    }
    return self;
}

- (void)setHotReNSArray:(NSArray *)hotReNSArray
{
    //列
    int totalloc = 5;
    CGFloat btnWidth = (kScreenWidth-2*px(30)-4*px(10))/5;
    CGFloat btnHeight = px(50);
    CGFloat btnX = 0;
    CGFloat btnY = 0;
    
    CGFloat margin = px(10);
    
    for (int index = 0; index < hotReNSArray.count;index++) {
        // 行号
        int row = index / totalloc;
        // 列号
        int col = index % totalloc;
        
        btnX = px(30)+ (margin + btnWidth) * col;
        btnY = (20 + btnHeight) * row;
        
        UIButton *verButton = [UIButton addBtnWithTitle:hotReNSArray[index] WithBGImg:nil WithFont:12 WithTitleColor:TITLE_COLOR Target:self Action:@selector(btnClick:)];
        
        [self.contentView addSubview:verButton];
        
        verButton.tag = index;
    
        verButton.frame = CGRectMake(btnX, btnY, btnWidth, btnHeight);
       
   }
    
      CGFloat superMsgViewH = 0;
    superMsgViewH = CGRectGetMaxY(self.contentView.subviews.lastObject.frame);
    CGRect bounds = self.bounds;
    bounds.size.height = superMsgViewH;
    self.bounds=bounds;
}

- (void)btnClick:(UIButton *)button
{
    
    if (self.btnClickBlock) {
        
        self.btnClickBlock(button);
    }
}


@end
