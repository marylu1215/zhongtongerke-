//
//  MyCourseDetailsView.m
//  ZhongTongErKe
//
//  Created by khj on 2017/6/20.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "MyCourseDetailsView.h"

@interface MyCourseDetailsView ()

@property (nonatomic ,strong) UIView *topView;
@property (nonatomic ,strong) UILabel *titleLabel;
@property (nonatomic ,strong) UILabel *numberLabel;
@property (nonatomic ,strong) UIButton *telButton;
@property (nonatomic ,strong) UIView *sepView;
@property (nonatomic ,strong) UIView *bottomView;
@property (nonatomic ,strong) UILabel *arrangeLabel;
@property (nonatomic ,strong) UIButton *scheduleButton;


@end


@implementation MyCourseDetailsView

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
    
    self.sepView = [[UIView alloc]init];
    self.sepView.backgroundColor = [UIColor colorWithHexString:@"f1f0f0"];
    [self addSubview:self.sepView];
    
    self.bottomView = [[UIView alloc]init];
    self.bottomView.backgroundColor = c255255255;
    [self addSubview:self.bottomView];
    
    self.arrangeLabel = [UILabel addLabelWithText:@"本周课时安排" AndFont:Font13 AndAlpha:1.0 AndColor:[UIColor colorWithHexString:@"333333"]];
    [self.bottomView addSubview:self.arrangeLabel];
    
    self.scheduleButton = [UIButton addBtnWithTitle:[NSString stringWithFormat:@"%@>>",@"课程一览表"] WithBGImg:nil WithFont:Font13 WithTitleColor:cHBColor Target:self Action:@selector(lookAction)];
    [self.bottomView addSubview:self.scheduleButton];
}

-(void)configueFrame
{
    self.topView.sd_layout.widthIs(kScreenWidth).heightIs(px(86)).topSpaceToView(self,0);
    self.telButton.sd_layout.widthIs(px(150)).heightIs(px(36)).rightSpaceToView(self.topView,px(30)).centerYEqualToView(self.topView);
    self.sepView.sd_layout.widthIs(kScreenWidth).heightIs(px(20)).topSpaceToView(self.topView,0);
    
    self.bottomView.sd_layout.widthIs(kScreenWidth).heightIs(px(72)).topSpaceToView(self.sepView,0);
    
    self.arrangeLabel.sd_layout.widthIs([NSString backSizeWithText:self.arrangeLabel.text andFont:font(Font13)].width).heightIs(Font13).leftSpaceToView(self.bottomView ,px(30)).centerYEqualToView(self.bottomView);
    
    self.scheduleButton.sd_layout.widthIs(px(172)).heightIs(Font13).rightSpaceToView(self.bottomView,px(30)).centerYEqualToView(self.bottomView);
    
}
-(void)telAction
{
    if (self.telBlock) {
        
        self.telBlock();
    }
}
-(void)lookAction
{
    if (self.lookBlock) {
        
        self.lookBlock();
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
