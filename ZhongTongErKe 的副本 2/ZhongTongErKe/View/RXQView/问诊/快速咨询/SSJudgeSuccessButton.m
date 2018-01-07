//
//  SSJudgeSuccessButton.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/11.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSJudgeSuccessButton.h"

@implementation SSJudgeSuccessButton


- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame: frame]) {
        [self addSubviews];
        [self makeConstaits];
    }
    return self;
}

- (void)addSubviews{
    [self addSubview: self.bgImageView];
    [self addSubview:self.contentLabel];
}
- (void)makeConstaits{
    [self.bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(80*kScreenWidthScale, 25*kScreenHeightScale));
        make.left.mas_equalTo(0);
    }];
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(59*kScreenWidthScale, 25*kScreenHeightScale));
        make.left.mas_equalTo(21);
    }];
}

- (UIImageView *)bgImageView{
    if (!_bgImageView) {
        _bgImageView = [[UIImageView alloc]init];
    }
    return _bgImageView;
}
- (UILabel *)contentLabel{
    if (!_contentLabel) {
        _contentLabel =  [[UILabel alloc]init];
        _contentLabel.font = [UIFont systemFontOfSize:12*kScreenHeightScale];
        _contentLabel.textColor = S_COLOR;
        _contentLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _contentLabel;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
