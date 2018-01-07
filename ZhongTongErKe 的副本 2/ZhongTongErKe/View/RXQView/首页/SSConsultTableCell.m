//
//  SSConsultTableCell.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/2.
//  Copyright © 2017年 Claf. All rights reserved.
//
#define ConsultCellIdentifier @"ConsultCellIdentifier"

#import "SSConsultTableCell.h"

@interface SSConsultTableCell ()

@property (nonatomic,strong) UILabel *myLabel;
@property (nonatomic,strong) UIImageView *headImageView;
@property (nonatomic,strong) UILabel *listenLabel;
@property (nonatomic,strong) UIImageView *praiseImageView;
@property (nonatomic,strong) UILabel *praiseLabel;
@property (nonatomic,strong) UIImageView *clockImageView;
@property (nonatomic,strong) UILabel *clockLabel;
@property(nonatomic,strong)  UIView *bottomLineView;

@end

@implementation SSConsultTableCell


+(instancetype)cellWithTableView:(UITableView *)tableView
{
    
    SSConsultTableCell *cell = [tableView dequeueReusableCellWithIdentifier:ConsultCellIdentifier];
    if (cell == nil) {
        
        cell = [[SSConsultTableCell   alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ConsultCellIdentifier];
    }
    return cell;
    
}



- (void)configUI{
    
    [super configUI];
    
    self.myLabel = [UILabel addLabelWithText:@"" AndFont:Font13 AndAlpha:1.0 AndColor:TITLE_COLOR];
    [self.contentView addSubview:self.myLabel];
    
    self.headImageView =[[UIImageView alloc]init];
    [self.contentView addSubview:self.headImageView];
    self.headImageView.layer.cornerRadius =px(60)/2;
    self.headImageView.clipsToBounds = YES;
    
    self.listenButton = [UIButton addBtnImage:index_listenImageName WithTarget:self action:@selector(listenAction:)];
    [self.contentView addSubview: self.listenButton];
    
    self.listenLabel = [UILabel addLabelWithText:@"一元偷偷听" AndFont:Font9 AndAlpha:1.0 AndColor:c255255255];
    [self.listenButton addSubview:self.listenLabel];
    
    self.praiseImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:index_goodImageName]];
    [self.contentView addSubview:self.praiseImageView];
    
    self.praiseLabel = [UILabel addLabelWithText:@"" AndFont:Font9 AndAlpha:1.0 AndColor:TITLE_COLOR];
    [self.contentView addSubview:self.praiseLabel];
    
    self.clockImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:index_timeImageName]];
    [self.contentView addSubview:self.clockImageView];
    
    self.clockLabel = [UILabel addLabelWithText:@"" AndFont:Font9 AndAlpha:1.0 AndColor:TITLE_COLOR];
    [self.contentView addSubview:self.clockLabel];
    
    
}
- (void)configFrame{
   
    self.myLabel.sd_layout.leftSpaceToView(self.contentView,px(16)).topSpaceToView(self.contentView,px(18)).rightSpaceToView(self.contentView,0).heightIs(Font13);
    
    self.headImageView.sd_layout.widthIs(px(60)).heightIs(px(60)).leftSpaceToView(self.contentView,px(26)).topSpaceToView(self.myLabel,px(16));
    
    self.listenButton.sd_layout.widthIs(self.listenButton.imageView.image.size.width).heightIs(self.listenButton.imageView.image.size.height).leftSpaceToView( self.headImageView,px(30)).centerYEqualToView(self.headImageView);
    
    self.listenLabel.sd_layout.leftSpaceToView(self.listenButton,px(30)).rightSpaceToView(self.listenButton,0).heightIs(Font9).centerYEqualToView(self.listenButton);
    
}

-(void)setExConsult:(ExConsult *)exConsult
{
    _exConsult = exConsult;
    
    self.myLabel.text = exConsult.content;
    
    [self.headImageView sd_setImageWithURL:[NSURL URLWithString: [ exConsult.head containsString:@"http"]? exConsult.head:[NSString stringWithFormat:@"%@%@",ImageBaseURL, exConsult.head]] placeholderImage:[UIImage imageNamed:@"1"]];
    
    NSString *createTimeStr = [NSString stringWithFormat:@"%lld",exConsult.create_time];
    
    if (createTimeStr.length < 13) {
       exConsult.create_time = exConsult.create_time * 1000;
    }
    
    
    NSDate *date = [NSDate timeStringToDate:[NSString timeIntervalWithDataStr:[NSString stringWithFormat:@"%lld",exConsult.create_time]]];
    self.clockLabel.text = [NSString stringWithFormat:@"%@更新",[date dateToRequiredString]];
    
    self.clockLabel.sd_layout.widthIs([NSString backSizeWithText: self.clockLabel.text andFont:font(Font9)].width).heightIs(Font9).rightSpaceToView(self.contentView,px(30)).topSpaceToView(self.contentView,px(80));
    
    self.clockImageView.sd_layout.widthIs(self.clockImageView.image.size.width).heightIs(self.clockImageView.image.size.height).centerYEqualToView(self.clockLabel).rightSpaceToView(self.clockLabel,px(10));
    
    self.praiseLabel.text = exConsult.view;
    self.praiseLabel.sd_layout.widthIs([NSString backSizeWithText: self.praiseLabel.text andFont:font(Font9)].width).heightIs(Font9).rightSpaceToView(self.clockImageView,px(30)).centerYEqualToView(self.clockLabel);
    
    self.praiseImageView.sd_layout.widthIs(self.praiseImageView.image.size.width).heightIs(self.praiseImageView.image.size.height).rightSpaceToView(self.praiseLabel,px(10)).centerYEqualToView(self.clockLabel);
}



-(void)listenAction:(UIButton *)btn
{
 
    if (self.listenBlock) {
        
        self.listenBlock(btn);
    }

}
@end
