//
//  hospitalTitleView.m
//  ZhongTongErKe
//
//  Created by khj on 2017/6/22.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "hospitalTitleView.h"


@interface hospitalTitleView ()

@property (nonatomic ,strong) UIImageView *headSepImageView;
@property (nonatomic ,strong) UIView *titleView;
@property (nonatomic ,strong) UILabel *titleLabel;
@property (nonatomic,strong)  UIImageView *line1ImageView;
@property (nonatomic,strong)  UIView *contentView;
@property (nonatomic,strong)  UILabel *fContentLabel;

@end

@implementation hospitalTitleView

-(id)init
{
    if (self = [super init]) {
        
        self.headSepImageView = [UIImageView createImageViewWithImageName:nil color:[UIColor colorWithHexString:@"f1eff0"]];
        [self addSubview:self.headSepImageView];
        self.headSepImageView.frame = CGRectMake(0, 0, kScreenWidth, px(20));
        
        self.titleView = [[UIView alloc]init];
        [self addSubview:self.titleView];
        self.titleView.frame = CGRectMake(0, CGRectGetMaxY(self.headSepImageView.frame), kScreenWidth, px(54));
        
        self.titleLabel = [UILabel addLabelWithText:@"医院介绍" AndFont:Font15 AndAlpha:1.0 AndColor:TITLE_COLOR];
        [self.titleView addSubview:self.titleLabel];
        self.titleLabel.sd_layout.leftSpaceToView( self.titleView,px(30)).rightSpaceToView(self.titleView,0).heightIs(Font15).centerYEqualToView(self.titleView);
        
        self.line1ImageView = [UIImageView createImageViewWithImageName:nil color:[UIColor colorWithHexString:@"e9e9e9"]];
        [self.titleView addSubview:self.line1ImageView];
        self.line1ImageView.sd_layout.widthIs(kScreenWidth).heightIs(px(2)).bottomSpaceToView(self.titleView,0);
        

        self.contentView = [[UIView alloc]init];
        [self addSubview:self.contentView];
        
        self.fContentLabel = [UILabel addLabelWithText:@"" AndFont:Font13 AndAlpha:1.0 AndColor:TITLE_COLOR];
        self.fContentLabel.numberOfLines = 0;
        [self.contentView addSubview:self.fContentLabel];
        
        
    }
    return self;
}

-(void)setHospital:(Hospital *)hospital
{
    
       CGFloat superMsgViewH = 0;
    
    self.fContentLabel.text = hospital.content;
    NSDictionary *descDic = @{NSFontAttributeName:font(Font13 )};
    CGRect descFrame =  [self.fContentLabel.text textRectWithSize:CGSizeMake(kScreenWidth-2*px(30), MAXFLOAT) attributes:descDic];
    descFrame.origin.x = px(30);
    descFrame.origin.y = 0;
    self.fContentLabel.frame = descFrame;
    
    self.contentView.frame = CGRectMake(0, CGRectGetMaxY(self.titleView.frame)+px(10), kScreenWidth, CGRectGetMaxY(self.contentView.subviews.lastObject.frame)+px(20));
    
    superMsgViewH = CGRectGetMaxY(self.contentView.frame)+px(20);
    CGRect bounds = self.bounds;
    bounds.size.height = superMsgViewH;
    self.bounds=bounds;
}

@end
