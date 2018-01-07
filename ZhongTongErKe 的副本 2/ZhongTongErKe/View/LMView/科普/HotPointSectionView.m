//
//  HotPointSectionView.m
//  ZhongTongErKe
//
//  Created by khj on 2017/5/31.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "HotPointSectionView.h"


@implementation HotPointSectionView

-(id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.headerView = [[SectionHeaderView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 30) LeftImagrName:homeThemeImageName Info:@"热门话题" Margin: px(30)];
        [self addSubview:self.headerView];
        
        self.videoPlayView = [[VideoPlayView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY( self.headerView.frame), kScreenWidth, px(350))];
        [self addSubview: self.videoPlayView];
    }
    return self;
}


-(void)setVideo:(Video *)video
{
    self.videoPlayView.video = video;
}

@end
