//
//  SSFamousConsultCell.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/22.
//  Copyright © 2017年 Claf. All rights reserved.
//

#define SSFamousConsultCellIdentifier @"SSFamousConsultCellIdentifier"
#import "SSFamousConsultCell.h"

@interface SSFamousConsultCell ()

@property (nonatomic,strong)UIView *line;

@end

@implementation SSFamousConsultCell

+(instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *ID =  SSFamousConsultCellIdentifier;
    SSFamousConsultCell  *cell = [tableView dequeueReusableCellWithIdentifier:ID];
   // cell.backgroundColor = [UIColor redColor];
    if (!cell) {
        cell = [[ SSFamousConsultCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:ID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}



- (void)configUI
{
    self.contentLabel = [UILabel addLabelWithText:@"" AndFont:Font13 AndAlpha:1.0 AndColor:TITLE_COLOR];
    self.contentLabel.numberOfLines =0;
    [self.contentView addSubview: self.contentLabel];
    
    self.phoneLabel = [UILabel addLabelWithText:@"" AndFont:Font13 AndAlpha:1.0 AndColor:cGrayWord];
    [self.contentView addSubview:  self.phoneLabel];
    
    self.dateLabel = [UILabel addLabelWithText:@"" AndFont:Font13 AndAlpha:1.0 AndColor:cGrayWord];
    [self.contentView addSubview: self.dateLabel];
    
}

-(void)setPatientPraise:(PatientPraise *)patientPraise
{
    _patientPraise = patientPraise;
    CGFloat superMsgViewH = 0;
    self.contentLabel.text = patientPraise.content;
    NSDictionary *descDic = @{NSFontAttributeName:font(Font13)};
    CGRect descFrame =  [self.contentLabel.text textRectWithSize:CGSizeMake(kScreenWidth - px(60), MAXFLOAT) attributes:descDic];
    descFrame.origin.x = px(30);
    descFrame.origin.y = 0;
    self.contentLabel.frame = descFrame;
    
    self.phoneLabel.text = [NSString backTelNumWithTelNum:patientPraise.username];
    self.phoneLabel.sd_layout.widthIs([NSString backSizeWithText:self.phoneLabel.text  andFont:font( Font13)].width).heightIs(Font13).leftSpaceToView(self.contentView,px(30)).topSpaceToView(self.contentLabel,0);
  
    
    
    NSString *createTimeStr = [NSString stringWithFormat:@"%lld",patientPraise.create_time];
    
    if (createTimeStr.length < 13) {
        patientPraise.create_time = patientPraise.create_time * 1000;
    }
    
    self.dateLabel.text  =   [NSString  timeIntervalWithDataStr:[NSString stringWithFormat:@"%lld", patientPraise.create_time]];

   self.dateLabel.sd_layout.widthIs([NSString backSizeWithText:self.dateLabel.text  andFont:font( Font13)].width).heightIs(Font13).rightSpaceToView(self.contentView,px(30)).centerYEqualToView( self.phoneLabel);
 
    superMsgViewH = CGRectGetMaxY(self.contentLabel.frame)+px(50);
    CGRect bounds = self.bounds;
    bounds.size.height = superMsgViewH;
    self.bounds=bounds;

}

@end
