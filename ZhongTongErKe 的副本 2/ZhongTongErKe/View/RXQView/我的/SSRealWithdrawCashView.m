//
//  SSRealWithdrawCashView.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/25.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSRealWithdrawCashView.h"
#import "WorkTableViewCell.h"
@interface SSRealWithdrawCashView ()

@property (nonatomic,strong)UIView *separator1;
@property (nonatomic,strong)UIView *separator2;
@property (nonatomic,strong)UIView *line;

@end

@implementation SSRealWithdrawCashView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubviews];
        [self makeConstaits];
    }
    return self;
}


- (void)addSubviews{
    [self addSubview:self.headButton];
    [self addSubview:self.separator1];
    [self addSubview:self.separator2];
    [self addSubview:self.moneyLabel];
    [self addSubview:self.moneyImageViewLabel];
    [self addSubview:self.line];
    [self addSubview:self.moneyTextField];
    [self addSubview:self.extraMoneyLabel];
}
- (void)makeConstaits{
    [self.separator1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(kScreenWidth, 7*kScreenHeightScale));
        make.left.mas_equalTo(0);
    }];
    [self.headButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(7*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(kScreenWidth, 60*kScreenHeightScale));
        make.left.mas_equalTo(0);
    }];
    [self.separator2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(67*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(kScreenWidth, 15*kScreenHeightScale));
        make.left.mas_equalTo(0);

    }];
    [self.moneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(91*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(50*kScreenWidthScale, 15*kScreenHeightScale));
        make.left.mas_equalTo(15*kScreenWidthScale);

    }];
    [self.moneyImageViewLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(126*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(23*kScreenWidthScale, 27*kScreenHeightScale));
        make.left.mas_equalTo(15*kScreenWidthScale);
    }];
    [self.moneyTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(139*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(200*kScreenWidthScale, 12*kScreenHeightScale));
        make.left.mas_equalTo(50*kScreenWidthScale);
    }];
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(162*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(kScreenWidth, 1*kScreenHeightScale));
        make.left.mas_equalTo(0*kScreenWidthScale);
    }];
    [self.extraMoneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(163*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(200*kScreenWidthScale, 32*kScreenHeightScale));
        make.left.mas_equalTo(16*kScreenWidthScale);
    }];
}



- (UIView *)separator1{
    if (!_separator1) {
        _separator1 = [[UIView alloc]init];
        _separator1.backgroundColor = BACKGROUND_COLOR;
    }
    return _separator1;
}
- (SSWithdrawCashBankButton *)headButton{
    if (!_headButton) {
        _headButton = [[SSWithdrawCashBankButton alloc]init];
    }
    return _headButton;
}
- (UIView *)separator2{
    if (!_separator2) {
        _separator2 = [[UIView alloc]init];
        _separator2.backgroundColor = BACKGROUND_COLOR;
    }
    return _separator2;
}
- (UILabel *)moneyLabel{
    if (!_moneyLabel) {
        _moneyLabel = [[UILabel alloc]init];
        _moneyLabel.font = [UIFont systemFontOfSize:15*kScreenHeightScale];
        _moneyLabel.textColor = TITLE_COLOR;
    }
    return _moneyLabel;
}
- (UILabel *)moneyImageViewLabel{
    if (!_moneyImageViewLabel) {
        _moneyImageViewLabel = [[UILabel alloc]init];
        _moneyImageViewLabel.font = [UIFont systemFontOfSize:27*kScreenHeightScale];
        _moneyImageViewLabel.textColor = [UIColor blackColor];
    }
    return _moneyImageViewLabel;
}
- (UITextField *)moneyTextField{
    if (!_moneyTextField) {
        _moneyTextField = [[UITextField alloc]init];
        _moneyTextField.font = [UIFont systemFontOfSize:12*kScreenHeightScale];
        _moneyTextField.textColor = TITLE_COLOR;
    }
    return _moneyTextField;
}
- (UILabel *)extraMoneyLabel{
    if (!_extraMoneyLabel) {
        _extraMoneyLabel = [[UILabel alloc]init];
        _extraMoneyLabel.font = [UIFont systemFontOfSize:12*kScreenHeightScale];
        _extraMoneyLabel.textColor = REMARK_COLOR;
    }
    return _extraMoneyLabel;
}
- (UIView *)line{
    if (!_line) {
        _line = [[UIView alloc]init];
        _line.backgroundColor = BACKGROUND_COLOR;
    }
    return _line;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
