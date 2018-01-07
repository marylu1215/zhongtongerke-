//
//  VideoPlayView.m
//  ZhongTongErKe
//
//  Created by khj on 2017/5/30.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "VideoPlayView.h"

@interface VideoPlayView()

@property (nonatomic ,strong) UIView *bgView;

@property (nonatomic ,strong) UIImageView *eyeImageView;

@end


@implementation VideoPlayView

-(id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self prepareUI];
        
        [self configueFrame];
        
    }
    return self;
}

-(void)prepareUI
{
    self.videoImageView = [[UIImageView alloc]init];
    [self addSubview:self.videoImageView];
    self.videoImageView.userInteractionEnabled = YES;

    self.playBtn = [[UIButton alloc]init];
    [self.playBtn setImage:[UIImage imageNamed:playSmallImageName] forState:UIControlStateNormal];
    [self.videoImageView addSubview: self.playBtn];
    
//    self.bgView = [[UIView alloc]init];
//    self.bgView.backgroundColor =  c484746;
//    [self.videoImageView insertSubview:self.bgView aboveSubview:self.videoImageView];

   
//    self.infoLabel = [UILabel addLabelWithText:@"" AndFont:12 AndAlpha:1.0 AndColor:c255255255];
//    [self.bgView addSubview:self.infoLabel];
    
//    self.eyeImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:watchmovieImageName]];
//    [ self.bgView addSubview:self.eyeImageView];
    
//    self.numLabel = [UILabel addLabelWithText:@"" AndFont:12 AndAlpha:1.0 AndColor:c255255255];
//    [ self.bgView  addSubview: self.numLabel];
}

-(void)configueFrame
{
    self.videoImageView.sd_layout.widthIs(kScreenWidth).topSpaceToView(self,0).bottomSpaceToView(self,0);
 
    
    self.playBtn.sd_layout.widthIs(self.playBtn.imageView.image.size.width).heightIs(self.playBtn.imageView.image.size.height).centerYEqualToView(self.videoImageView).centerXEqualToView(self.videoImageView);
    
//    self.bgView.sd_layout.widthIs(kScreenWidth).heightIs(px(60)).bottomSpaceToView(self.videoImageView,0);
    
//    self.numLabel.sd_layout.widthIs(px(60)).heightIs(12).centerYEqualToView(self.bgView).rightSpaceToView(self.bgView,px(30));
    
//    self.eyeImageView.sd_layout.widthIs(self.eyeImageView.image.size.width).heightIs(self.eyeImageView.size.height).rightSpaceToView(self.numLabel,px(10)).centerYEqualToView(self.bgView);
    
//    self.infoLabel.sd_layout.leftSpaceToView(self.bgView,px(30)).rightSpaceToView(self.eyeImageView,0).heightIs(12).centerYEqualToView(self.bgView);
}

-(void)setVideo:(Video *)video
{
   
    [self.videoImageView sd_setImageWithURL:[NSURL URLWithString:video.img]];
    
//    self.infoLabel.text = video.title;
//    self.numLabel.text = video.see;
}
@end
