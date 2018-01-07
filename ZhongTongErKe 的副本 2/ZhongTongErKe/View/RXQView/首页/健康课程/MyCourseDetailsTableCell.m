//
//  MyCourseDetailsTableCell.m
//  ZhongTongErKe
//
//  Created by khj on 2017/6/20.
//  Copyright © 2017年 Claf. All rights reserved.
//
#define CourseDetTableCellIdentifier @"CourseDetTableCellIdentifier"
#import "MyCourseDetailsTableCell.h"

@interface MyCourseDetailsTableCell ()

@property (nonatomic ,strong) UIImageView *circleImageView;
@property (nonatomic ,strong) UILabel *numLabel;
@property (nonatomic ,strong) UIImageView *bgImageView;
@property (nonatomic ,strong) UILabel *dateLabe;
@property (nonatomic ,strong) UILabel *teachLabel;
@property (nonatomic ,strong) UIButton *signButton;



@end

@implementation MyCourseDetailsTableCell

+(instancetype)cellWithTableView:(UITableView *)tableView{
    
   MyCourseDetailsTableCell *cell = [tableView dequeueReusableCellWithIdentifier:CourseDetTableCellIdentifier];
    if (!cell) {
        cell = [[ MyCourseDetailsTableCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:CourseDetTableCellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self prepareUI];
        [self configueFrame];
        
    }
    return self;
}

-(void)prepareUI
{
    self.circleImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:serial_numberImageName]];
    [self.contentView addSubview:self.circleImageView];
    
    self.numLabel = [UILabel addLabelWithText:@"" AndFont:Font13 AndAlpha:1.0 AndColor:c255255255];
    [self.circleImageView addSubview:self.numLabel];
    
    self.bgImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:wordsbgImageName]];
    [self.contentView addSubview: self.bgImageView];
    
    self.dateLabe = [UILabel addLabelWithText:@"" AndFont:Font13 AndAlpha:1.0 AndColor:[UIColor colorWithHexString:@"333333"]];
    [self.bgImageView addSubview:self.dateLabe];
    
    self.teachLabel = [UILabel addLabelWithText:@"" AndFont:Font13 AndAlpha:1.0 AndColor:[UIColor colorWithHexString:@"333333"]];
    [self.bgImageView addSubview: self.teachLabel];
    
    self.signButton = [UIButton addBtnWithTitle:@"签到" WithBGImg:checkbgImageName WithFont:Font13 WithTitleColor:c255255255 Target:self Action:@selector(signAction:)];
    [self.contentView addSubview: self.signButton];
    
    self.vView = [[UIView alloc]init];
    self.vView.backgroundColor = [UIColor colorWithHexString:@"37cfdd"];
    [self.contentView addSubview:self.vView];
    
    
}

-(void)configueFrame
{
    self.circleImageView.sd_layout.widthIs(self.circleImageView.image.size.width).heightIs(self.circleImageView.image.size.height).leftSpaceToView(self.contentView,px(30)).topSpaceToView(self.contentView,0);
    
    self.vView.sd_layout.widthIs(px(4)).heightIs(px(52)).topSpaceToView( self.circleImageView,0).centerXEqualToView(self.circleImageView);
    
    self.signButton.sd_layout.widthIs(px(86)).heightIs(px(86)).rightSpaceToView(self.contentView,px(30)).topSpaceToView(self.contentView,0);
    
    self.bgImageView.sd_layout.rightSpaceToView(self.signButton,px(40)).heightIs(px(86)).topSpaceToView(self.contentView,0).leftSpaceToView(self.circleImageView,px(20));
    
    
}

-(void)signAction:(UIButton *)btn
{
    [btn setTitle:@"已签到" forState:UIControlStateNormal];
    
    if ([btn.titleLabel.text isEqualToString:@"已签到"]) {
        
        btn.userInteractionEnabled = NO;
        [btn  setBackgroundImage:[UIImage imageNamed:check_garyImageName]  forState:UIControlStateNormal];
        
    }
}

-(void)setCourse:(Course *)course
{
    _course = course;
    
   self.numLabel.text = [course.sortNum longLongValue]/10? course.sortNum:[NSString stringWithFormat:@"0%@",course.sortNum];
    self.numLabel.sd_layout.widthIs([NSString backSizeWithText:self.numLabel.text andFont:font(Font13)].width).heightIs(Font13).centerXEqualToView(self.circleImageView).centerYEqualToView(self.circleImageView);
    
    self.dateLabe.text = [NSString stringWithFormat:@"%@ %@",[NSString returnBgDtaWithMMDDStr:course.date],[NSString weekdayStringFromDate:course.date]];
    self.dateLabe.sd_layout.widthIs([NSString backSizeWithText:self.dateLabe.text andFont:font(Font13)].width).heightIs(Font13).leftSpaceToView(self.bgImageView,px(30)).topSpaceToView(self.bgImageView,px(14));

    self.teachLabel.text = [NSString stringWithFormat:@"授课老师: %@",  course.teacher];
    
     self.teachLabel.sd_layout.widthIs([NSString backSizeWithText:self.teachLabel.text andFont:font(Font13)].width).heightIs(Font13).leftSpaceToView(self.bgImageView,px(30)).bottomSpaceToView(self.bgImageView,px(10));
}
@end
