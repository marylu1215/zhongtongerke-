//
//  VideoTableViewCell.m
//  ZhongTongErKe
//
//  Created by khj on 2017/6/12.
//  Copyright © 2017年 Claf. All rights reserved.
//
#define VideoTableViewCellIdentifier @"VideoTableViewCellIdentifier"

#import "VideoTableViewCell.h"

@implementation VideoTableViewCell

+(instancetype)cellWithTableView:(UITableView *)tableView{
    
   VideoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:VideoTableViewCellIdentifier];
    if (!cell) {
        cell = [[VideoTableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:VideoTableViewCellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.videoPlayView = [[VideoPlayView alloc]init];
    
        [self.contentView addSubview:self.videoPlayView];
        self.videoPlayView.sd_layout.widthIs(kScreenWidth).topSpaceToView(self.contentView,0).bottomSpaceToView(self.contentView,0);
        
    }
    return self;
}

-(void)setVideo:(Video *)video
{
    _video = video;
    
    self.videoPlayView.video = video;
}

@end
