//
//  SSPhysicButton.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/23.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSPhysicButton.h"

@implementation SSPhysicButton


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
        make.top.mas_equalTo(0);
        make.left.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(15*kScreenWidthScale, 15*kScreenHeightScale));
        
    }];
    [self.headLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.mas_equalTo(20*kScreenWidthScale);
        make.size.mas_equalTo(CGSizeMake(40*kScreenWidthScale, 15*kScreenHeightScale));
    }];
}




- (UILabel *)headLabel{
    if (!_headLabel) {
        _headLabel = [[UILabel alloc]init];
        _headLabel.font = [UIFont systemFontOfSize:12*kScreenHeightScale];
        _headLabel.textColor = REMARK_COLOR;
    }
    return _headLabel;
}
- (UIImageView *)headImageView{
    if (!_headImageView) {
        _headImageView = [[UIImageView alloc]init];
    }
    return _headImageView;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
