//
//  SSPatientJudgeTableCell.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/10.
//  Copyright © 2017年 Claf. All rights reserved.
//
#define  judgeCellIdentifier @"judgeCellIdentifier"

#import "SSPatientJudgeTableCell.h"

@interface SSPatientJudgeTableCell ()

@property (nonatomic,strong)UIImageView *bottomLineView;
@property (nonatomic,strong) UIImageView *headImageView;
@property (nonatomic,strong) UILabel *headLabel;
@property (nonatomic,strong) UIImageView *tagImageview;
@property (nonatomic,strong) UILabel *tagLabel;
@property (nonatomic,strong) UILabel *contentLabel;

@end

@implementation SSPatientJudgeTableCell

+(instancetype)cellWithTableView:(UITableView *)tableView{
    
   SSPatientJudgeTableCell *cell = [tableView dequeueReusableCellWithIdentifier:judgeCellIdentifier];
    if (!cell) {
        cell = [[SSPatientJudgeTableCell  alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier: judgeCellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}


- (void)configUI{
  
    [super configUI];
    
    self.headImageView = [[UIImageView alloc]init];
    [self.contentView addSubview:self.headImageView];
    self.headImageView.layer.cornerRadius  = px(50)/2;
    self.headImageView.clipsToBounds = YES;
    
    self.headLabel = [UILabel addLabelWithText:@"" AndFont:Font13 AndAlpha:1.0 AndColor:REMARK_COLOR];
    [self.contentView addSubview:self.headLabel];
    
    self.tagImageview = [[UIImageView alloc]init];
    [self.contentView addSubview: self.tagImageview];
    
    self.tagLabel = [UILabel addLabelWithText:@"" AndFont:Font13 AndAlpha:1.0 AndColor:S_COLOR];
    [self.contentView addSubview:self.tagLabel];
    
    self.contentLabel = [UILabel addLabelWithText:@"" AndFont:Font13 AndAlpha:1.0 AndColor:TITLE_COLOR];
    [self.contentView addSubview:self.contentLabel];
    
    self.bottomLineView = [UIImageView createImageViewWithImageName:nil color:sepBgColor];
    [self.contentView addSubview: self.bottomLineView];
    
    
}
- (void)configFrame{
    
    [super configFrame];
    
    self.headImageView.sd_layout.widthIs(px(50)).heightIs(px(50)).leftSpaceToView(self.contentView,px(30)).topSpaceToView(self.contentView,px(10));
    
   
}




-(void)setPatientPraise:(PatientPraise *)patientPraise
{
    _patientPraise = patientPraise;
    
    ICLog(@"%@",patientPraise.head);
    
    NSURL *urlone = patientPraise.head;
    
    NSString *twostr = [NSString stringWithFormat:@"%@",urlone];
    
    NSString *urlstring = [NSString stringWithFormat:@"%@%@",ImageBaseURL,twostr];
    
    [self.headImageView sd_setImageWithURL:[NSURL URLWithString:urlstring] placeholderImage:[UIImage imageNamed:@"1"]];
    
//    [self.headImageView sd_setImageWithURL:[NSURL URLWithString: [patientPraise.head containsString:@"http"]?patientPraise.head:[NSString stringWithFormat:@"%@%@",ImageBaseURL, patientPraise.head]] placeholderImage:[UIImage imageNamed:@"1"]];
    
    if (patientPraise.gift.integerValue>0) {
        self.tagImageview.image = [UIImage imageNamed:interrogation_redBag];
        self.tagLabel.text = [NSString stringWithFormat:@"%@元",patientPraise.gift];
    
        self.headLabel.text = [NSString stringWithFormat:@"%@ 给%@送心意",[NSString backTelNumWithTelNum:patientPraise.username], patientPraise.name];
    }
    else
    {
        if (patientPraise.view.integerValue>2) {
            
            self.tagImageview.image = [UIImage imageNamed:goodIcon];
            self.tagLabel.text = @"好评";
              self.headLabel.text = [NSString stringWithFormat:@"%@ 给%@送好评",[NSString backTelNumWithTelNum:patientPraise.username], patientPraise.name];
        }
        else
        {
             self.headLabel.text = [NSString stringWithFormat:@"%@ 给%@评价",[NSString backTelNumWithTelNum:patientPraise.username], patientPraise.name];
        }
    }
    
    self.headLabel.sd_layout.widthIs([NSString backSizeWithText:self.headLabel.text andFont:font(Font13)].width).heightIs(Font13).topSpaceToView(self.contentView,px(20)).leftSpaceToView(self.headImageView,px(10));
    
    self.tagImageview.sd_layout.widthIs(self.tagImageview.image.size.width).heightIs(self.tagImageview.image.size.height).centerYEqualToView(self.headLabel).leftSpaceToView(self.headLabel,px(16));
    self.tagLabel.sd_layout.widthIs([NSString backSizeWithText: self.tagLabel.text andFont:font(Font13)].width).heightIs(Font13).leftSpaceToView(self.tagImageview,px(10)).centerYEqualToView(self.tagImageview);
    
   self.contentLabel.text = patientPraise.content ;
    self.contentLabel.sd_layout.widthIs([NSString backSizeWithText:self.contentLabel.text andFont:font(Font13)].width).heightIs(Font13).topSpaceToView(self.headLabel,px(30)).leftSpaceToView(self.contentView,px(106));
    
    self.bottomLineView.sd_layout.widthIs(kScreenWidth).heightIs(px(2)).bottomSpaceToView(self.contentView,0);
    
}
@end
