//
//  SSGoodsForSaleCell.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/22.
//  Copyright © 2017年 Claf. All rights reserved.
//
#define SSGoodsForSaleCellIdentifier @"SSGoodsForSaleCellIdentifier"
#import "SSGoodsForSaleCell.h"

@interface SSGoodsForSaleCell ()

@property (nonatomic,strong) UIImageView *backImageView;
//@property (nonatomic,strong) UIImageView *typeImageView;
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UILabel *priceLabel;
@property (nonatomic,strong) UILabel *contentLabel;
@property (nonatomic,strong) UILabel *descriptionLabel;

//@property (nonatomic,strong) UIView *fcImageView;
//@property (nonatomic,strong) UIView *scImageView;
//@property (nonatomic,strong) UIView *tcImageView;
//@property (nonatomic,strong) UILabel *fLabel;
//@property (nonatomic,strong) UILabel *sLabel;
//@property (nonatomic,strong) UILabel *tLabel;

@end

@implementation SSGoodsForSaleCell

+(instancetype)cellWithTableView:(UITableView *)tableView{
    
    static NSString *ID =  SSGoodsForSaleCellIdentifier;
   SSGoodsForSaleCell  *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[SSGoodsForSaleCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:ID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

-(void)configUI
{
    
    self.backImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"kxtc-first"]];
    [self.contentView addSubview: self.backImageView];

    
//    self.typeImageView = [[UIImageView alloc]init];
//    [self.backImageView  addSubview:self.typeImageView];

    self.titleLabel = [UILabel addLabelWithText:@"" AndFont:Font15*kScreenWidthScale AndAlpha:1.0 AndColor:c255255255];
    self.titleLabel.numberOfLines =0;
    [self.backImageView addSubview:self.titleLabel];
    

    self.priceLabel = [UILabel addLabelWithText:@"" AndFont:Font15*kScreenWidthScale AndAlpha:1.0 AndColor:cHBColor];
    [self.backImageView addSubview:self.priceLabel];

    self.contentLabel = [UILabel addLabelWithText:@"" AndFont:Font13*kScreenWidthScale AndAlpha:1.0 AndColor:c255255255];
    self.contentLabel.numberOfLines = 0;
    [self.backImageView addSubview:self.contentLabel];

    self.descriptionLabel = [UILabel addLabelWithText:@"" AndFont:Font13*kScreenWidthScale AndAlpha:1.0 AndColor:c255255255];
    self.descriptionLabel.numberOfLines = 0;
    [self.backImageView addSubview: self.descriptionLabel];
    

//    self.fcImageView = [[UIView alloc]init];
//    self.fcImageView.backgroundColor =cHBColor;
//    self.fcImageView.layer.cornerRadius =px(10)/2;
//    self.fcImageView.clipsToBounds = YES;
//    [self.backImageView addSubview: self.fcImageView];
//    
//    self.fLabel = [UILabel addLabelWithText:@"" AndFont:Font13*kScreenWidthScale AndAlpha:1.0 AndColor:c255255255];
//    [self.backImageView addSubview: self.fLabel];
//    
//    self.scImageView = [[UIView alloc]init];
//    self.scImageView.backgroundColor =cHBColor;
//    self.scImageView.layer.cornerRadius =px(10)/2;
//    self.scImageView.clipsToBounds = YES;
//    [self.backImageView addSubview: self.scImageView];
//    self.sLabel = [UILabel addLabelWithText:@"" AndFont:Font13*kScreenWidthScale AndAlpha:1.0 AndColor:c255255255];
//    [self.backImageView addSubview: self.sLabel];
//    
//    self.tcImageView = [[UIView alloc]init];
//    self.tcImageView.backgroundColor =cHBColor;
//    self.tcImageView.layer.cornerRadius =px(10)/2;
//    self.tcImageView.clipsToBounds = YES;
//    [self.backImageView addSubview: self.tcImageView];
//    
//    self.tLabel = [UILabel addLabelWithText:@"" AndFont:Font13*kScreenWidthScale AndAlpha:1.0 AndColor:c255255255];
//    [self.backImageView addSubview: self.tLabel];
  
    
}

-(void)configFrame
{
    self.backImageView.sd_layout.leftSpaceToView(self.contentView,px(30)).rightSpaceToView(self.contentView,px(30)).heightIs(self.backImageView.image.size.height).centerYEqualToView(self.contentView);
   
//    self.titleLabel.text = pause()
//    self.titleLabel.sd_layout.leftSpaceToView(self.backImageView,px(30)).widthIs()
//    
//    self.fLabel.sd_layout.leftSpaceToView(self.backImageView,px(60)).rightSpaceToView(self.backImageView,0).topSpaceToView(self.backImageView,px(148)).heightIs(12);
//
//   
//    self.fcImageView.sd_layout.widthIs(px(10)).heightIs(px(10)).centerYEqualToView(self.fLabel).leftSpaceToView(self.backImageView,px(30));
//    
//    
//    self.scImageView.sd_layout.widthIs(px(10)).heightIs(px(10)).topSpaceToView(self.fcImageView,px(px(30))).leftSpaceToView(self.backImageView,px(30));
//     self.sLabel.sd_layout.leftSpaceToView(self.scImageView,px(20)).rightSpaceToView(self.backImageView,0).centerYEqualToView( self.scImageView).heightIs(12);
//    
//    self.tcImageView.sd_layout.widthIs(px(10)).heightIs(px(10)).topSpaceToView(self.scImageView,px(px(30))).leftSpaceToView(self.backImageView,px(30));
//     self.tLabel.sd_layout.leftSpaceToView(self.tcImageView,px(20)).rightSpaceToView(self.backImageView,0).centerYEqualToView( self.tcImageView).heightIs(12);
}
-(void)setPackage:(Package *)package
{

//
//    [self.typeImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",ImageBaseURL,package.img]]];
    
//    self.typeImageView.sd_layout.widthIs(self.typeImageView.image.size.width).heightIs(self.typeImageView.image.size.height).leftSpaceToView(self.backImageView,px(30)).topSpaceToView(self.backImageView,px(30));

    self.titleLabel.text = package.title;
    self.titleLabel.sd_layout.widthIs([NSString backSizeWithText: self.titleLabel.text andFont:font(Font15)].width).heightIs(Font15).leftSpaceToView(self.backImageView,px(30)).topSpaceToView(self.backImageView,px(36));
    
    
    self.priceLabel.text = [NSString stringWithFormat:@"¥%@/例",package.price];
     self.priceLabel.sd_layout.widthIs([NSString backSizeWithText: self.priceLabel.text andFont:font(Font15)].width).heightIs(Font15).rightSpaceToView(self.backImageView,px(30)).centerYEqualToView(self.titleLabel);

    self.contentLabel.text = package.content;
   
    self.contentLabel.sd_layout.heightIs(Font13).rightSpaceToView(self.backImageView,px(30)).leftSpaceToView(self.backImageView,px(30)).topSpaceToView(self.titleLabel,px(30));
    
    self.descriptionLabel.text = package.des;
     self.descriptionLabel.sd_layout.heightIs(Font13).rightSpaceToView(self.backImageView,px(30)).leftSpaceToView(self.backImageView,px(30)).topSpaceToView(self.contentLabel,px(30));
    
//
//    self.fLabel.text = package.fTitle;
//    self.sLabel.text = package.sTitle;
//    self.tLabel.text = package.thTitle;
}



@end
