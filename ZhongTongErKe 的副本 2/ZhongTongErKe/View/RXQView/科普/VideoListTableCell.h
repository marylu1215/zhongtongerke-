//
//  VideoListTableCell.h
//  ZhongTongErKe
//
//  Created by khj on 2017/7/12.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "XFBaseLineTableCell.h"
#import "Video.h"

@interface VideoListTableCell : XFBaseLineTableCell

@property (nonatomic ,strong) Video *video;
@property (nonatomic ,strong) UIButton *playButton;
@property (nonatomic,strong) UIButton *collectButton;
@property (nonatomic, copy) void (^playVideoBlock)(UIButton *btn);
@property (nonatomic, copy) void (^collectBlock)(UIButton *btn);

+(instancetype)cellWithTableView:(UITableView *)tableView;




@end
