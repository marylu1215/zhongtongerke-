//
//  SVideoHeaderView.h
//  ZhongTongErKe
//
//  Created by khj on 2017/5/30.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ReVideo.h"
#import "VideoPlayView.h"

@interface SVideoHeaderView : UIView

@property (nonatomic ,strong) NSArray  *videoArray;

@property (nonatomic ,strong) VideoPlayView *playView;

@property (nonatomic ,copy) void (^clickViewBlock)(UIButton *btn);

-(id)initWithFrame:(CGRect)frame VideoArray:(NSArray *)videoArray;

@end
