//
//  SSBasicFileSectionView.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/5.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSBasicFileSectionView.h"

@interface SSBasicFileSectionView ()

@property (nonatomic,strong) UILabel *headLabel;
@property (nonatomic,strong) UILabel *detailLabel;
@property (nonatomic ,strong) UIView *bottomView;

@end

@implementation SSBasicFileSectionView


- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubviews];
        self.backgroundColor = c255255255;
    }
    return self;
}

- (void)addSubviews{
    
    self.headLabel = [UILabel addLabelWithText:@"" AndFont:Font15 AndAlpha:1.0 AndColor:cHBColor];
    
    [self addSubview: self.headLabel];
    
    self.detailLabel = [UILabel addLabelWithText:@"" AndFont:Font13 AndAlpha:1.0 AndColor:TITLE_COLOR];
    self.detailLabel.numberOfLines = 0;
    [self addSubview:self.detailLabel];
    
    self.bottomView = [[UIView alloc]init];
    self.bottomView.backgroundColor = [UIColor colorWithHexString:@"aaaaaa"];
    [self addSubview:self.bottomView];
   
    
}
- (void)setHealthHistory:(HealthHistory *)healthHistory
{
   
    _healthHistory = healthHistory;
    
      self.headLabel.frame = CGRectMake(px(30), px(20), kScreenWidth-px(30), Font15);
    
    self.headLabel.text = healthHistory.title;
    if (healthHistory.subTitle.length) {
        self.detailLabel.text = healthHistory.subTitle;
        NSDictionary *descDic = @{NSFontAttributeName:font(Font13)};
        CGRect descFrame =  [self.detailLabel.text textRectWithSize:CGSizeMake(kScreenWidth - px(60), MAXFLOAT) attributes:descDic];
        descFrame.origin.x = px(30);
        descFrame.origin.y =  CGRectGetMaxY(self.headLabel.frame)+px(20);
        self.detailLabel.frame = descFrame;
        
        self.bottomView.frame = CGRectMake(0, CGRectGetMaxY(self.detailLabel.frame)+px(20), kScreenWidth, px(2));

    }
    
    else
    {
          self.bottomView.frame = CGRectMake(0, CGRectGetMaxY(self.headLabel.frame)+px(20), kScreenWidth, px(2));
    }
    
    CGFloat superMsgViewH = 0;
    superMsgViewH = CGRectGetMaxY(self.subviews.lastObject.frame);
    CGRect bounds = self.bounds;
    bounds.size.height = superMsgViewH;
    self.bounds=bounds;

}
@end
