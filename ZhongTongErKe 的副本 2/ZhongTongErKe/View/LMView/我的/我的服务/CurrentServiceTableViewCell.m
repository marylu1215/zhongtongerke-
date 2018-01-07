//
//  CurrentServiceTableViewCell.m
//  ZhongTongErKe
//
//  Created by khj on 2017/5/28.
//  Copyright © 2017年 Claf. All rights reserved.
//
#define CurrentServiceCellIdentifier @"CurrentServiceTableViewCelllIdentifier"

#import "CurrentServiceTableViewCell.h"

@interface CurrentServiceTableViewCell ()

@property (nonatomic ,strong) UILabel *dateLabel;

@property (nonatomic ,strong) UILabel *contentLabel;

@property (nonatomic ,strong) UIImageView *dHeadImageView;

@property (nonatomic ,strong) UILabel *dNameLabel;

@property (nonatomic ,strong) UILabel *administrativeLabel;

@property (nonatomic ,strong) UILabel *typeLabel;

@property (nonatomic ,strong) UILabel *stateLabel;

@property (nonatomic ,strong) UILabel *effectLabel;


@end
@implementation CurrentServiceTableViewCell

+(instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *ID = CurrentServiceCellIdentifier;
    CurrentServiceTableViewCell  *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[CurrentServiceTableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:ID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

-(void)configUI
{
    
  
    self.dateLabel = [UILabel addLabelWithText:@"" AndFont:12 AndAlpha:1.0 AndColor:cGrayWord];
    [self.contentView addSubview:self.dateLabel];
    
    self.contentLabel = [[UILabel alloc]init];
    self.contentLabel.textColor = TITLE_COLOR;
    self.contentLabel.font = font(12);
    self.contentLabel.numberOfLines = 0;
    [self.contentView addSubview:self.contentLabel];
    
    self.dHeadImageView = [[UIImageView alloc]init];
    self.dHeadImageView.layer.cornerRadius = px(44)/2.0;
    self.dHeadImageView.layer.borderColor =  cHBColor.CGColor;
    self.dHeadImageView.layer.borderWidth = px(2);
    self.dHeadImageView.clipsToBounds = YES;
    [self.contentView addSubview:self.dHeadImageView];
    
    
    self.dNameLabel = [UILabel addLabelWithText:@"" AndFont:15 AndAlpha:1.0 AndColor:cGrayWord];
    [self.contentView addSubview:self.dNameLabel];
    
    self.administrativeLabel = [UILabel addLabelWithText:@"" AndFont:15 AndAlpha:1.0 AndColor:cGrayWord];
    [self.contentView addSubview: self.administrativeLabel];
    
    self.typeLabel = [UILabel addLabelWithText:@"" AndFont:15 AndAlpha:1.0 AndColor:cGrayWord];
    [self.contentView addSubview:self.typeLabel];
    
    self.stateLabel = [UILabel addLabelWithText:@"" AndFont:12 AndAlpha:1.0 AndColor:cGrayWord];
    [self.contentView addSubview:self.stateLabel];
    
    self.effectLabel = [UILabel addLabelWithText:@"" AndFont:12 AndAlpha:1.0 AndColor:S_COLOR];
    [self.contentView addSubview: self.effectLabel];
    
    
}
-(void)configFrame
{
    self.dateLabel.sd_layout.leftSpaceToView(self.contentView,px(30)).rightSpaceToView(self.contentView,0).heightIs(12).topSpaceToView(self.contentView,px(30));
}

-(void)setMyServices:(MyServices *)myServices
{
    
    _myServices =  myServices;
    
    NSString *createTimeStr = [NSString stringWithFormat:@"%lld",myServices.create_time];
    
    if (createTimeStr.length < 13) {
       myServices.create_time = myServices.create_time * 1000;
    }
    
    self.dateLabel.text = [NSString toTimeIntervalWithDataStr:[NSString stringWithFormat:@"%lld",myServices.create_time]];
    
    if ([myServices.status isEqualToString:@"0"]) {
        
         self.stateLabel.text = @"未回答";
    }
   else
   {
       self.stateLabel.text = @"已关闭";

   }
    
  
    if (myServices.comment.length)
    {
     self.effectLabel.text = myServices.comment;
     self.effectLabel.sd_layout.widthIs([NSString backSizeWithText:  self.effectLabel.text  andFont:font(12)].width).heightIs(12).rightSpaceToView(self.contentView,px(30)).centerYEqualToView(self.dateLabel);
    self.stateLabel.sd_layout.widthIs([NSString backSizeWithText:self.stateLabel.text andFont:font(12)].width).heightIs(12).rightSpaceToView(self.effectLabel,px(10)).centerYEqualToView(self.dateLabel);
      }

    else
    {
    self.stateLabel .sd_layout.widthIs([NSString backSizeWithText:self.stateLabel.text andFont:font(12)].width).heightIs(12).rightSpaceToView(self.contentView,px(30)).centerYEqualToView(self.dateLabel);
   }

    CGFloat superMsgViewH = 0;
    self.contentLabel.text = myServices.title;
    NSDictionary *descDic = @{NSFontAttributeName:font(12)};
    CGRect descFrame =  [self.contentLabel.text textRectWithSize:CGSizeMake(kScreenWidth - px(60), MAXFLOAT) attributes:descDic];
    descFrame.origin.x = px(30);
    descFrame.origin.y = px(70);
    self.contentLabel.frame = descFrame;
    

     [self.dHeadImageView sd_setImageWithURL: [NSURL URLWithString: [myServices.doctor_head containsString:@"http"]?myServices.doctor_head:[NSString stringWithFormat:@"%@%@",ImageBaseURL,myServices.doctor_head]] placeholderImage:[UIImage imageNamed:@"doctor"]];
    
    self.dHeadImageView.sd_layout.widthIs(px(44)).heightIs(px(44)).topSpaceToView(self.contentLabel,px(20)).leftSpaceToView(self.contentView,px(30));
    
    
    self.dNameLabel.text = myServices.doctor_name;
    self.dNameLabel.sd_layout.widthIs([NSString backSizeWithText:self.dNameLabel.text andFont:font(15)].width).heightIs(15).leftSpaceToView(self.dHeadImageView,px(10)).centerYEqualToView(self.dHeadImageView)
    ;
    
    self.administrativeLabel.text = myServices.department;
    self.administrativeLabel.sd_layout.widthIs([NSString backSizeWithText:self.administrativeLabel.text andFont:font(15)].width).heightIs(15).leftSpaceToView(self.dNameLabel,px(20)).centerYEqualToView(self.dHeadImageView);
    
    self.typeLabel.text = myServices.service;
    self.typeLabel.sd_layout.widthIs([NSString backSizeWithText: self.typeLabel.text andFont:font(15)].width).heightIs(15).rightSpaceToView( self.contentView,px(30)).centerYEqualToView(self.dHeadImageView)
    ;
    
    superMsgViewH = CGRectGetMaxY(self.contentLabel.frame)+px(80);
    CGRect bounds = self.bounds;
    bounds.size.height = superMsgViewH;
    self.bounds=bounds;
}


@end
