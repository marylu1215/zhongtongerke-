//
//  VideoListTableCell.m
//  ZhongTongErKe
//
//  Created by khj on 2017/7/12.
//  Copyright © 2017年 Claf. All rights reserved.
//

#define VideoListCellIdentifier @"VideoListCellIdentifier"

#import "VideoListTableCell.h"
#import "VideoPlayView.h"

@interface VideoListTableCell ()

@property (nonatomic ,strong) UIImageView *headImageView;
@property (nonatomic ,strong) UIImageView *seeImageView;
@property (nonatomic ,strong) UILabel *seenumLabel;
@property (nonatomic ,strong) UILabel *collectnumLabel;


@end

@implementation VideoListTableCell

+(instancetype)cellWithTableView:(UITableView *)tableView{

  VideoListTableCell  *cell = [tableView dequeueReusableCellWithIdentifier:VideoListCellIdentifier ];
    if (!cell) {
        cell = [[VideoListTableCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:VideoListCellIdentifier ];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

- (void)configUI
{
    
    self.headImageView =[[UIImageView alloc]init];
    self.headImageView.userInteractionEnabled = YES;
    [self.contentView addSubview: self.headImageView];
    
    self.playButton = [UIButton addBtnImage:playSmallImageName WithTarget:self action:@selector(playAction:)];
    [self.headImageView addSubview:self.playButton];
    
    self.collectButton = [UIButton addBtnImage:collectionImageName WithTarget:self action:@selector(collectAction:)];
    [self.headImageView addSubview:self.collectButton];
    
   
    
    self.collectnumLabel = [UILabel addLabelWithText:@"" AndFont:Font13 AndAlpha:1.0 AndColor:TITLE_COLOR];
    [self.headImageView addSubview:self.collectnumLabel];
    
    
    self.seeImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:eyeIconImageName]];
    
    [self.headImageView addSubview: self.seeImageView];
    
    self.seenumLabel = [UILabel addLabelWithText:@"" AndFont:Font13 AndAlpha:1.0 AndColor:TITLE_COLOR];
    [self.headImageView addSubview:self.seenumLabel];
    
}


-(void)playAction:(UIButton *)btn
{
    
    if (self.playVideoBlock) {
        self.playVideoBlock(btn);
    }
}
- (void)configFrame{
    
   
    self.headImageView.sd_layout.leftSpaceToView(self.contentView,0).rightSpaceToView(self.contentView,0).topSpaceToView(self.contentView,0).bottomSpaceToView(self.contentView,0);
    
    
    self.playButton.sd_layout.widthIs(self.playButton.imageView.image.size.width).heightIs(self.playButton.imageView.image.size.height).centerXEqualToView(self.headImageView).centerYEqualToView(self.headImageView);
    
   
}

-(void)setVideo:(Video *)video
{
    _video = video;
    
    [self.headImageView sd_setImageWithURL:    [NSURL URLWithString: [video.img containsString:@"http"]?video.img:[NSString stringWithFormat:@"%@%@",ImageBaseURL,video.img]]];
    
    self.collectnumLabel.text = video.collection;
    self.collectnumLabel.sd_layout.widthIs([NSString backSizeWithText:self.collectnumLabel.text andFont:font(Font13)].width).heightIs(Font13).rightSpaceToView(self.headImageView,px(20)).bottomSpaceToView(self.headImageView, px(10));
    self.collectButton.sd_layout.widthIs(self.collectButton.imageView.image.size.width).heightIs(self.collectButton.imageView.image.size.height).rightSpaceToView(self.collectnumLabel,px(10)).centerYEqualToView(self.collectnumLabel);
    
    self.seenumLabel.text = video.see;
    self.seenumLabel.sd_layout.widthIs([NSString backSizeWithText:self.seenumLabel.text andFont:font(Font13)].width).heightIs(Font13).rightSpaceToView(self.collectButton,px(20)).centerYEqualToView(self.collectnumLabel);
    self.seeImageView.sd_layout.widthIs(self.seeImageView.image.size.width).heightIs(self.seeImageView.image.size.height).rightSpaceToView(self.seenumLabel,px(10)).centerYEqualToView(self.collectnumLabel);
    
    
}

-(void)collectAction:(UIButton *)button
{
    if (self.collectBlock) {
        
        self.collectBlock(button);
        
    }
}


@end
