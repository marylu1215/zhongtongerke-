//
//  SSInterrogationHeader.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/10.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSInterrogationHeader.h"


@interface SSInterrogationHeader ()

@property (nonatomic,strong)UIView *separatorView1;
@property (nonatomic,strong)UIView *separatorView2;

@end

@implementation SSInterrogationHeader

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubviews];
        [self makeConstaits];
    }
    return self;
}

- (void)addSubviews{
    [self addSubview:self.fastConsultView];
    [self.fastConsultView addSubview:self.headLabel];
    [self.fastConsultView addSubview:self.headImageview  ];
    [self.fastConsultView addSubview:self.remarkImageView];
    [self addSubview:self.separatorView1];
    [self addSubview:self.separatorView2];
    [self addSubview:self.button4];
    [self addSubview:self.button3];
    [self addSubview:self.button2];
    [self addSubview:self.button1];
}
- (void)makeConstaits{
    [self.fastConsultView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(kScreenWidth, 75*kScreenHeightScale));
        make.left.mas_equalTo(0);
    }];
    [self.headImageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(19*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(54*kScreenWidthScale, 38*kScreenHeightScale));
        make.left.mas_equalTo(103*kScreenWidthScale);
    }];
    [self.remarkImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(21*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(89*kScreenWidthScale, 15*kScreenHeightScale));
        make.left.mas_equalTo(165*kScreenWidthScale);
    }];
    [self.headLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(43*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(180*kScreenWidthScale, 12*kScreenHeightScale));
        make.left.mas_equalTo(165*kScreenWidthScale);
    }];
    [self.separatorView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(75*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(kScreenWidth, 7*kScreenHeightScale));
        make.left.mas_equalTo(0*kScreenWidthScale);
    }];
    [self.button1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(93*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(47*kScreenWidthScale, 52*kScreenHeightScale));
        make.left.mas_equalTo(15*kScreenWidthScale);
    }];
    [self.button2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(93*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(47*kScreenWidthScale, 52*kScreenHeightScale));
        make.left.mas_equalTo(113*kScreenWidthScale);
    }];
    [self.button3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(93*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(47*kScreenWidthScale, 52*kScreenHeightScale));
        make.left.mas_equalTo(211*kScreenWidthScale);
    }];
    [self.button4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(93*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(47*kScreenWidthScale, 52*kScreenHeightScale));
        make.left.mas_equalTo(299*kScreenWidthScale);
    }];
    [self.separatorView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(167*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(kScreenWidth, 7*kScreenHeightScale));
        make.left.mas_equalTo(0*kScreenWidthScale);
    }];
}







- (UIView *)fastConsultView{
    if (!_fastConsultView) {
        _fastConsultView = [[UIView alloc]init];
        _fastConsultView.backgroundColor = [UIColor clearColor];
    }
    return _fastConsultView;
}


- (UIImageView *)headImageview{
    if (!_headImageview) {
        _headImageview = [[UIImageView alloc]init];
    }
    return _headImageview;
}

- (UIImageView *)remarkImageView{
    if (!_remarkImageView) {
        _remarkImageView = [[UIImageView alloc]init];
        
    }
    return _remarkImageView;
}
- (UILabel *)headLabel{
    if (!_headLabel) {
        _headLabel = [[UILabel alloc]init];
        _headLabel.font = [UIFont systemFontOfSize:12*kScreenHeightScale];
        _headLabel.textColor = REMARK_COLOR;
    }
    return _headLabel;
}
- (UIView *)separatorView1{
    if (!_separatorView1) {
        _separatorView1 = [[UIView alloc]init];
        _separatorView1.backgroundColor = BACKGROUND_COLOR;
    }
    return _separatorView1;
}
- (SSInterrogationHeadButton *)button1{
    if (!_button1) {
        _button1 = [[SSInterrogationHeadButton alloc]init];
    }
    return _button1;
}
- (SSInterrogationHeadButton *)button2{
    if (!_button2) {
        _button2 = [[SSInterrogationHeadButton alloc]init];
    }
    return _button2;
}
- (SSInterrogationHeadButton *)button3{
    if (!_button3) {
        _button3 = [[SSInterrogationHeadButton alloc]init];
    }
    return _button3;
}
- (SSInterrogationHeadButton *)button4{
    if (!_button4) {
        _button4 = [[SSInterrogationHeadButton alloc]init];
    }
    return _button4;
}
- (UIView *)separatorView2{
    if (!_separatorView2) {
        _separatorView2 = [[UIView alloc]init];
        _separatorView2.backgroundColor = BACKGROUND_COLOR;
    }
    return _separatorView2;
}



@end
