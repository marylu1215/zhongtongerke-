//
//  SSDocInformationCell.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/22.
//  Copyright © 2017年 Claf. All rights reserved.
//

#define SSDocInformationCellIdentifier @"SSDocInformationCellIdentifier"

#import "SSDocInformationCell.h"

@interface SSDocInformationCell ()

@property (nonatomic,strong) UIView *line;
@property (nonatomic,strong) UIView *bottomSeparator;
@property (nonatomic,strong) UIImageView *headImageView;
@property (nonatomic,strong) UILabel *nameLabel;
@property (nonatomic,strong) UILabel *hospitalLabel;
@property (nonatomic,strong) UILabel *leveLabel;
@property (nonatomic,strong) UILabel *rankLabel;
@property (nonatomic ,strong) UIImageView *sepImageView;
@property (nonatomic,strong) UILabel *specialLabel;
@property (nonatomic,strong) UILabel *detailSpecialLabel;


@end

@implementation SSDocInformationCell

+(instancetype)cellWithTableView:(UITableView *)tableView{
    
    SSDocInformationCell *cell = [tableView dequeueReusableCellWithIdentifier:SSDocInformationCellIdentifier];
    if (!cell) {
        cell = [[SSDocInformationCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:SSDocInformationCellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}



-(void)configUI
{
    self.headImageView = [[UIImageView alloc]init];
    self.headImageView.layer.borderColor = cHBColor.CGColor;
    self.headImageView.layer.borderWidth = px(2);
    self.headImageView.layer.cornerRadius = px(150)/2;
    self.headImageView.clipsToBounds = YES;
    [self.contentView addSubview:self.headImageView];
    
    self.nameLabel = [UILabel addLabelWithText:@"" AndFont:Font15 AndAlpha:1.0 AndColor:[UIColor colorWithHexString:@"333333"]];
    [self.contentView addSubview: self.nameLabel];
    
    self.hospitalLabel = [UILabel addLabelWithText:@"" AndFont:Font13 AndAlpha:1.0 AndColor:REMARK_COLOR];
    [self.contentView addSubview:self.hospitalLabel];
    
    self.leveLabel = [UILabel addLabelWithText:@"" AndFont:Font13 AndAlpha:1.0 AndColor:REMARK_COLOR];
    [self.contentView addSubview:self.leveLabel];
    
    self.rankLabel = [UILabel addLabelWithText:@"" AndFont:Font13 AndAlpha:1.0 AndColor:REMARK_COLOR];
    self.rankLabel.numberOfLines = 0;
    [self.contentView addSubview: self.rankLabel];
    
    self.sepImageView = [UIImageView createImageViewWithImageName:nil color:[UIColor colorWithHexString:@"e9e9e9"]];
    [self.contentView addSubview:self.sepImageView];
    
    self.specialLabel = [UILabel labelWithText:@"擅长" Font:Font13 Color:cHBColor Alignment:NSTextAlignmentCenter];
    self.specialLabel.layer.borderWidth = px(2);
    self.specialLabel.layer.borderColor = cHBColor.CGColor;
    self.specialLabel.layer.cornerRadius=3;
    self.specialLabel.clipsToBounds  =YES;
    [self.contentView addSubview:self.specialLabel];
    
    self.detailSpecialLabel = [UILabel addLabelWithText:@"" AndFont:Font13 AndAlpha:1.0 AndColor:REMARK_COLOR];
    self.detailSpecialLabel.numberOfLines =0;
    [self.contentView addSubview: self.detailSpecialLabel];
    
    self.checkButton = [UIButton  addBtnImage: unchooseImageName WithTarget:self action:@selector(checkAction:)];
    [self.contentView addSubview:self.checkButton];

}

-(void)configFrame
{
    self.headImageView.frame = CGRectMake(px(30), px(30), px(150), px(150));
    self.checkButton.sd_layout.widthIs(self.checkButton.imageView.image.size.width).heightIs(self.checkButton.imageView.image.size.height).rightSpaceToView(self.contentView,px(30)).topSpaceToView(self.contentView,px(30));
}
-(void)setDoctor:(Doctor *)doctor
{
    _doctor = doctor;

    
    [self.headImageView sd_setImageWithURL:[NSURL URLWithString:[doctor.head containsString:@"http"]?doctor.head:[NSString stringWithFormat:@"%@%@",ImageBaseURL,doctor.head]] placeholderImage:[UIImage imageNamed:@"1"]];
   
    self.nameLabel.text = doctor.name;
    self.nameLabel.frame = CGRectMake(CGRectGetMaxX(self.headImageView.frame)+px(10), px(30), [NSString backSizeWithText:self.nameLabel.text andFont:font(Font15)].width, Font15);
    
    self.hospitalLabel.text = doctor.ssyy;
     self.hospitalLabel.sd_layout.widthIs([NSString backSizeWithText:self.hospitalLabel.text andFont:font(Font13)].width).heightIs(Font13).centerYEqualToView(self.nameLabel).leftSpaceToView(self.nameLabel,px(10));
    
    self.leveLabel.text = doctor.title;
    
    self.leveLabel.frame =CGRectMake(CGRectGetMaxX(self.headImageView.frame)+px(10), CGRectGetMaxY(self.nameLabel.frame)+px(10), [NSString backSizeWithText:self.leveLabel.text andFont:font(Font13)].width, Font13);
    
   
    self.rankLabel.text = doctor.rank;
    
    NSDictionary *rankDescDic = @{NSFontAttributeName:font(Font13 )};
    CGRect rankLabelDescFrame =  [self.rankLabel.text textRectWithSize:CGSizeMake(kScreenWidth-px(224), MAXFLOAT) attributes:rankDescDic];
    rankLabelDescFrame.origin.x = px(194);
    rankLabelDescFrame.origin.y = CGRectGetMaxY(self.leveLabel.frame)+px(10);
    self.rankLabel.frame = rankLabelDescFrame;
 
    self.sepImageView .frame = CGRectMake(0,  CGRectGetMaxY(self.headImageView.frame)> CGRectGetMaxY(self.rankLabel.frame)? CGRectGetMaxY(self.headImageView.frame)+px(20):CGRectGetMaxY(self.rankLabel.frame)+px(20), kScreenWidth, px(2));
  
    self.specialLabel.sd_layout.widthIs([NSString backSizeWithText:self.specialLabel.text andFont:font(Font13)].width+px(20)).heightIs(px(34)).topSpaceToView(self.sepImageView,px(20)).leftSpaceToView(self.contentView,px(30));
    
    
    CGFloat superMsgViewH = 0;
    self.detailSpecialLabel.text = doctor.specialty;
    NSDictionary *descDic = @{NSFontAttributeName:font(Font13)};
    CGRect descFrame =  [self.detailSpecialLabel.text textRectWithSize:CGSizeMake(kScreenWidth - px(124), MAXFLOAT) attributes:descDic];
    descFrame.origin.x = px(126);
    descFrame.origin.y = CGRectGetMaxY(self.sepImageView.frame)+px(20);
    self.detailSpecialLabel.frame = descFrame;

    superMsgViewH = CGRectGetMaxY(self.detailSpecialLabel.frame)+px(12);
    CGRect bounds = self.bounds;
    bounds.size.height = superMsgViewH;
    self.bounds=bounds;

}
-(void)checkAction:(UIButton *)btn
{
  
    if ([self.delegate respondsToSelector:@selector(handleSelectedButtonActionWithSelectedIndexPath:)]) {
        
        [self.delegate handleSelectedButtonActionWithSelectedIndexPath:self.selectedIndexPath];
    }
    
}
@end
