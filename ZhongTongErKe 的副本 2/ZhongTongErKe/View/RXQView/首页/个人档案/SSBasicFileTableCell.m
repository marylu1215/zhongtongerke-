//
//  SSBasicFileTableCell.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/5.
//  Copyright © 2017年 Claf. All rights reserved.
//
#define SSBasicFileTableCellIdentifier @"SSBasicFileTableCellIdentifier"
#import "SSBasicFileTableCell.h"


@interface SSBasicFileTableCell ()

@property (nonatomic,strong) UIView *bottomLineView;

@property (nonatomic,strong) UILabel *headLabel;

@property (nonatomic, weak) SSBasicFileButton *selectButton;
@end

@implementation SSBasicFileTableCell


+(instancetype)cellWithTableView:(UITableView *)tableView{
    
     SSBasicFileTableCell *cell = [tableView dequeueReusableCellWithIdentifier:SSBasicFileTableCellIdentifier];
    if (!cell) {
        cell = [[ SSBasicFileTableCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:SSBasicFileTableCellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}


- (void)configUI
{
    [super configUI];
    self.headLabel = [UILabel addLabelWithText:@"" AndFont:Font13 AndAlpha:1.0 AndColor:TITLE_COLOR];
    [self.contentView addSubview: self.headLabel];
  
    self.btnView = [[UIView alloc]init];
    [self.contentView addSubview:self.btnView];
    
    
    self.bottomLineView = [[UIView alloc]init];
    self.bottomLineView.backgroundColor = [UIColor colorWithHexString:@"aaaaaa"];
    [self.contentView addSubview: self.bottomLineView];
  

}

-(void)setProblem:(Problem *)problem
{
    _problem = problem;
    
    NSLog(@"%@",problem.answerArray);
    
    self.headLabel.text = problem.title;
    self.headLabel.frame = CGRectMake(px(30), px(20), kScreenWidth-px(30), Font13);
    
    [self.btnView removeChildViews];
    
    //列
        int totalloc = 2;
        CGFloat btnWidth = px(200)*kScreenWidthScale;
        CGFloat btnHeight = px(48)*kScreenHeightScale;
        CGFloat btnX = 0;
        CGFloat btnY = 0;
        
        CGFloat margin= px(100)*kScreenWidthScale;
        
        for (int index=0; index<problem.answerArray.count; index++)  {
            
            // 行号
            int row = index / totalloc;
            // 列号
            int col = index % totalloc;
            
            btnX = (px(124) + (margin + btnWidth) * col);
            btnY = (px(20) + btnHeight) * row;
            
            SSBasicFileButton *verButton = [[SSBasicFileButton alloc] init];
            verButton.tag = index;
            verButton.frame = CGRectMake(btnX, btnY, btnWidth, btnHeight);
            [verButton setTitle: problem.answerArray[index] forState:UIControlStateNormal];
            [verButton addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
            [self.btnView addSubview:verButton];
        }
    
    self.btnView.frame = CGRectMake(0, CGRectGetMaxY(self.headLabel.frame)+px(20), kScreenWidth, CGRectGetMaxY(self.btnView.subviews.lastObject.frame)+px(20));

    self.bottomLineView.frame = CGRectMake(0, CGRectGetMaxY(self.btnView.frame), kScreenWidth, px(2));
   
    CGFloat superMsgViewH = 0;

   superMsgViewH = CGRectGetMaxY(self.bottomLineView.frame);
    CGRect bounds = self.bounds;
    bounds.size.height = superMsgViewH;
    self.bounds=bounds;
}

-(void)btnClick:(SSBasicFileButton *)btn
{
    // 修改按钮选中状态
    self.selectButton.enabled = YES;
    btn.enabled = NO;
    self.selectButton = btn;
    
    if ([self.delegate respondsToSelector:@selector(cell: actionWithButton: view:)]) {
        [self.delegate cell:self actionWithButton:self.selectButton view:self.btnView];
    }

}







@end
