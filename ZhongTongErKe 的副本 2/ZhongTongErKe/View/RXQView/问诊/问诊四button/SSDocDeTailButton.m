//
//  SSDocDeTailButton.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/16.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSDocDeTailButton.h"

@implementation SSDocDeTailButton


- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubViews];
        [self makeConstaits];
    }
    return self;
}



- (void)addSubViews{
    [self addSubview:self.headImageView];
    [self addSubview:self.headLabel];
    [self addSubview:self.priceLabel];
}
- (void)makeConstaits{
    [self.headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(8*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(25*kScreenWidthScale, 25*kScreenHeightScale));
        make.left.mas_equalTo(15*kScreenWidthScale);
    }];
    [self.headLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(39*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(55*kScreenWidthScale, 12*kScreenHeightScale));
        make.left.mas_equalTo(0*kScreenWidthScale);
    }];
    
   self.priceLabel.sd_layout.leftSpaceToView(self,0).rightSpaceToView(self,0).topSpaceToView(self.headLabel,px(20)).heightIs(Font13);
    
    
}


- (UIImageView *)headImageView{
    if (!_headImageView) {
        _headImageView = [[UIImageView alloc]init];
    }
    return _headImageView;
}
- (UILabel *)headLabel{
    if (!_headLabel) {
        _headLabel = [[UILabel alloc]init];
        _headLabel.font = [UIFont systemFontOfSize:12*kScreenHeightScale];
        _headLabel.textColor = TITLE_COLOR;
        _headLabel.textAlignment = NSTextAlignmentCenter;
        
    }
    return _headLabel;
}
- (UILabel *)priceLabel{
    if (!_priceLabel) {
        _priceLabel = [[UILabel alloc]init];
        _priceLabel.font = [UIFont systemFontOfSize:13*kScreenHeightScale];
        _priceLabel.textAlignment = NSTextAlignmentCenter;
        _priceLabel.textColor = TITLE_COLOR;
    }
    return _priceLabel;
}







/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
