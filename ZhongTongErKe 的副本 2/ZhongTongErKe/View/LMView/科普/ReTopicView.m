//
//  ReTopicView.m
//  ZhongTongErKe
//
//  Created by khj on 2017/6/27.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "ReTopicView.h"
#import "SectionHeaderView.h"


@implementation ReTopicView

-(id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
    self.videoPlayView = [[VideoPlayView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, px(350))];
    [self addSubview:self.videoPlayView];
    
    UIImageView *sepView = [UIImageView createImageViewWithImageName:nil color:sepBgColor];
        [self addSubview:sepView];
        
        sepView.sd_layout.widthIs(kScreenWidth).heightIs(px(16)).topSpaceToView( self.videoPlayView,0);
        
    SectionHeaderView  *view = [[SectionHeaderView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY( self.videoPlayView.frame)+px(16), kScreenWidth, px(64)) LeftImagrName:homeThemeImageName Info:@"推荐话题" Margin: px(30)];
        [self addSubview:view];

    }
    
    return self;
}

-(void)setVideo:(Video *)video
{
    _video = video;
    self.videoPlayView.video = video;
}

@end
