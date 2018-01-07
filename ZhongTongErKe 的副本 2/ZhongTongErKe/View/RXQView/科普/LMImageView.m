//
//  LMImageView.m
//  ZhongTongErKe
//
//  Created by khj on 2017/5/30.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "LMImageView.h"

@interface LMImageView ()

@property (nonatomic ,strong) UIButton *playBtn;

@property (nonatomic ,strong) UIImageView *bottomImageView;



@end
@implementation LMImageView

-(id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.userInteractionEnabled = YES;
        self.playBtn = [UIButton addBtnImage:playSmallImageName WithTarget:self action:@selector(playAction:)];
        [self addSubview: self.playBtn];
    }
    return self;
}

-(void)playAction:(UIButton *)btn
{
    
}
@end
