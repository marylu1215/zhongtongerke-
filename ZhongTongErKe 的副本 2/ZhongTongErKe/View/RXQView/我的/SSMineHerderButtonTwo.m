//
//  SSMineHerderButtonTwo.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/24.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSMineHerderButtonTwo.h"

@implementation SSMineHerderButtonTwo

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubviews];
        [self makeConstaits];
    }
    return self;
}


- (void)addSubviews{
    [self addSubview:self.headLabel];
    [self addSubview:self.headImageView];
}
- (void)makeConstaits{
    [self.headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(25*kScreenWidthScale, 25*kScreenHeightScale));
        make.left.mas_equalTo(21*kScreenWidthScale);
    }];
    [self.headLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(0*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(67*kScreenWidthScale, 12*kScreenHeightScale));
        make.left.mas_equalTo(0*kScreenWidthScale);
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
        _headLabel.font = [UIFont systemFontOfSize:12*kScreenHeightScale];
        _headLabel.textColor = TITLE_COLOR;
        _headLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _headLabel;
}




@end
