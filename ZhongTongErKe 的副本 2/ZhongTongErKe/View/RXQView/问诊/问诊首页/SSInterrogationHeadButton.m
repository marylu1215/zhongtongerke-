//
//  SSInterrogationHeadButton.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/10.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSInterrogationHeadButton.h"

@implementation SSInterrogationHeadButton

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubViews];
        [self makeConstaits];
    }
    return self;
}


- (void)addSubViews{
    [self addSubview:self.headLabel];
    [self addSubview:self.headImageview];
}
- (void)makeConstaits{
    [self.headImageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(35*kScreenWidthScale, 35*kScreenHeightScale));
        make.left.mas_equalTo(9*kScreenWidthScale);
    }];
    [self.headLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(40*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(51*kScreenWidthScale, 12*kScreenHeightScale));
        make.left.mas_equalTo(0);
    }];
}


- (UIImageView *)headImageview{
    if (!_headImageview) {
        _headImageview = [[UIImageView alloc]init];
    }
    return _headImageview;
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


@end
