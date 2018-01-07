//
//  SSHotAticleTableCell.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/2.
//  Copyright © 2017年 Claf. All rights reserved.
//
#define HotAticleCellIdentifier @"HotAticledentifier"
#import "SSHotAticleTableCell.h"
#import "SSTableCellButton.h"
#import "DiffPostView.h"

@interface SSHotAticleTableCell ()


@property (nonatomic,strong) SSTableCellButton *manageButton;
@property (nonatomic,strong) SSTableCellButton *answerButton;
@property (nonatomic,strong) SSTableCellButton *timeButton;
@property (nonatomic,strong) UIImageView *bottomLineView;

@property (nonatomic,strong) DiffPostView *diffPostView;

@end

@implementation SSHotAticleTableCell


+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    SSHotAticleTableCell *cell = [tableView dequeueReusableCellWithIdentifier:HotAticleCellIdentifier];
    if (cell == nil) {
        cell = [[SSHotAticleTableCell  alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:HotAticleCellIdentifier];
    }
    
    return cell;
}


- (void)configUI
{
    [super configUI];
    
    
    self.manageButton = [[SSTableCellButton alloc]initWithImageName:@"admin"];
    [self.contentView addSubview:self.manageButton];
    
    _answerButton = [[SSTableCellButton alloc]initWithImageName:@"massage-icon"];
 
    [self.contentView addSubview:self.answerButton];
    
    _timeButton = [[SSTableCellButton alloc]initWithImageName:@"time"];

    [self.contentView addSubview:self.timeButton];
    
    self.bottomLineView = [UIImageView createImageViewWithImageName:nil color:sepBgColor];
    [self.contentView addSubview:self.bottomLineView];
}
-(void)setForum:(Forum *)forum
{
    
    _forum = forum;
    
    [self.diffPostView removeFromSuperview];
    
    self.diffPostView  = [[DiffPostView alloc]init];
    [self.contentView addSubview: self.diffPostView];
    self.diffPostView.forum = forum;
    self.diffPostView.sd_layout.widthIs(kScreenWidth).heightIs(px(30)).topSpaceToView(self.contentView,px(20));
    
    
    self.manageButton.headlabel.text = forum.publish_name;
    self.manageButton.sd_layout.widthIs([NSString backSizeWithText: self.manageButton.headlabel.text andFont:font(Font9)].width+px(10)+self.manageButton.headImageView.image.size.width).heightIs(self.manageButton.headImageView.image.size.height).leftSpaceToView(self.contentView,px(30)).bottomSpaceToView(self.contentView,px(20));
    
    
      self.answerButton.headlabel.text = [NSString stringWithFormat:@"%@人回复",forum.reply];
      self.answerButton.sd_layout.widthIs([NSString backSizeWithText: self.answerButton.headlabel.text andFont:font(Font9)].width+px(10)+self.answerButton.headImageView.image.size.width).heightIs(self.answerButton.headImageView.image.size.height).centerXEqualToView(self.contentView).centerYEqualToView(self.manageButton);
    
    NSString *createTimeStr = [NSString stringWithFormat:@"%lld",forum.upload_time];
    
    if (createTimeStr.length < 13) {
        forum.upload_time = forum.upload_time * 1000;
    }
    
    
    NSDate *date = [NSDate timeStringToDate:[NSString timeIntervalWithDataStr:[NSString stringWithFormat:@"%lld",forum.upload_time]]];

    
    self.timeButton.headlabel.text = [NSString stringWithFormat:@"%@更新",[date dateToRequiredString]];
    self.timeButton.sd_layout.widthIs([NSString backSizeWithText: self.timeButton.headlabel.text andFont:font(Font9)].width+px(10)+self.timeButton.headImageView.image.size.width).heightIs(self.timeButton.headImageView.image.size.height).centerYEqualToView(self.manageButton).rightSpaceToView(self.contentView,px(30));
    
    self.bottomLineView.sd_layout.widthIs(kScreenWidth).heightIs(px(2)).bottomSpaceToView(self.contentView,0);
}


@end
