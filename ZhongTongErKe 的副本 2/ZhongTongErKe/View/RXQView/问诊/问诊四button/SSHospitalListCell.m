//
//  SSHospitalListCell.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/19.
//  Copyright © 2017年 Claf. All rights reserved.
//
#define HospitalCellIdentifier @"HospitalCellIdentifier"
#import "Doctor.h"

#import "SSHospitalListCell.h"

@interface SSHospitalListCell ()

@property (nonatomic,strong)UIView *separator;
@property (nonatomic,strong) UIImageView *headImageview;
@property (nonatomic,strong) UILabel *nameLabel;
@property (nonatomic,strong) UILabel *levelLabel;
@property (nonatomic,strong) UILabel *medInsuLabel;
@property (nonatomic,strong) UIImageView *addressImageview;
@property (nonatomic,strong) UILabel *addressLabel;
@property (nonatomic,strong) UIImageView *arrowImageview;
@property (nonatomic,strong) UILabel *distanceLabel;
@end

@implementation SSHospitalListCell

+(instancetype)cellWithTableView:(UITableView *)tableView{
    
    SSHospitalListCell  *cell = [tableView dequeueReusableCellWithIdentifier:HospitalCellIdentifier];
    if (!cell) {
        cell = [[SSHospitalListCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:HospitalCellIdentifier];
        
    }
    return cell;
}
-(void)configUI
{
    [super configUI];
    self.headImageview = [[UIImageView alloc]init];
    [self.contentView addSubview:self.headImageview];
    
    self.nameLabel = [UILabel addLabelWithText:@"" AndFont:Font15 AndAlpha:1.0 AndColor:TITLE_COLOR];
    [self.contentView addSubview:self.nameLabel];
    
    self.distanceLabel = [UILabel addLabelWithText:@"" AndFont:Font13 AndAlpha:1.0 AndColor:REMARK_COLOR];
    [self.contentView addSubview:self.distanceLabel];
    
    self.levelLabel = [UILabel addLabelWithText:@"" AndFont:Font13 AndAlpha:1.0 AndColor:REMARK_COLOR];
    [self.contentView addSubview:self.levelLabel];
    
    self.medInsuLabel = [UILabel labelWithText:@"医保" Font:Font13 Color:cHBColor Alignment:NSTextAlignmentCenter];
    self.medInsuLabel.layer.borderColor = cHBColor.CGColor;
    self.medInsuLabel.layer.borderWidth = px(2);
    [self.contentView addSubview: self.medInsuLabel];
    
    self.addressImageview = [[UIImageView alloc]initWithImage:[UIImage imageNamed:grayLocationImageName]];
    [self.contentView addSubview:self.addressImageview];
    
    self.addressLabel = [UILabel addLabelWithText:@"" AndFont:Font13 AndAlpha:1.0 AndColor:REMARK_COLOR];
    [self.contentView addSubview: self.addressLabel];
    
    self.arrowImageview = [[UIImageView alloc]initWithImage:[UIImage imageNamed:goImageName]];
    [self.contentView addSubview:self.arrowImageview];
    
}
-(void)configFrame
{
    [super configFrame];
    
    self.headImageview.sd_layout.widthIs(px(220)).heightIs(px(162)).topSpaceToView(self.contentView,0).bottomSpaceToView(self.contentView,0);
    
    self.arrowImageview.sd_layout.widthIs(self.addressImageview.image.size.width).heightIs(self.addressImageview.image.size.height).rightSpaceToView(self.contentView,px(30)).centerYEqualToView(self.contentView);
  
}

-(void)setHospital:(Hospital *)hospital
{
    _hospital = hospital;
    
    
    [self.headImageview sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",ImageBaseURL,hospital.img]]];
    
    self.distanceLabel.text = [NSString stringWithFormat:@"%@km",hospital.distance];
    self.distanceLabel.sd_layout.rightSpaceToView(self.contentView,px(10)).topSpaceToView(self.contentView,px(12)).widthIs([NSString backSizeWithText:self.distanceLabel.text andFont:font(Font13)].width).heightIs(Font13);
    
    self.nameLabel.text = hospital.name;
    self.nameLabel.sd_layout.leftSpaceToView(self.headImageview,px(10)).topSpaceToView(self.contentView,px(14)).heightIs(Font15).rightSpaceToView( self.distanceLabel,0);
    
    self.levelLabel.text = hospital.title;
     self.levelLabel.sd_layout.leftSpaceToView(self.headImageview,px(10)).topSpaceToView(self.nameLabel,px(14)).heightIs(Font13).rightSpaceToView( self.contentView,0);
    
//    self.medInsuLabel.text = hospital.medInsu;
    self.medInsuLabel.sd_layout.leftSpaceToView(self.headImageview,px(10)).topSpaceToView(self.levelLabel,px(10)).heightIs(Font15).widthIs(px(80));
    
    self.addressImageview.sd_layout.widthIs(self.addressImageview.image.size.width).heightIs(self.addressImageview.image.size.height).leftSpaceToView(self.headImageview,px(15)).topSpaceToView(self.medInsuLabel,px(10));
  
    self.addressLabel.text = hospital.address;
    self.addressLabel.sd_layout.leftSpaceToView(self.addressImageview,px(10)).rightSpaceToView(self.contentView,0).heightIs(Font13).centerYEqualToView(self.addressImageview);
    
}


@end
