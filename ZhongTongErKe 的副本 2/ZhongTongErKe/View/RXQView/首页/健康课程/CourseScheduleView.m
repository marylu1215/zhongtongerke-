//
//  CourseScheduleView.m
//  ZhongTongErKe
//
//  Created by khj on 2017/6/21.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "CourseScheduleView.h"

@interface CourseScheduleView ()

@property (nonatomic ,strong) UIView *topView;
@property (nonatomic ,strong) UILabel *titleLabel;
@property (nonatomic ,strong) UILabel *numberLabel;
@property (nonatomic ,strong) UIButton *telButton;
@property (nonatomic ,strong) UIButton *moreButton;

@end
@implementation CourseScheduleView

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
    self.topView = [[UIView alloc]init];
    self.topView.backgroundColor = c255255255;
    [self addSubview:self.topView];
    
    self.titleLabel = [UILabel addLabelWithText:@"" AndFont:18 AndAlpha:1.0 AndColor:[UIColor colorWithHexString:@"333333"]];
    [self.topView addSubview:self.titleLabel];
    
    self.numberLabel = [UILabel addLabelWithText:@"" AndFont:Font13 AndAlpha:1.0 AndColor:[UIColor colorWithHexString:@"989898"]];
    [self.topView addSubview:self.numberLabel];
    
    self.telButton  = [UIButton addBtnWithTitle:@"客服电话" WithBGImg:nil WithFont:Font13 WithTitleColor:c255255255 Target:self Action:@selector(telAction)];
    self.telButton.backgroundColor = cHBColor;
    self.telButton.layer.cornerRadius =3;
    self.telButton.clipsToBounds = YES;
    [self.topView addSubview:self.telButton];
    
    self.moreButton = [UIButton addBtnImage:downIconImageName WithTarget:self action:@selector(downAction)];
    [self.topView addSubview:self.moreButton];
    
    
}

-(void)configueFrame
{
    self.topView.sd_layout.widthIs(kScreenWidth).heightIs(px(86)).topSpaceToView(self,0);
    self.telButton.sd_layout.widthIs(px(150)).heightIs(px(36)).rightSpaceToView(self.topView,px(30)).centerYEqualToView(self.topView);
    
    self.moreButton.sd_layout.widthIs(self.moreButton.imageView.image.size.width).heightIs(self.moreButton.imageView.image.size.height).topSpaceToView(self.titleLabel,px(36)).centerXEqualToView(self);
    
}
-(void)telAction
{
    if (self.telBlock) {
        
        self.telBlock();
    }
}

-(void)downAction
{
    if (self.downBlock) {
        
        self.downBlock();
    }
}
-(void)setCourse:(Course *)course
{
    _course = course;
    self.titleLabel.text = course.title;
    self.titleLabel.sd_layout.widthIs([NSString backSizeWithText:self.titleLabel.text andFont:font(18)].width).heightIs(18).leftSpaceToView(self.topView ,px(30)).centerYEqualToView(self.topView);
    
    self.numberLabel.text  = course.num;
    self.numberLabel.sd_layout.widthIs([NSString backSizeWithText:self.numberLabel.text andFont:font(Font13)].width).heightIs(Font13).leftSpaceToView(self.titleLabel,px(30)).centerYEqualToView(self.topView);
}


@end
