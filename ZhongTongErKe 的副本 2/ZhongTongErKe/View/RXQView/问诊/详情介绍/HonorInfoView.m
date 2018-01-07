//
//  HonorInfoView.m
//  ZhongTongErKe
//
//  Created by khj on 2017/6/22.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "HonorInfoView.h"


@interface HonorInfoView ()

@property (nonatomic ,strong) UIImageView *sImageView;
@property (nonatomic ,strong) UIView *sTitleView;
@property (nonatomic,strong)  UIImageView *line2ImageView;
@property (nonatomic ,strong) UILabel *sTitleLabel;
@property (nonatomic,strong)  UIView *contentView;


@end
@implementation HonorInfoView

-(id)init
{
    if (self = [super init]) {
        
        self.sImageView = [UIImageView createImageViewWithImageName:nil color:[UIColor colorWithHexString:@"f1eff0"]];
        [self addSubview:self.sImageView];
          self.sImageView.frame = CGRectMake(0, 0, kScreenWidth, px(20));
        
        
        self.sTitleView = [[UIView alloc]init];
        [self addSubview: self.sTitleView];
          self.sTitleView.frame = CGRectMake(0, CGRectGetMaxY( self.sImageView.frame), kScreenWidth,px(54));
        
        
        self.sTitleLabel = [UILabel addLabelWithText:@"荣誉信息" AndFont:Font15 AndAlpha:1.0 AndColor:TITLE_COLOR];
        [self.sTitleView addSubview: self.sTitleLabel];
        self.sTitleLabel.sd_layout.leftSpaceToView(self.sTitleView,px(30)).rightSpaceToView(self.sTitleView,0).heightIs(Font15).centerYEqualToView( self.sTitleView);
       
        self.line2ImageView = [UIImageView createImageViewWithImageName:nil color:[UIColor colorWithHexString:@"f1eff0"]];
        [self.sTitleView addSubview: self.line2ImageView];
         self.line2ImageView.sd_layout.widthIs(kScreenWidth).heightIs(px(2)).bottomSpaceToView(self.sTitleView,0);
      
    
        self.contentView = [[UIView alloc]init];
        [self addSubview:self.contentView];
        
        
       
    }
    return self;
}

-(void)setHospital:(Hospital *)hospital
{
    _hospital = hospital;
    
     CGFloat superMsgViewH = 0;
    
   
    CGRect contentDescFrame;
  
    NSDictionary *descDic = @{NSFontAttributeName:font(Font13)};
        
    contentDescFrame  =  [hospital.information textRectWithSize:CGSizeMake(kScreenWidth -2*px(30), MAXFLOAT) attributes:descDic];
        
    UILabel *sContentLabel = [UILabel addLabelWithText:hospital.information AndFont:Font13 AndAlpha:1.0 AndColor:TITLE_COLOR];
        sContentLabel.numberOfLines =0;
        
        [self.contentView addSubview:sContentLabel];
        
        sContentLabel.frame = CGRectMake(px(30),0, contentDescFrame.size.width , contentDescFrame.size.height);
    
    self.contentView.frame = CGRectMake(0, CGRectGetMaxY(self.sTitleView.frame), kScreenWidth, CGRectGetMaxY(self.contentView.subviews.lastObject.frame)+px(20));
    
    superMsgViewH = CGRectGetMaxY(self.contentView.frame)+px(20);
    CGRect bounds = self.bounds;
    bounds.size.height = superMsgViewH;
    self.bounds=bounds;
}
@end
