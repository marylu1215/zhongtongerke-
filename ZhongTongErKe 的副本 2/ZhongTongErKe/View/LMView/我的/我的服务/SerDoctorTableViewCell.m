//
//  SerDoctorTableViewCell.m
//  ZhongTongErKe
//
//  Created by khj on 2017/5/29.
//  Copyright © 2017年 Claf. All rights reserved.
//
#define SerDoctorIdentifier @"SerDoctorTableViewCelllIdentifier"

#import "SerDoctorTableViewCell.h"

@interface SerDoctorTableViewCell ()
@property (nonatomic ,strong) UILabel *dateLabel;

@property (nonatomic ,strong) UILabel *hosLabel;

@property (nonatomic ,strong) UIImageView *dHeadImageView;

@property (nonatomic ,strong) UILabel *dNameLabel;

@property (nonatomic ,strong) UILabel *administrativeLabel;

@property (nonatomic ,strong) UILabel *typeLabel;

@property (nonatomic ,strong) UILabel *stateLabel;

@property (nonatomic ,strong) UILabel *numLabel;

@end
@implementation SerDoctorTableViewCell
+(instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *ID =  SerDoctorIdentifier;
   SerDoctorTableViewCell  *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[SerDoctorTableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:ID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}



-(void)configUI
{
    
    
    self.dateLabel = [UILabel addLabelWithText:@"" AndFont:12 AndAlpha:1.0 AndColor:cGrayWord];
    [self.contentView addSubview:self.dateLabel];
    
    self.stateLabel = [UILabel addLabelWithText:@"" AndFont:12 AndAlpha:1.0 AndColor:cGrayWord];
    [self.contentView addSubview:self.stateLabel];
    
    self.evButton = [UIButton addBtnWithTitle:@"" WithBGImg:nil WithFont:Font13 WithTitleColor:S_COLOR Target:self Action:@selector(evAction:)];
    [self.contentView addSubview:self.evButton];
    
    self.dHeadImageView = [[UIImageView alloc]init];
    self.dHeadImageView.layer.cornerRadius = px(80)/2.0;
    self.dHeadImageView.layer.borderColor =  cHBColor.CGColor;
    self.dHeadImageView.layer.borderWidth = px(2);
    self.dHeadImageView.clipsToBounds = YES;
    [self.contentView addSubview:self.dHeadImageView];
    
    
    self.dNameLabel = [UILabel addLabelWithText:@"" AndFont:15 AndAlpha:1.0 AndColor:cGrayWord];
    [self.contentView addSubview:self.dNameLabel];
    
    self.administrativeLabel = [UILabel addLabelWithText:@"" AndFont:15 AndAlpha:1.0 AndColor:cGrayWord];
    [self.contentView addSubview: self.administrativeLabel];
    
    self.hosLabel = [UILabel addLabelWithText:@"" AndFont:12 AndAlpha:1.0 AndColor:cGrayWord];
    [self.contentView addSubview:self.hosLabel];
    
    self.typeLabel = [UILabel addLabelWithText:@"" AndFont:15 AndAlpha:1.0 AndColor:cGrayWord];
    [self.contentView addSubview:self.typeLabel];
    
    self.numLabel = [UILabel addLabelWithText:@"" AndFont:15 AndAlpha:1.0 AndColor:cGrayWord];
    [self.contentView addSubview: self.numLabel];
    
}
-(void)configFrame
{
    self.dateLabel.sd_layout.leftSpaceToView(self.contentView,px(30)).rightSpaceToView(self.contentView,0).heightIs(12).topSpaceToView(self.contentView,px(30));
}

-(void)setMyServices:(MyServices *)myServices
{
    
    _myServices = myServices;
    
    NSString *createTimeStr = [NSString stringWithFormat:@"%lld",myServices.create_time];
    
    if (createTimeStr.length < 13) {
        myServices.create_time = myServices.create_time * 1000;
    }
    
    self.dateLabel.text = [NSString toTimeIntervalWithDataStr:[NSString stringWithFormat:@"%lld",myServices.create_time]];

    if ([myServices.status isEqualToString:@"0"]) {
        
         self.stateLabel.text = @"进行中";
    }
    else
    {
          self.stateLabel.text = @"已关闭";
    }
  
    if (myServices.comment.length) {
        
        if ([myServices.comment integerValue]<2) {
            myServices.comment = @"差评";
        }
        else if (myServices.comment.integerValue<4)
        {
            myServices.comment = @"满意";
        }
        else
        {
            myServices.comment = @"非常满意";
        }
        
        
        [self.evButton setTitle:myServices.comment forState:UIControlStateNormal];
        
        self.evButton.sd_layout.widthIs([NSString backSizeWithText:  self.evButton.titleLabel.text  andFont:font(12)].width).heightIs(12).rightSpaceToView(self.contentView,px(30)).centerYEqualToView(self.dateLabel);
        self.evButton.userInteractionEnabled = NO;
        self.stateLabel .sd_layout.widthIs([NSString backSizeWithText:self.stateLabel.text andFont:font(12)].width).heightIs(12).rightSpaceToView(self.evButton,px(10)).centerYEqualToView(self.dateLabel);
    }
    
    else
    {

        
        if ([myServices.status isEqualToString:@"0"]) {
            self.stateLabel .sd_layout.widthIs([NSString backSizeWithText:self.stateLabel.text andFont:font(12)].width).heightIs(12).rightSpaceToView(self.contentView,px(30)).centerYEqualToView(self.dateLabel);
        }
        
        else
        {
             [self.evButton setTitle:@"去评价" forState:UIControlStateNormal];
            self.evButton.sd_layout.widthIs([NSString backSizeWithText:self.evButton.titleLabel.text andFont:font(Font13)].width).heightIs(Font13).rightSpaceToView(self.contentView,px(30)).centerYEqualToView(self.dateLabel);
            self.evButton.userInteractionEnabled = YES;
            self.stateLabel .sd_layout.widthIs([NSString backSizeWithText:self.stateLabel.text andFont:font(12)].width).heightIs(12).rightSpaceToView(self.evButton,px(10)).centerYEqualToView(self.dateLabel);
        }
        
    }
    
    
    [self.dHeadImageView sd_setImageWithURL: [NSURL URLWithString: [myServices.doctor_head containsString:@"http"]?myServices.doctor_head:[NSString stringWithFormat:@"%@%@",ImageBaseURL,myServices.doctor_head]]placeholderImage:[UIImage imageNamed:@"doctor"]];
    
    self.dHeadImageView.sd_layout.widthIs(px(80)).heightIs(px(80)).topSpaceToView(self.dateLabel,px(30)).leftSpaceToView(self.contentView,px(30));
    
    
    self.dNameLabel.text = myServices.doctor_name;
    self.dNameLabel.sd_layout.widthIs([NSString backSizeWithText:self.dNameLabel.text andFont:font(15)].width).heightIs(15).leftSpaceToView(self.dHeadImageView,px(30)).topSpaceToView(self.dateLabel,px(40))
    ;
    
    self.administrativeLabel.text = myServices.department;
    self.administrativeLabel.sd_layout.widthIs([NSString backSizeWithText:self.self.administrativeLabel.text andFont:font(15)].width).heightIs(15).leftSpaceToView(self.dNameLabel,px(20)).centerYEqualToView(self.dNameLabel)
    ;
    
    self.hosLabel.text = myServices.ssyy;
    self.hosLabel.sd_layout.widthIs([NSString backSizeWithText:self.hosLabel.text andFont:font(15)].width).heightIs(15).leftSpaceToView(self.dHeadImageView,px(20)).topSpaceToView(self.dNameLabel,px(10));
    
    self.typeLabel.text = myServices.service;
    self.typeLabel.sd_layout.widthIs([NSString backSizeWithText: self.typeLabel.text andFont:font(15)].width).heightIs(15).leftSpaceToView( self.contentView,px(30)).topSpaceToView(self.dHeadImageView,px(30))
    ;

    if ([myServices.service isEqualToString:@"私人医生"]) {
        self.numLabel.text = [NSString stringWithFormat:@"%@周",myServices.num.length?myServices.num:@"1"];
    }
   

    else if ([myServices.service isEqualToString:@"院后指导"])
    {
         self.numLabel.text = [NSString stringWithFormat:@"%@天", myServices.num.length?myServices.num:@"1"];
    }
    else
    {
        self.numLabel.text = [NSString stringWithFormat:@"%@次",myServices.num.length?myServices.num:@"1"];
    }
  
    self.numLabel.sd_layout.widthIs([NSString backSizeWithText:  self.numLabel.text andFont:font(15)].width).heightIs(15).rightSpaceToView( self.contentView,px(30)).centerYEqualToView(self.typeLabel);
}

-(void)evAction:(UIButton *)button
{
    if (self.evaluateBlock)
    {
        self.evaluateBlock(button);
    }
}

@end
