//
//  SSWithdrawCashView.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/25.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSWithdrawCashView.h"

@interface SSWithdrawCashView ()

@property (nonatomic,strong)UIView *separator1;
@property (nonatomic,strong)UIView *separator2;

@end

@implementation SSWithdrawCashView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubviews];
        [self makeConstaits];
    }
    return self;
}


- (void)addSubviews{
    [self addSubview: self.separator1];
    [self addSubview:self.bankButton];
    [self addSubview:self.separator2];
    [self addSubview:self.moneyLabel];
    [self addSubview:self.moneyTextField];
}

- (void)makeConstaits{
    [self.separator1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(kScreenWidth, 7*kScreenHeightScale));
        make.left.mas_equalTo(0*kScreenWidthScale);
    }];
    [self.bankButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(7*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(kScreenWidth, 60*kScreenHeightScale));
        make.left.mas_equalTo(0*kScreenWidthScale);
    }];
    [self.separator2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(67*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(kScreenWidth, 15*kScreenHeightScale));
        make.left.mas_equalTo(0*kScreenWidthScale);
    }];
    [self.moneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(82*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(32*kScreenWidthScale, 42*kScreenHeightScale));
        make.left.mas_equalTo(15*kScreenWidthScale);
    }];
    [self.moneyTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(82*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(200*kScreenWidthScale, 42*kScreenHeightScale));
        make.left.mas_equalTo(55*kScreenWidthScale);
    }];
}

-(UIView *)separator1{
    if (!_separator1) {
        _separator1 = [[UIView alloc]init];
        _separator1.backgroundColor = BACKGROUND_COLOR;
    }
    return _separator1;
}

- (SSWithdrawCashBankButton *)bankButton{
    if (!_bankButton) {
        _bankButton = [[SSWithdrawCashBankButton alloc]init];
        
    }
    return _bankButton;
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
- (UITextField *)moneyTextField{
    if (!_moneyTextField) {
        _moneyTextField = [[UITextField alloc]init];        _moneyTextField.font = [UIFont systemFontOfSize:12*kScreenHeightScale];
        _moneyTextField.textColor = REMARK_COLOR;
    }
    return _moneyTextField;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
