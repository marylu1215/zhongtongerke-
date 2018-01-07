//
//  SSAnwserTableViewCell.m
//  ZhongTongErKe
//
//  Created by khj on 2017/5/28.
//  Copyright © 2017年 Claf. All rights reserved.
//
#define SSAnwserTableViewCellIdentifier @"SSAnwserTableViewCellIdentifier"

#import "SSAnwserTableViewCell.h"

@interface SSAnwserTableViewCell ()

@property (nonatomic ,strong) UIImageView *dHeadImageView;
@property (nonatomic ,strong) UILabel *dNameLabel;
@property (nonatomic ,strong) UILabel *priceLabel;
@property (nonatomic ,strong) UILabel *stateLabel;
@property (nonatomic ,strong) UILabel *desLabel;
@property (nonatomic ,strong) UILabel *dateLabel;
@property (nonatomic ,strong) UILabel *numLabel;

@end
@implementation SSAnwserTableViewCell

+(instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *ID = SSAnwserTableViewCellIdentifier;
    SSAnwserTableViewCell  *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[SSAnwserTableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:ID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

-(void)configUI
{
    
    self.dHeadImageView = [[UIImageView alloc]init];
    self.dHeadImageView.layer.cornerRadius = px(80)/2.0;
    self.dHeadImageView.layer.borderColor =  cHBColor.CGColor;
    self.dHeadImageView.layer.borderWidth = px(2);
    self.dHeadImageView.clipsToBounds = YES;
    [self.contentView addSubview:self.dHeadImageView];
    
    self.dNameLabel = [UILabel addLabelWithText:@"" AndFont:15 AndAlpha:1.0 AndColor:TITLE_COLOR];
    [self.contentView addSubview:self.dNameLabel];
    
    self.priceLabel = [UILabel addLabelWithText:@"" AndFont:12 AndAlpha:1.0 AndColor:S_COLOR];
    [self.contentView addSubview: self.priceLabel];
    
    self.stateLabel = [UILabel addLabelWithText:@"" AndFont:12 AndAlpha:1.0 AndColor:cGrayWord];
    [self.contentView addSubview:self.stateLabel];
    
    self.desLabel = [[UILabel alloc]init];
    self.desLabel.textColor= TITLE_COLOR;
    self.desLabel.font = font(12);
    self.desLabel.numberOfLines = 0;
    [self.contentView addSubview: self.desLabel];
    
    self.dateLabel = [UILabel addLabelWithText:@"" AndFont:12 AndAlpha:1.0 AndColor:cGrayWord];
    [self.contentView addSubview:self.dateLabel];
    
    self.numLabel = [UILabel addLabelWithText:@"" AndFont:12 AndAlpha:1.0 AndColor:cGrayWord];
    [self.contentView addSubview:self.numLabel];
    
}
-(void)configFrame
{
    self.dHeadImageView.sd_layout.widthIs(px(80)).heightIs(px(80)).topSpaceToView(self.contentView,px(10)).leftSpaceToView(self.contentView,px(30));
    
}

-(void)setAnswer:(Answer *)answer
{
    
    _answer = answer;
    
    [self.dHeadImageView sd_setImageWithURL:[NSURL URLWithString:[answer.doctor_head containsString:@"http"]?answer.doctor_head:[NSString stringWithFormat:@"%@%@",ImageBaseURL,answer.doctor_head]]];
    
    self.dNameLabel.text = answer.doctor_name;
    self.dNameLabel.sd_layout.widthIs([NSString backSizeWithText:self.dNameLabel.text andFont:font(15)].width).heightIs(15).leftSpaceToView(self.dHeadImageView,px(30)).centerYEqualToView(self.dHeadImageView)
    ;
    if ([answer.type isEqualToString:@"-1"]) {
        self.stateLabel.text = @"已撤回";
    }
    else if ([answer.type isEqualToString:@"0"])
    {
        self.stateLabel.text = @"待回答";
    }
    else
    {
         self.stateLabel.text = @"已回答";
    }
    self.stateLabel.sd_layout.widthIs([NSString backSizeWithText:self.stateLabel.text andFont:font(12)].width).heightIs(12).rightSpaceToView(self.contentView,px(30)).centerYEqualToView(self.dHeadImageView)
    ;
    
    
    self.priceLabel.text = [NSString stringWithFormat:@"Y %@",answer.price];
    self.priceLabel.sd_layout.widthIs([NSString backSizeWithText: self.priceLabel.text andFont:font(12)].width).heightIs(12).rightSpaceToView( self.stateLabel,px(10)).centerYEqualToView(self.dHeadImageView)
    ;
    
    CGFloat superMsgViewH = 0;
    self.desLabel.text = answer.answer;
    NSDictionary *descDic = @{NSFontAttributeName:font(12)};
    CGRect descFrame =  [self.desLabel.text textRectWithSize:CGSizeMake(kScreenWidth - px(170), MAXFLOAT) attributes:descDic];
    
    descFrame.origin.x = px(120);
    descFrame.origin.y = px(90);
    self.desLabel.frame = descFrame;
    
    
    NSString *over_timeStr = [NSString stringWithFormat:@"%lld",answer.over_time];
    
    if (over_timeStr.length < 13) {
        answer.over_time = answer.over_time * 1000;
    }
    
    self.dateLabel.text = [NSString timeIntervalWithDataStr:[NSString stringWithFormat:@"%lld",answer.over_time]];
    
    self.dateLabel.sd_layout.widthIs([NSString backSizeWithText: self.dateLabel.text andFont:font(12)].width).heightIs(12).leftSpaceToView(self.contentView,px(30)).topSpaceToView(self.desLabel,px(20));
    
    if ([answer.type isEqualToString:@"0"]) {
        self.numLabel.hidden = YES;
    }
    else
    {
        
        self.numLabel.hidden = NO;
        self.numLabel.text = [NSString stringWithFormat:@"偷偷听%@",answer.num];
       self.numLabel.sd_layout.widthIs([NSString backSizeWithText: self.numLabel.text andFont:font(12)].width).heightIs(12).rightSpaceToView(self.contentView,px(30)).centerYEqualToView(self.dateLabel);
    }
    
    superMsgViewH = CGRectGetMaxY(self.desLabel.frame) +px(60);
    CGRect bounds = self.bounds;
    bounds.size.height = superMsgViewH;
    self.bounds=bounds;
}
@end
