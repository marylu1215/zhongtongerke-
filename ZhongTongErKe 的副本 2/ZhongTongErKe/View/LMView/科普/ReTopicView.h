//
//  ReTopicView.h
//  ZhongTongErKe
//
//  Created by khj on 2017/6/27.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Video.h"
#import "VideoPlayView.h"

@interface ReTopicView : UIView

@property (nonatomic ,strong) Video *video;
@property (nonatomic ,strong) VideoPlayView *videoPlayView;
@end
