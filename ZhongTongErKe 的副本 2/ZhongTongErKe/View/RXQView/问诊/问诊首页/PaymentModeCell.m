//
//  PaymentModeCell.m
//  ZhongTongErKe
//
//  Created by khj on 2017/7/7.
//  Copyright © 2017年 Claf. All rights reserved.
//

#define  PaymentIdentifier @"PaymentCellCellIdentifier"

#import "PaymentModeCell.h"

@interface PaymentModeCell ()

@property (nonatomic ,strong) UIImageView *paycImageView;
@property (nonatomic ,strong) UILabel *payLabel;
@property (nonatomic ,strong) UILabel *tipLabel;
@property (nonatomic ,strong) UIImageView *lineImageView;
@end

@implementation PaymentModeCell

+(instancetype)cellWithTableView:(UITableView *)tableView{
    
    PaymentModeCell *cell = [tableView dequeueReusableCellWithIdentifier:PaymentIdentifier];
    if (!cell) {
        cell = [[PaymentModeCell  alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:  PaymentIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}


- (void)configUI{
    
    [super configUI];
    
    self.paycImageView = [[UIImageView alloc]init];
    [self.contentView addSubview:self.paycImageView];
    
    self.payLabel = [UILabel addLabelWithText:@"" AndFont:Font15 AndAlpha:1.0 AndColor:TITLE_COLOR];
    [self.contentView addSubview:self.payLabel];
    
    self.tipLabel = [UILabel addLabelWithText:@"" AndFont:Font13 AndAlpha:1.0 AndColor:REMARK_COLOR];
    [self.contentView addSubview: self.tipLabel];
    
    self.chooseButton = [UIButton addBtnImage:unchoose_fwgmImageName WithTarget:self action:@selector(chooseAction:)];
    [self.contentView addSubview:self.chooseButton];
    
    self.lineImageView = [UIImageView createImageViewWithImageName:nil color:sepBgColor];
    [self.contentView addSubview:self.lineImageView];
    
    
    
}
- (void)configFrame{
    
    [super configFrame];
    
    self.lineImageView.sd_layout.widthIs(kScreenWidth).heightIs(px(2)).bottomSpaceToView(self.contentView,0);
    
}

-(void)chooseAction:(UIButton *)button
{
    
    if ([self.delegate respondsToSelector:@selector(handleSelectedButtonActionWithSelectedIndexPath:)]) {
        
        [self.delegate handleSelectedButtonActionWithSelectedIndexPath:self.selectedIndexPath];
    }

}

-(void)setPayModel:(PayModel *)payModel
{
    _payModel = payModel;
    
   
    self.paycImageView.image = [UIImage imageNamed:payModel.imageName];
    self.paycImageView.sd_layout.widthIs(self.paycImageView.image.size.width).heightIs(self.paycImageView.image.size.height).leftSpaceToView(self.contentView,px(30)).centerYEqualToView(self.contentView);
    
    self.payLabel.text = payModel.title;
   self.payLabel.sd_layout.leftSpaceToView(self.paycImageView,px(10)).topSpaceToView(self.contentView,px(10)).heightIs(Font15).rightSpaceToView(self.contentView,px(30));
    
    self.tipLabel.text = payModel.subTitle;
    self.tipLabel.sd_layout.leftSpaceToView(self.paycImageView,px(10)).bottomSpaceToView(self.contentView,px(10)).heightIs(Font13).rightSpaceToView(self.contentView,px(30));
    
    self.chooseButton.sd_layout.widthIs(self.chooseButton.imageView.image.size.width).heightIs(self.chooseButton.imageView.image.size.height).centerYEqualToView(self.contentView).rightSpaceToView(self.contentView,px(30));
}
@end
