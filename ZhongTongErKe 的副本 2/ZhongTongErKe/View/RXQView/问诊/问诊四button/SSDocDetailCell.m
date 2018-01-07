//
//  SSDocDetailCell.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/17.
//  Copyright © 2017年 Claf. All rights reserved.
//

#define SSDocDetailCellIdentifier @"SSDocDetailCellIdentifier"

#import "SSDocDetailCell.h"
#import "NSDate+KJExtension.h"
@interface SSDocDetailCell ()

@property (nonatomic,strong) UILabel *phoneNumberLabel;
@property (nonatomic,strong) UIImageView *redBagImageview;
@property (nonatomic,strong) UILabel *priceLabel;
@property (nonatomic,strong) UILabel *levelLabel;
@property (nonatomic,strong) UILabel *dateLabel;
@property (nonatomic,strong) UILabel *detailLabel;
@property (nonatomic,strong) UILabel *contentLabel;
@property (nonatomic, strong) UIImageView *bottomImageView;

@end

@implementation SSDocDetailCell


+(instancetype)cellWithTableView:(UITableView *)tableView{
    
    SSDocDetailCell  *cell = [tableView dequeueReusableCellWithIdentifier:SSDocDetailCellIdentifier];
    if (!cell) {
        cell = [[SSDocDetailCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:SSDocDetailCellIdentifier];
        
    }
    return cell;
}
-(void)configUI
{
    [super configUI];
  
    
    self.phoneNumberLabel = [UILabel addLabelWithText:@"" AndFont:Font13 AndAlpha:1.0 AndColor:REMARK_COLOR];
    [self.contentView addSubview:self.phoneNumberLabel];
    
    
    self.redBagImageview = [[UIImageView alloc]initWithImage: [UIImage imageNamed:interrogation_redBag]];
    [self.contentView addSubview:self.redBagImageview];
    
  
    self.priceLabel = [UILabel addLabelWithText:@"" AndFont:Font13 AndAlpha:1.0 AndColor:S_COLOR];
    [self.contentView addSubview:self.priceLabel];
    
    self.levelLabel = [UILabel addLabelWithText:@"" AndFont:Font13 AndAlpha:1.0 AndColor:S_COLOR];
    [self.contentView addSubview:self.levelLabel];
    
    self.dateLabel = [UILabel addLabelWithText:@"" AndFont:Font13 AndAlpha:1.0 AndColor:REMARK_COLOR];
    [self.contentView addSubview: self.dateLabel];
    
    self.detailLabel = [UILabel addLabelWithText:@"" AndFont:Font13 AndAlpha:1.0 AndColor:REMARK_COLOR];
    [self.contentView addSubview:self.detailLabel];
    
    self.contentLabel = [UILabel addLabelWithText:@"" AndFont:Font13 AndAlpha:1.0 AndColor:TITLE_COLOR];
    [self.contentView addSubview:self.contentLabel];
    
    self.bottomImageView = [UIImageView createImageViewWithImageName:nil color:sepBgColor];
    [self.contentView addSubview:self.bottomImageView];
    

}
-(void)configFrame
{
    [super configFrame];
    
    self.bottomImageView.sd_layout.widthIs(kScreenWidth).heightIs(px(2)).bottomSpaceToView(self.contentView,0);
    
}


-(void)setComment:(Comment *)comment
{
    

    
    self.phoneNumberLabel.text = [NSString backTelNumWithTelNum:comment.username];
    self.phoneNumberLabel.sd_layout.widthIs([NSString backSizeWithText:self.phoneNumberLabel.text andFont:font(Font13)].width).heightIs(Font13).leftSpaceToView(self.contentView,px(20)).topSpaceToView(self.contentView,px(16));
    
    self.redBagImageview.sd_layout.widthIs(self.redBagImageview.image.size.width).heightIs(self.redBagImageview.image.size.height).centerYEqualToView(self.phoneNumberLabel).leftSpaceToView( self.phoneNumberLabel,px(20));
    
    self.priceLabel.text = [NSString stringWithFormat:@"%@元",comment.gift];
    self.priceLabel.sd_layout.leftSpaceToView(self.redBagImageview,px(14)).centerYEqualToView(self.phoneNumberLabel).rightSpaceToView(self.contentView,px(30)).heightIs(Font13);
    
    self.levelLabel.text = comment.state;
    self.levelLabel.sd_layout.widthIs([NSString backSizeWithText:self.levelLabel.text andFont:font(Font13)].width).heightIs(Font13).topSpaceToView(self.phoneNumberLabel,px(20)).leftSpaceToView(self.contentView,px(20));

    NSString *createTimeStr = [NSString stringWithFormat:@"%lld",comment.create_time];
    
    if (createTimeStr.length < 13) {
        comment.create_time = comment.create_time * 1000;
    }
    
    self.dateLabel.text =   [NSString  timeIntervalWithDataStr:[NSString stringWithFormat:@"%lld",comment.create_time]];
    
    self.dateLabel.sd_layout.widthIs([NSString backSizeWithText:self.dateLabel.text andFont:font(Font13)].width).heightIs(Font13).leftSpaceToView(self.levelLabel,px(16)).centerYEqualToView( self.levelLabel);
    
    self.detailLabel.text = comment.service;
    self.detailLabel.sd_layout.leftSpaceToView(self.dateLabel,px(10)).centerYEqualToView(self.dateLabel).heightIs(Font13).rightSpaceToView(self.contentView,px(30));


    CGFloat superMsgViewH = 0;
     self.contentLabel.text = comment.content;
    NSDictionary *descDic = @{NSFontAttributeName:font(12)};
    CGRect descFrame =  [ self.contentLabel.text textRectWithSize:CGSizeMake(kScreenWidth - px(40), MAXFLOAT) attributes:descDic];
    descFrame.origin.x = px(20);
    descFrame.origin.y = px(92);
    self.contentLabel.frame = descFrame;
    
    superMsgViewH = CGRectGetMaxY(self.contentLabel.frame)+px(14);
    CGRect bounds = self.bounds;
    bounds.size.height = superMsgViewH;
    self.bounds=bounds;

    
}



@end
