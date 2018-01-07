//
//  VideoPlayView.h
//  ZhongTongErKe
//
//  Created by khj on 2017/5/30.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Video.h"

@interface VideoPlayView : UIView

@property (nonatomic ,strong) UIImageView *videoImageView;
@property (nonatomic ,strong) Video *video;
@property (nonatomic ,strong) UIButton *playBtn;

//@property(nonatomic ,strong)  UILabel *infoLabel;
//@property (nonatomic ,strong) UILabel *numLabel;

@end
