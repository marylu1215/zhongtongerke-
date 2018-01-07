//
//  SSPhysicMiddleView.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/23.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSPhysicMiddleView.h"

@interface SSPhysicMiddleView ()

@property (nonatomic,strong)UIView *line1;
@property (nonatomic,strong)UIView *separator1;
@property (nonatomic,strong)UIView *line2;
@property (nonatomic,strong)UIView *line3;
@property (nonatomic,strong)UIView *separetor2;

@end

@implementation SSPhysicMiddleView


- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubviews];
        [self makeConstaits];
    }
    return self;
}


- (void)addSubviews{
    [self addSubview:self.oneHeadLabel];
    [self addSubview:self.onePriceLabel];
    [self addSubview:self.oneDoorPriceLabel];
    [self addSubview:self.oneCollectionButton];
    [self addSubview:self.line1];
    [self addSubview:self.twoButton1];
    [self addSubview:self.twoButton2];
    [self addSubview:self.twoButton3];
    [self addSubview:self.separator1];
    [self addSubview:self.threeHeadLabel];
    [self addSubview:self.line2];
    [self addSubview:self.fourHeadLabel];
    [self addSubview:self.fourContentLabel];
    [self addSubview:self.line3];
    [self addSubview:self.fiveButton];
    [self addSubview:self.separetor2];
}
- (void)makeConstaits{
    [self.oneHeadLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(7*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(250*kScreenWidthScale, 15*kScreenHeightScale));
        make.left.mas_equalTo(8*kScreenWidthScale);
        
    }];
    [self.onePriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(29*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(56*kScreenWidthScale, 12*kScreenHeightScale));
        make.left.mas_equalTo(1*kScreenWidthScale);

    }];
    [self.oneDoorPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(29*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(200*kScreenWidthScale, 12*kScreenHeightScale));
        make.left.mas_equalTo(58*kScreenWidthScale);
    }];
    [self.oneCollectionButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(7*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(60*kScreenWidthScale, 15*kScreenHeightScale));
        make.right.mas_equalTo(-6*kScreenWidthScale);
    }];
    [self.line1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(47*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(kScreenWidth, 1*kScreenHeightScale));
        make.left.mas_equalTo(0*kScreenWidthScale);
    }];
    [self.twoButton1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(55*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(60*kScreenWidthScale, 15*kScreenHeightScale));
        make.left.mas_equalTo(15*kScreenWidthScale);
    }];
    [self.twoButton2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(55*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(60*kScreenWidthScale, 15*kScreenHeightScale));
        make.left.mas_equalTo(161*kScreenWidthScale);
    }];
    [self.twoButton3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(55*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(60*kScreenWidthScale, 15*kScreenHeightScale));
        make.left.mas_equalTo(303*kScreenWidthScale);
    }];
    [self.separator1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(77*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(kScreenWidth, 7*kScreenHeightScale));
        make.left.mas_equalTo(0*kScreenWidthScale);
    }];
    [self.threeHeadLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(91*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(200*kScreenWidthScale, 15*kScreenHeightScale));
        make.left.mas_equalTo(7*kScreenWidthScale);
    }];
    [self.line2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(112*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(kScreenWidth, 1*kScreenHeightScale));
        make.left.mas_equalTo(0*kScreenWidthScale);
    }];
    [self.fourHeadLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(120*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(257*kScreenWidthScale, 12*kScreenHeightScale));
        make.left.mas_equalTo(8*kScreenWidthScale);
    }];
    [self.fourContentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(120*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(60*kScreenWidthScale, 12*kScreenHeightScale));
        make.left.mas_equalTo(265*kScreenWidthScale);
    }];
    [self.line3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(139*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(kScreenWidth, 1*kScreenHeightScale));
        make.left.mas_equalTo(0*kScreenWidthScale);
    }];
    [self.fiveButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(140*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(kScreenWidth, 26*kScreenHeightScale));
        make.left.mas_equalTo(0*kScreenWidthScale);
    }];
    [self.separetor2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(166*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(kScreenWidth, 7*kScreenHeightScale));
        make.left.mas_equalTo(0*kScreenWidthScale);
    }];
}




- (UILabel *)oneHeadLabel{
    if (!_oneHeadLabel) {
        _oneHeadLabel = [[UILabel alloc]init];
        _oneHeadLabel.font = [UIFont systemFontOfSize:15*kScreenHeightScale];
        _oneHeadLabel.textColor = TITLE_COLOR;
    }
    return _oneHeadLabel;
}
- (UILabel *)onePriceLabel{
    if (!_onePriceLabel) {
        _onePriceLabel = [[UILabel alloc]init];
        _onePriceLabel.font = [UIFont systemFontOfSize:12*kScreenHeightScale];
        _onePriceLabel.textColor = S_COLOR;
        _onePriceLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _onePriceLabel;
}
- (UILabel *)oneDoorPriceLabel{
    if (!_oneDoorPriceLabel) {
        _oneDoorPriceLabel = [[UILabel alloc]init];
        _oneDoorPriceLabel.font = [UIFont systemFontOfSize:12*kScreenHeightScale];
        _oneDoorPriceLabel.textColor = REMARK_COLOR;
    }
    return _oneDoorPriceLabel;
}
- (SSPhysicButton *)oneCollectionButton{
    if (!_oneCollectionButton) {
        _oneCollectionButton = [[SSPhysicButton alloc]init];
    }
    return _oneCollectionButton;
}
- (UIView *)line1{
    if (!_line1) {
        _line1 = [[UIView alloc]init];
        _line1.backgroundColor = BACKGROUND_COLOR;
    }
    return _line1;
}
- (SSPhysicButton *)twoButton1{
    if (!_twoButton1) {
        _twoButton1 = [[SSPhysicButton alloc]init];
    }
    return _twoButton1;
}
- (SSPhysicButton *)twoButton2{
    if (!_twoButton2) {
        _twoButton2 = [[SSPhysicButton alloc]init];
    }
    return _twoButton2;
}
- (SSPhysicButton *)twoButton3{
    if (!_twoButton3) {
        _twoButton3 = [[SSPhysicButton alloc]init];
    }
    return _twoButton3;
}
- (UIView *)separator1{
    if (!_separator1) {
        _separator1 = [[UIView alloc]init];
        _separator1.backgroundColor = BACKGROUND_COLOR;
    }
    return _separator1;
}
- (UILabel *)threeHeadLabel{
    if (!_threeHeadLabel) {
        _threeHeadLabel = [[UILabel alloc]init];
        _threeHeadLabel.font = [UIFont systemFontOfSize:15*kScreenHeightScale];
        _threeHeadLabel.textColor = TITLE_COLOR;
    }
    return _threeHeadLabel;
}
- (UIView *)line2{
    if (!_line2) {
        _line2 = [[UIView alloc]init];
        _line2.backgroundColor = BACKGROUND_COLOR;
    }
    return _line2;
}
- (UILabel *)fourHeadLabel{
    if (!_fourHeadLabel) {
        _fourHeadLabel = [[UILabel alloc]init];
        _fourHeadLabel.font = [UIFont systemFontOfSize:12*kScreenHeightScale];
        _fourHeadLabel.textColor = TITLE_COLOR;
    }
    return _fourHeadLabel;
}
- (UILabel *)fourContentLabel{
    if (!_fourContentLabel) {
        _fourContentLabel = [[UILabel alloc]init];
        _fourContentLabel.font = [UIFont systemFontOfSize:12*kScreenHeightScale];
        _fourContentLabel.textColor = TITLE_COLOR;
    }
    return _fourContentLabel;
}
- (UIView *)line3{
    if (!_line3) {
        _line3 = [[UIView alloc]init];
        _line3.backgroundColor = BACKGROUND_COLOR;
    }
    return _line3;
}
- (UIButton *)fiveButton{
    if (!_fiveButton) {
        _fiveButton = [[UIButton alloc]init];
    }
    return _fiveButton;
}
- (UIView *)separetor2{
    if (!_separetor2) {
        _separetor2 = [[UIView alloc]init];
        _separetor2.backgroundColor = BACKGROUND_COLOR;
    }
    return _separetor2;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
