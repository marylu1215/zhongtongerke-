//
//  HotPointSectionView.h
//  ZhongTongErKe
//
//  Created by khj on 2017/5/31.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SectionHeaderView.h"
#import "VideoPlayView.h"
#import "Video.h"

@interface HotPointSectionView : UIView

@property (nonatomic ,strong) SectionHeaderView *headerView;

@property (nonatomic ,strong) Video *video;

@property (nonatomic ,strong) VideoPlayView *videoPlayView;
@end
