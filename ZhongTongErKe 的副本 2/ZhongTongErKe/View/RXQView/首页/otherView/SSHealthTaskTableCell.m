//
//  SSHealthTaskTableCell.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/4.
//  Copyright © 2017年 Claf. All rights reserved.
//

#define TaskCellIdentifier @"TaskCellIdentifier"

#import "SSHealthTaskTableCell.h"

@interface SSHealthTaskTableCell ()

@property(nonatomic,strong) UIView *bgView;
@property(nonatomic,strong) UIView *typeView;
@property(nonatomic,strong) UILabel *typeLabel;
@property(nonatomic,strong) UIImageView *lineView;
@property (nonatomic ,strong) UILabel *titleLabel;
@property (nonatomic,strong) UILabel *contentLabel;
@property (nonatomic,strong) UILabel *integrationLabel;
@property (nonatomic,strong) UIView *inteContentView;

@end

@implementation SSHealthTaskTableCell

+(instancetype)cellWithTableView:(UITableView *)tableView
{
    
    SSHealthTaskTableCell *cell = [tableView dequeueReusableCellWithIdentifier:TaskCellIdentifier];
    if (cell == nil) {
        
        cell = [[SSHealthTaskTableCell   alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:TaskCellIdentifier];
    }
    return cell;
    
}


- (void)configUI
{
    
    self.backgroundColor = [UIColor colorWithHexString:@"f1f0f0"];
    
    self.bgView = [[UIView alloc]init];
    self.bgView.backgroundColor = [UIColor colorWithHexString:@"ffffff"];
    self.bgView.layer.cornerRadius = 4;
    self.bgView.clipsToBounds = YES;
    self.bgView.layer.borderColor = [UIColor colorWithHexString:@"f1f0f0"].CGColor;
    self.bgView.layer.borderWidth = px(2);
    [self.contentView addSubview:self.bgView];
    
    self.typeView = [[UIView alloc]init];
    self.typeView.layer.cornerRadius =px(140)/2;
    self.typeView.clipsToBounds = YES;
    [self.bgView addSubview:self.typeView];
    
    self.typeLabel = [UILabel addLabelWithText:@"" AndFont:Font13 AndAlpha:1.0 AndColor:c255255255];
    [self.typeView addSubview:self.typeLabel];
    
    self.lineView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"lineTwo"]];
    [self.bgView addSubview:self.lineView];
    
    self.inteContentView = [[UIView alloc]init];
    [self.bgView addSubview:self.inteContentView];
    
    
    self.titleLabel = [UILabel addLabelWithText:@"" AndFont:Font15 AndAlpha:1.0 AndColor:TITLE_COLOR];
    [self.inteContentView addSubview:self.titleLabel];
    
    self.contentLabel = [UILabel addLabelWithText:@"" AndFont:Font13 AndAlpha:1.0 AndColor:REMARK_COLOR];
    [self.inteContentView addSubview: self.contentLabel];
    
    self.integrationLabel = [UILabel addLabelWithText:@"" AndFont:Font13 AndAlpha:1.0 AndColor:S_COLOR];
    [ self.inteContentView  addSubview: self.integrationLabel];
    
    
    
}

- (void)configFrame
{
    self.bgView.sd_layout.leftSpaceToView(self.contentView,px(30)).rightSpaceToView(self.contentView,px(30)).topSpaceToView(self.contentView,0).bottomSpaceToView(self.contentView,0);
    
    self.typeView.sd_layout.leftSpaceToView(self.bgView,px(36)).widthIs(px(140)).heightIs(px(140)).centerYEqualToView(self.bgView);
    
    self.lineView.sd_layout.widthIs(self.lineView.image.size.width).heightIs(self.lineView.image.size.height).centerYEqualToView(self.bgView).leftSpaceToView(self.typeView,px(30));
    
    self.inteContentView.sd_layout.leftSpaceToView(self.lineView,0).rightSpaceToView(self.bgView,0).topSpaceToView(self.bgView,0).bottomSpaceToView(self.bgView,0);
}

-(void)setHealthTask:(HealthTask *)healthTask
{
    
    
    if ([healthTask.tag isEqualToString:@"签到"]) {
        
        self.typeView.backgroundColor = cHBColor;
    }
    else
    {
        self.typeView.backgroundColor = [UIColor colorWithHexString:@"fb7a96"];
    }
    self.typeLabel.text = healthTask.tag;
    
    self.typeLabel.sd_layout.widthIs([NSString backSizeWithText:self.typeLabel.text andFont:font(Font13)].width).heightIs(Font13).centerXEqualToView(self.typeView).centerYEqualToView(self.typeView);
    
    self.titleLabel.text = healthTask.title;
     self.titleLabel.sd_layout.widthIs([NSString backSizeWithText:self.titleLabel.text andFont:font(Font15)].width).heightIs(Font15).topSpaceToView(self.inteContentView,px(42)).centerXEqualToView(self.inteContentView);
    
     self.contentLabel.text = healthTask.condition;
      self.contentLabel.sd_layout.widthIs([NSString backSizeWithText:self.contentLabel.text andFont:font(Font13)].width).heightIs(Font13).topSpaceToView(self.titleLabel,px(20)).centerXEqualToView(self.titleLabel);
    
   
    self.integrationLabel.text = [NSString stringWithFormat:@"任务奖励: %@", healthTask.integration];
    self.integrationLabel.sd_layout.widthIs([NSString backSizeWithText:self.integrationLabel.text andFont:font(Font13)].width).heightIs(Font13).topSpaceToView(self.contentLabel,px(20)).centerXEqualToView(self.titleLabel);
}
@end
