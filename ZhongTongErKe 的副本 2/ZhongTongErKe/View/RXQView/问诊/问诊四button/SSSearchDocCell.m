//
//  SSSearchDocCell.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/12.
//  Copyright © 2017年 Claf. All rights reserved.
//

#define DocCellIdentifier  @"DocCellIdentifier"

#import "SSSearchDocCell.h"

@interface SSSearchDocCell ()

@property (nonatomic,strong) UIImageView *headImageView;
@property (nonatomic,strong) UILabel *nameLabel;
@property (nonatomic,strong) UILabel *adminLabel;
@property (nonatomic,strong) UILabel *levelLabel;
@property (nonatomic,strong) UILabel *hospitalLabel;
@property (nonatomic,strong) UILabel *describeLabel;
@property (nonatomic,strong) UILabel *experienceLabel;
@property (nonatomic,strong) UILabel *priceLabel;
@property (nonatomic,strong) UILabel *measureLabel;
@property (nonatomic,strong) UIImageView *line;
@property (nonatomic,strong) UIView *bottomView;

@end

@implementation SSSearchDocCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    
    SSSearchDocCell *cell = [tableView dequeueReusableCellWithIdentifier:DocCellIdentifier];
    if (cell == nil) {
        cell = [[SSSearchDocCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:DocCellIdentifier];
    }
    
    return cell;
}

-(void)configUI
{
    [super configUI];
    
    self.headImageView = [[UIImageView alloc]init];
    self.headImageView.layer.borderColor =cHBColor.CGColor;
    self.headImageView.layer.borderWidth = px(2);
    self.headImageView.layer.cornerRadius = px(100)/2;
    self.headImageView.clipsToBounds = YES;
    [self.contentView addSubview:self.headImageView];
    
    self.nameLabel = [UILabel addLabelWithText:@"" AndFont:Font15 AndAlpha:1.0 AndColor:TITLE_COLOR];
    [self.contentView addSubview: self.nameLabel];
    
    self.adminLabel = [UILabel addLabelWithText:@"" AndFont:Font13 AndAlpha:1.0 AndColor:REMARK_COLOR];
    [self.contentView addSubview: self.adminLabel];
    
    self.levelLabel = [UILabel addLabelWithText:@"" AndFont:Font13 AndAlpha:1.0 AndColor:REMARK_COLOR];
    [self.contentView addSubview: self.levelLabel];
    
    self.hospitalLabel = [UILabel addLabelWithText:@"" AndFont:Font13 AndAlpha:1.0 AndColor:REMARK_COLOR];
    [self.contentView addSubview: self.hospitalLabel];
    
    self.describeLabel = [UILabel addLabelWithText:@"" AndFont:Font13 AndAlpha:1.0 AndColor:REMARK_COLOR];
    self.describeLabel.numberOfLines =0;
    [self.contentView addSubview:self.describeLabel];
    
    self.experienceLabel = [UILabel labelWithText:@"" Font:Font13 Color:cHBColor Alignment:NSTextAlignmentCenter];
    [self.contentView addSubview:self.experienceLabel];
    
    self.experienceLabel.layer.borderColor = cHBColor.CGColor;
    self.experienceLabel.layer.borderWidth =px(2);
    self.experienceLabel.layer.cornerRadius =4;
    self.experienceLabel.clipsToBounds = YES;
    
    self.line = [UIImageView createImageViewWithImageName:nil color:sepBgColor];
    [self.contentView addSubview:self.line];
    
    self.bottomView = [[UIView alloc]init];
    [self.contentView addSubview:self.bottomView];
    
    self.priceLabel = [UILabel addLabelWithText:@"" AndFont:Font15 AndAlpha:1.0 AndColor:S_COLOR];
    [self.bottomView addSubview:self.priceLabel];
    
    self.measureLabel = [UILabel addLabelWithText:@"" AndFont:Font13 AndAlpha:1.0 AndColor:REMARK_COLOR];
    [self.bottomView addSubview:self.measureLabel];
    
    
}
- (void)configFrame{
  
    [super configFrame];
    
    self.headImageView.sd_layout.widthIs(px(100)).heightIs(px(100)).leftSpaceToView(self.contentView,px(30)).topSpaceToView(self.contentView,px(20));
    
}
-(void)setDoctor:(Doctor *)doctor
{
    _doctor = doctor;
   
    [self.headImageView sd_setImageWithURL:[NSURL URLWithString: [doctor.head containsString:@"http"]?doctor.head:[NSString stringWithFormat:@"%@%@",ImageBaseURL,doctor.head]]];
    
    self.nameLabel.text = doctor.name;
    self.nameLabel.sd_layout.widthIs([NSString backSizeWithText:self.nameLabel.text andFont:font(Font15)].width).heightIs(Font15).topSpaceToView(self.contentView,px(22)).leftSpaceToView(self.headImageView,px(10));
    
    self.adminLabel.text = doctor.department;
    self.adminLabel.sd_layout.widthIs([NSString backSizeWithText:self.adminLabel.text andFont:font(Font13)].width).heightIs(Font13).centerYEqualToView(self.nameLabel).leftSpaceToView(self.nameLabel,px(10));
    
    self.levelLabel.text = doctor.title;
    self.levelLabel.sd_layout.widthIs([NSString backSizeWithText:self.levelLabel.text andFont:font(Font13)].width).heightIs(Font13).centerYEqualToView(self.nameLabel).leftSpaceToView(self.adminLabel,px(10));
    
    self.hospitalLabel.text = doctor.ssyy;
    self.hospitalLabel.sd_layout.widthIs([NSString backSizeWithText:self.hospitalLabel.text andFont:font(Font13)].width).heightIs(Font13).topSpaceToView(self.nameLabel,px(10)).leftSpaceToView(self.headImageView,px(10));
    
    CGFloat  superMsgViewH  =0;
    self.describeLabel.text = doctor.specialty;
    NSDictionary *descDic = @{NSFontAttributeName:font(Font13)};
    CGRect descFrame =  [self.describeLabel.text textRectWithSize:CGSizeMake(kScreenWidth - px(180), MAXFLOAT) attributes:descDic];
    descFrame.origin.x = px(140);
    descFrame.origin.y = px(92);
    self.describeLabel.frame = descFrame;
    
    self.experienceLabel.text = [NSString stringWithFormat:@"%@经验",doctor.experience];
    
    self.experienceLabel.sd_layout.widthIs([NSString backSizeWithText: self.experienceLabel.text andFont:font(Font13)].width+px(10)).heightIs(px(32)).leftSpaceToView(self.contentView,px(140)).topSpaceToView(self.describeLabel,px(10));
    
    self.line.sd_layout.widthIs(kScreenWidth).heightIs(px(2)).topSpaceToView(self.experienceLabel,px(12));
    
    self.bottomView.sd_layout.widthIs(kScreenWidth).heightIs(px(54)).topSpaceToView(self.line,0);
    
 
  
    self.priceLabel.text = [NSString stringWithFormat:@"%ld元/起",doctor.price.integerValue];
    self.priceLabel.sd_layout.widthIs([NSString backSizeWithText: self.priceLabel.text andFont:font(Font15)].width).heightIs(Font15).leftSpaceToView(self.bottomView,px(140)).centerYEqualToView(self.bottomView);
    
     self.measureLabel.text =  [NSString stringWithFormat:@"%@人购买",doctor.num];
      self.measureLabel.sd_layout.widthIs([NSString backSizeWithText:  self.measureLabel.text andFont:font(Font13)].width).heightIs(Font13).leftSpaceToView( self.priceLabel,px(10)).centerYEqualToView(self.bottomView);
    
    superMsgViewH = CGRectGetMaxY(self.describeLabel.frame)+px(116);
    CGRect bounds = self.bounds;
    bounds.size.height = superMsgViewH;
    self.bounds=bounds;
}


@end
