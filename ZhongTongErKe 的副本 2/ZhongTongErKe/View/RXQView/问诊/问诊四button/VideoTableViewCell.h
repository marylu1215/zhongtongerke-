//
//  VideoTableViewCell.h
//  ZhongTongErKe
//
//  Created by khj on 2017/6/12.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "XFBaseLineTableCell.h"
#import "Video.h"
#import "VideoPlayView.h"

@interface VideoTableViewCell : XFBaseLineTableCell

@property (nonatomic ,strong) Video *video ;

@property (nonatomic ,strong) VideoPlayView *videoPlayView;

+(instancetype)cellWithTableView:(UITableView *)tableView;

@end
