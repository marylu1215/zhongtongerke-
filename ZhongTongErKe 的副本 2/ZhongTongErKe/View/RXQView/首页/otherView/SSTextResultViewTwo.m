//
//  SSTextResultViewTwo.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/4.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSTextResultViewTwo.h"

@implementation SSTextResultViewTwo

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubViews];
        [self makeConstraits];
    }
    return self;
}

- (void)addSubViews{
    [self addSubview:self.headImageView];
    [self addSubview:self.headLabel];
    [self addSubview:self.tagLabel];
    [self addSubview:self.onlineButton];
    [self addSubview:self.hotLineButton];
}
- (void)makeConstraits{
    [self.headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.right.mas_equalTo(0);
    }];
    [self.headLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(19*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(100*kScreenWidthScale, 12*kScreenHeightScale));
        make.left.mas_equalTo(76*kScreenWidthScale);
    }];
    [self.tagLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(38*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(100*kScreenWidthScale, 10*kScreenHeightScale));
        make.left.mas_equalTo(76*kScreenWidthScale);
    }];
    [self.onlineButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(23*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(75*kScreenWidthScale, 20*kScreenHeightScale));
        make.left.mas_equalTo(200*kScreenWidthScale);
    }];
    [self.hotLineButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(23*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(75*kScreenWidthScale, 20*kScreenHeightScale));
        make.left.mas_equalTo(285*kScreenWidthScale);
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
        _headLabel.font = [UIFont systemFontOfSize:12*kScreenWidthScale];
        _headLabel.textColor = TITLE_COLOR;
    }
    return _headLabel;
}
- (UILabel *)tagLabel{
    if (!_tagLabel) {
        _tagLabel = [[UILabel alloc]init];
        _tagLabel.font = [UIFont systemFontOfSize:10*kScreenHeightScale];
        _tagLabel.textColor = REMARK_COLOR;
        
    }
    return _tagLabel;
}
- (UIButton *)onlineButton{
    if (!_onlineButton) {
        _onlineButton = [[UIButton alloc]init];
    }
    return _onlineButton;
}
- (UIButton *)hotLineButton{
    if (!_hotLineButton) {
        _hotLineButton = [[UIButton alloc]init];
    }
    return _hotLineButton;
}









@end
