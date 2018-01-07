//
//  SSWithdrawCashBankButton.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/25.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSWithdrawCashBankButton.h"

@interface SSWithdrawCashBankButton ()

@end

@implementation SSWithdrawCashBankButton


- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubviews];
        [self makeConstaits];
    }
    return self;
}


- (void)addSubviews{
    [self addSubview:self.headImageView];
    [self addSubview:self.bankLabel];
    [self addSubview:self.lastNumberLabel];
    [self addSubview:self.arrowImageView];
}
- (void)makeConstaits{
    [self.headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(10*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(40*kScreenWidthScale, 40*kScreenHeightScale));
        make.left.mas_equalTo(15*kScreenWidthScale);
    }];
    [self.bankLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(10*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(150*kScreenWidthScale, 14*kScreenHeightScale));
        make.left.mas_equalTo(70*kScreenWidthScale);
    }];
    [self.lastNumberLabel  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(38*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(200*kScreenWidthScale, 12*kScreenHeightScale));
        make.left.mas_equalTo(70*kScreenWidthScale);
    }];
    [self.arrowImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(23*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(7*kScreenWidthScale, 13*kScreenHeightScale));
        make.right.mas_equalTo(-15*kScreenWidthScale);
    }];
}


- (UIImageView *)headImageView{
    if (!_headImageView) {
        _headImageView = [[UIImageView alloc]init];
    }
    return _headImageView;
}
- (UILabel *)bankLabel{
    if (!_bankLabel) {
        _bankLabel = [[UILabel alloc]init];
        _bankLabel.font = [UIFont systemFontOfSize:14*kScreenHeightScale];
        _bankLabel.textColor = TITLE_COLOR;
    }
    return _bankLabel;
}
- (UILabel *)lastNumberLabel{
    if (!_lastNumberLabel) {
        _lastNumberLabel = [[UILabel alloc]init];
        _lastNumberLabel.font = [UIFont systemFontOfSize:12*kScreenHeightScale];
        _lastNumberLabel.textColor = REMARK_COLOR;
    }
    return _lastNumberLabel;
}
- (UIImageView *)arrowImageView{
    if (!_arrowImageView) {
        _arrowImageView = [[UIImageView alloc]init];
    }
    return _arrowImageView;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
