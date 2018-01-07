//
//  SSInteScoreTableViewCell.m
//  ZhongTongErKe
//
//  Created by khj on 2017/5/28.
//  Copyright © 2017年 Claf. All rights reserved.
//

#define SSISTableViewCellIdentifier @"SSInteScoreTableViewCellIdentifier"

#import "SSInteScoreTableViewCell.h"

@interface SSInteScoreTableViewCell ()

@property (nonatomic ,strong) UIImageView *typeImageView;

@property (nonatomic ,strong) UILabel *typeLabel;

@property (nonatomic ,strong) UILabel *scoreLabel;

@property (nonatomic ,strong) UIImageView *bottomImageView;


@end
@implementation SSInteScoreTableViewCell

+(instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *ID = SSISTableViewCellIdentifier;
   SSInteScoreTableViewCell  *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[SSInteScoreTableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:ID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}


-(void)configUI{
  
    self.typeImageView = [[UIImageView alloc]init];
    [self.contentView addSubview:self.typeImageView];
    
    self.typeLabel = [UILabel addLabelWithText:@"" AndFont:12 AndAlpha:1.0 AndColor:TITLE_COLOR];
    [self.contentView addSubview:self.typeLabel];
    
    self.scoreLabel = [UILabel addLabelWithText:@"" AndFont:12 AndAlpha:1.0 AndColor:cGrayWord];
    [self.contentView addSubview:self.scoreLabel];
    
    self.bottomImageView = [UIImageView createImageViewWithImageName:nil color:sepBgColor];
    [self.contentView addSubview:self.bottomImageView];
    
}

-(void)configFrame
{
    self.bottomImageView.sd_layout.widthIs(kScreenWidth).heightIs(px(2)).bottomSpaceToView(self.contentView,0);
}
-(void)setIntegral:(Integral *)integral
{
    _integral = integral;
    if ([integral.task_name isEqualToString:@"快速问诊积分消费"]) {
        self.typeImageView.image = [UIImage imageNamed:expendGaryImageName];
    }
    else
    {
        self.typeImageView.image = [UIImage imageNamed:getBlueImageName];
    }
    
    self.typeImageView.sd_layout.widthIs(self.typeImageView.image.size.width).heightIs(self.typeImageView.image.size.height).centerYEqualToView(self.contentView).leftSpaceToView(self.contentView,px(20));
    
    
    self.typeLabel.text = integral.task_name;
    self.typeLabel.sd_layout.widthIs([NSString backSizeWithText: self.typeLabel.text  andFont:font(12)].width).heightIs(12).leftSpaceToView(self.typeImageView,px(20)).centerYEqualToView(self.contentView);
    

    self.scoreLabel.text = [NSString stringWithFormat:@" %@分",integral.jifen_mingxi];
     self.scoreLabel.sd_layout.widthIs([NSString backSizeWithText: self.scoreLabel.text  andFont:font(12)].width).heightIs(12).rightSpaceToView(self.contentView,px(20)).centerYEqualToView(self.contentView);
}



@end
