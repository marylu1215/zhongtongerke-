//
//  SSMineHeaderButtonOne.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/24.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSMineHeaderButtonOne.h"

@implementation SSMineHeaderButtonOne


- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubiews];
        [self makeConstaits];
    }
    return self;
}

- (void)addSubiews{
    [self addSubview:self.headImageView];
    [self addSubview:self.headLabel];
}
- (void)makeConstaits{
    [self.headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(25*kScreenWidthScale, 25*kScreenHeightScale));
        make.left.mas_equalTo(0);
    }];
    [self.headLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(25*kScreenWidthScale, 11*kScreenHeightScale));
        make.left.mas_equalTo(0);
    }];
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
        _headLabel.font = [UIFont systemFontOfSize:11*kScreenHeightScale];
        _headLabel.textColor = [UIColor whiteColor];
        _headLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _headLabel;
}

@end
