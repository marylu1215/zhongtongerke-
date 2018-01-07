//
//  SSHotGroupButton.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/25.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSHotGroupButton.h"

@implementation SSHotGroupButton


- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubviews];
        [self makeConstaits];
    }
    return self;
}

- (void)addSubviews{
    [self addSubview:self.headImageView];
    [self addSubview:self.headLabel];
}
- (void)makeConstaits{
    [self.headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(65*kScreenWidthScale, 65*kScreenHeightScale));
        make.left.mas_equalTo(0);
    }];
    [self.headLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(75*kScreenWidthScale, 12*kScreenHeightScale));
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
        _headLabel.font = [UIFont systemFontOfSize:12*kScreenHeightScale];
        _headLabel.textColor = TITLE_COLOR;
        _headLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _headLabel;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
