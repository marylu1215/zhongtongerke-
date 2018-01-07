//
//  SSHotKPTableCell.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/3.
//  Copyright © 2017年 Claf. All rights reserved.
//

#define HotKPCellIdentifier @"HotKPCellIdentifier"

#import "SSHotKPTableCell.h"
#import "SSTableCellButton.h"

@interface SSHotKPTableCell ()

@property(nonatomic,strong) UIImageView *bottomLineView;
@property (nonatomic,strong) UIImageView *headImageView;
@property (nonatomic,strong) UILabel *headLabel;
@property (nonatomic,strong) UILabel *tagLabel;
@property (nonatomic,strong) SSTableCellButton *checkButton;
@property (nonatomic,strong) SSTableCellButton *collectButton;
@property (nonatomic,strong) SSTableCellButton *timeButton;
@property (nonatomic,strong) UIView *midView;

@end

@implementation SSHotKPTableCell


+(instancetype)cellWithTableView:(UITableView *)tableView
{
    
    SSHotKPTableCell *hotKPTablecell = [tableView dequeueReusableCellWithIdentifier:HotKPCellIdentifier];
    if (hotKPTablecell == nil) {
        
       hotKPTablecell = [[SSHotKPTableCell   alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:HotKPCellIdentifier];
    }
    return hotKPTablecell;
    
}


- (void)configUI
{
    
    
    self.headImageView = [[UIImageView alloc]init];
    [self.contentView addSubview:self.headImageView];
    
    self.headLabel = [UILabel addLabelWithText:@"" AndFont:Font13 AndAlpha:1.0 AndColor:TITLE_COLOR];
    [self.contentView addSubview:self.headLabel];
    
    self.tagLabel = [UILabel addLabelWithText:@"" AndFont:Font9 AndAlpha:1.0 AndColor:REMARK_COLOR];
    [self.contentView addSubview:self.tagLabel];
    
  
    
    self.checkButton = [[SSTableCellButton alloc]initWithImageName:kp_eyeImageName];
    [self.contentView addSubview:self.checkButton];
    
    self.midView = [[UIView alloc]init];
    [self.contentView addSubview:self.midView];
    
    self.collectButton = [[SSTableCellButton alloc]initWithImageName:kp_CollectionImageName];
    [self.midView addSubview:self.collectButton];
    
    
    self.timeButton = [[SSTableCellButton alloc]initWithImageName:kp_timeImageName];
    [ self.contentView addSubview:self.timeButton];

    self.bottomLineView = [UIImageView createImageViewWithImageName:nil color:sepBgColor];
    [self.contentView addSubview:self.bottomLineView];

}
- (void)configFrame
{
    
    self.headImageView.sd_layout.widthIs(px(138)).heightIs(px(108)).leftSpaceToView(self.contentView,px(12)).centerYEqualToView(self.contentView);
    self.headLabel.sd_layout.leftSpaceToView( self.headImageView,px(12)).topSpaceToView(self.contentView,px(30)).rightSpaceToView(self.contentView,0).heightIs(Font13);
    
    
    self.bottomLineView.sd_layout.widthIs(kScreenWidth).heightIs(px(2)).bottomSpaceToView(self.contentView,0);
}

-(void)setPopScience:(PopScience *)popScience

{
   
    [self.headImageView sd_setImageWithURL:[NSURL URLWithString:[popScience.path containsString:@"http"]?popScience.path:[NSString stringWithFormat:@"%@%@",ImageBaseURL,popScience.path]]];
    
    self.headLabel.text = popScience.title;
    
    self.tagLabel.text = popScience.des;
    self.tagLabel.sd_layout.widthIs([NSString backSizeWithText:self.tagLabel.text andFont:font(Font9)].width).heightIs(Font9).bottomSpaceToView(self.contentView,px(30)).leftSpaceToView(self.headImageView,px(12));
    
    self.checkButton.headlabel.text = [NSString stringWithFormat:@"%@人查看",popScience.view];;
    self.checkButton.sd_layout.widthIs([NSString backSizeWithText: self.checkButton.headlabel.text andFont:font(Font9)].width+px(10)+ self.checkButton.headImageView.image.size.width).heightIs(self.checkButton.imageView.image.size.height).leftSpaceToView(self.tagLabel,px(30)*kScreenWidthScale).centerYEqualToView(self.tagLabel);
    
    
    NSString *createTimeStr = [NSString stringWithFormat:@"%lld",popScience.create_time];
    
    if (createTimeStr.length < 13) {
        popScience.create_time = popScience.create_time * 1000;
    }
    
    
    NSDate *date = [NSDate timeStringToDate:[NSString timeIntervalWithDataStr:[NSString stringWithFormat:@"%lld",popScience.create_time]]];
    
    
    self.timeButton.headlabel.text = [NSString stringWithFormat:@"%@更新",[date dateToRequiredString]];
    self.timeButton.sd_layout.widthIs([NSString backSizeWithText: self.timeButton.headlabel.text andFont:font(Font9)].width+px(10)+self.timeButton.headImageView.image.size.width).heightIs(Font9).centerYEqualToView(self.checkButton).rightSpaceToView(self.contentView,0);
    
    self.midView.sd_layout.leftSpaceToView(self.checkButton,0).rightSpaceToView(self.timeButton,0).heightIs(px(30)).centerYEqualToView(self.checkButton);
    
    
    self.collectButton.headlabel.text = [NSString stringWithFormat:@"%@人收藏",popScience.bookmark];
    self.collectButton.sd_layout.widthIs([NSString backSizeWithText:  self.collectButton.headlabel.text andFont:font(Font9)].width+px(10)+self.collectButton.headImageView.image.size.width).heightIs( self.collectButton.imageView.image.size.height).centerXEqualToView( self.midView).centerYEqualToView(self.midView);
    
}

@end
