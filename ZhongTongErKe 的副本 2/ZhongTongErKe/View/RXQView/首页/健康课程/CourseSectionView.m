//
//  CourseSectionView.m
//  ZhongTongErKe
//
//  Created by khj on 2017/6/21.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "CourseSectionView.h"
#import "WeakView.h"

@interface CourseSectionView ()

@property (nonatomic ,strong) UIView *topView;
@property (nonatomic ,strong) UIView *midView;
@property (nonatomic ,strong) UILabel *titleLabel;
@property (nonatomic ,strong) WeakView *bottomView;

@end
@implementation CourseSectionView

-(id)initWithFrame:(CGRect)frame
{
    if (self  =[super initWithFrame:frame]) {
        
        self.topView  = [[UIView alloc]init];
        self.topView.backgroundColor = bgColor;
        [self addSubview:self.topView];
        self.topView.sd_layout.widthIs(kScreenWidth).heightIs(px(20)).topSpaceToView(self,0);
        
        self.midView = [[UIView alloc]init];
        self.midView.backgroundColor = c255255255;
        [self addSubview:self.midView];
        self.midView.sd_layout.widthIs(kScreenWidth).heightIs(px(70)).topSpaceToView(self.topView,0);
       
        self.titleLabel = [UILabel addLabelWithText:@"课程一览表" AndFont:Font13 AndAlpha:1.0 AndColor:[UIColor colorWithHexString:@"333333"]];
        [self.midView addSubview:self.titleLabel];
        
        self.titleLabel.sd_layout.leftSpaceToView(self.midView,px(30)).rightSpaceToView(self.midView,0).heightIs(Font13).centerYEqualToView(self.midView);
        
        self.bottomView =  [[WeakView alloc]initWithFrame:CGRectMake(0, px(96), kScreenWidth, px(50))];
        self.bottomView.backgroundColor = [UIColor colorWithHexString:@"73c5ff"];
        [self addSubview: self.bottomView];
    }
    return self;
}

@end
