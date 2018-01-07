//
//  SSMyColletionAticleCell.h
//  ZhongTongErKe
//
//  Created by Claf on 17/5/29.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Article.h"
#import "Video.h"
#import "XFBaseLineTableCell.h"
@interface SSMyColletionAticleCell :XFBaseLineTableCell

@property (nonatomic ,strong) Article *article;
@property (nonatomic ,strong) Video *video;

+(instancetype)cellWithTableView:(UITableView *)tableView;

@property (nonatomic, copy) void (^playVideoBlock)(UIButton *btn);

@end
