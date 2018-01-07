//
//  SSCouponTableViewCell.m
//  ZhongTongErKe
//
//  Created by khj on 2017/5/27.
//  Copyright © 2017年 Claf. All rights reserved.
//

#define SSCouponTableViewCellIdentifier @"SSCouponTableViewCell"

#import "SSCouponTableViewCell.h"

@interface SSCouponTableViewCell ()
@property (nonatomic ,strong) UIImageView  *outImageView;
@property (nonatomic ,strong) UIImageView *scBgView;
@property (nonatomic ,strong ) UILabel *monLabel;
@property (nonatomic ,strong)  UILabel *infoLabel;
@property (nonatomic ,strong)  UILabel *typeLabel;
@property (nonatomic ,strong)  UILabel *dateLabel;
//** 未使用  已使用  已过期 */
@property (nonatomic ,strong)  UIButton *useBtn;

@end
@implementation SSCouponTableViewCell
+(instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *ID = SSCouponTableViewCellIdentifier;
    SSCouponTableViewCell  *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[SSCouponTableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:ID];
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
-(void)prepareUI{
    
    self.outImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:bgGaryticketImageName]];
    [self.contentView addSubview:self.outImageView];
    
    self.scBgView = [[UIImageView alloc]init];
    [self.contentView addSubview:self.scBgView];
    
    self.monLabel = [UILabel addLabelWithText:@"" AndFont:15 AndAlpha:1.0 AndColor:TITLE_COLOR];
    [ self.scBgView addSubview:self.monLabel];
    
    self.infoLabel = [UILabel addLabelWithText:@"" AndFont:12 AndAlpha:1.0 AndColor:TITLE_COLOR];
    [ self.scBgView addSubview:self.infoLabel];
    
    self.typeLabel = [UILabel addLabelWithText:@"" AndFont:15 AndAlpha:1.0 AndColor:REMARK_COLOR];
    [self.contentView addSubview: self.typeLabel];
    
    self.dateLabel = [UILabel addLabelWithText:@"" AndFont:12 AndAlpha:1.0 AndColor:cGrayWord];
    [self.contentView addSubview:self.dateLabel];
    
   
    self.useBtn = [UIButton addBtnImage:@"" WithTarget:self action:@selector(useAction:)];
    [self.contentView addSubview:self.useBtn];
    
}

- (void)configueFrame
{
    self.outImageView.sd_layout.rightSpaceToView(self.contentView,0).leftSpaceToView(self.contentView,0).topSpaceToView(self.contentView,0).bottomSpaceToView(self.contentView,0);
}
-(void)useAction:(UIButton *)btn
{
    if ([self.delegate respondsToSelector:@selector(SSCouponTableViewCellDelegate:WithBtn:)]) {
        
        [self.delegate SSCouponTableViewCellDelegate:self WithBtn:btn];
    }
}


-(void)setScoupon:(Scoupon *)scoupon
{
    _scoupon = scoupon;
    if (scoupon.scouponType == 0) {
        if ([scoupon.type isEqualToString:@"问诊优惠券"]) {
            
            self.scBgView.image = [UIImage imageNamed:bgTicketImageName];
        }
        else
        {
             self.scBgView.image = [UIImage imageNamed:bgTicketImageName];
        }
       
    }
    else
    {
        self.scBgView.image = [UIImage imageNamed:usedImageName];
    }
    
    self.scBgView.sd_layout.widthIs(self.scBgView.image.size.width).heightIs(self.scBgView.image.size.height).centerYEqualToView(self.contentView).leftSpaceToView(self.contentView, LMargin);
    
    self.monLabel.text = scoupon.price;
    self.monLabel.sd_layout.widthIs([NSString backSizeWithText:self.monLabel.text andFont:font(15)].width).heightIs([NSString backSizeWithText:self.monLabel.text andFont:font(15)].height).leftSpaceToView(self.scBgView,px(20)).topSpaceToView(self.scBgView,px(30));
    
    self.infoLabel.text = scoupon.info;
    self.infoLabel.sd_layout.widthIs([NSString backSizeWithText: self.infoLabel.text andFont:font(12)].width).heightIs([NSString backSizeWithText: self.infoLabel.text andFont:font(12)].height).leftSpaceToView(self.scBgView,px(20)).bottomSpaceToView(self.scBgView,px(30));
    
  
    
    self.typeLabel.text = scoupon.type;
    self.typeLabel.sd_layout.widthIs([NSString backSizeWithText: self.typeLabel.text andFont:font(15)].width).heightIs([NSString backSizeWithText: self.typeLabel.text andFont:font(15)].height).leftSpaceToView(self.contentView,px(238)).topSpaceToView(self.contentView,px(30));
    
    self.dateLabel.text = scoupon.date;
    self.dateLabel.sd_layout.widthIs([NSString backSizeWithText: self.dateLabel.text andFont:font(12)].width).heightIs([NSString backSizeWithText: self.dateLabel.text andFont:font(12)].height).leftSpaceToView(self.contentView,px(238)).topSpaceToView(self.typeLabel,px(30));
    
    
   
    if (scoupon.scouponType == CouponInquiryType) {
        
        [self.useBtn setImage:[UIImage imageNamed:useIconImageName] forState:UIControlStateNormal];
        self.useBtn.hidden = NO;
    }
    
   else if (scoupon.scouponType == CouponOverdue) {
        [self.useBtn setImage:[UIImage imageNamed:outDateImageName] forState:UIControlStateNormal];
        self.useBtn.hidden = NO;
    }
    
    else
    {
         self.useBtn.hidden = YES;
    }
    
    self.useBtn.sd_layout.widthIs(self.useBtn.imageView.image.size.width).heightIs(self.useBtn.imageView.image.size.height).rightSpaceToView(self.contentView,px(40)).centerYEqualToView(self.contentView);
}



@end
