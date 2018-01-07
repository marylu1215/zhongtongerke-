//
//  SSDocInformationHeader.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/22.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSDocInformationHeader.h"

@interface SSDocInformationHeader ()

@property (nonatomic,strong)UIView *line;
@property (nonatomic,strong)UIView *separator;
@property (nonatomic,strong)UILabel *headLabel;
@property (nonatomic,strong)UILabel *contentLabel;

@end

@implementation SSDocInformationHeader

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
       self.backgroundColor = [UIColor whiteColor];
        [self addSubviews];
        [self makeConstaits];
    }
    return self;
}


- (void)addSubviews{
    [self addSubview:self.headLabel];
    [self addSubview:self.contentLabel];
    [self addSubview:self.line];
    [self addSubview:self.separator];
}
- (void)makeConstaits{
   
    [self.headLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(kScreenWidth, 38*kScreenHeightScale));
        make.left.mas_equalTo(0);
    }];
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(38*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(kScreenWidth, 1*kScreenHeightScale));
        make.left.mas_equalTo(0);
    }];
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(50*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(311*kScreenWidthScale, 60*kScreenHeightScale));
        make.left.mas_equalTo(31*kScreenWidthScale);
    }];
    [self.separator mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(0);
        make.left.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(kScreenWidth, 7*kScreenHeightScale));
    }];
}

- (UILabel *)headLabel{
    if (!_headLabel) {
        _headLabel = [[UILabel alloc]init];
        _headLabel.font  = [UIFont boldSystemFontOfSize:15*kScreenHeightScale];
        _headLabel.textColor = MAIN_COLOR;
        _headLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _headLabel;
}

- (UILabel *)contentLabel{
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc]init];
        _contentLabel.font = [UIFont systemFontOfSize:12*kScreenHeightScale];
        _contentLabel.numberOfLines = 0;
        _contentLabel.textColor = TITLE_COLOR;
    }
    return _contentLabel;
}
- (UIView *)line{
    if (!_line) {
        _line = [[UIView alloc]init];
        _line.backgroundColor = BACKGROUND_COLOR;
    }
    return _line;
}
- (UIView *)separator{
    if (!_separator) {
        _separator = [[UIView alloc]init];
        _separator.backgroundColor = BACKGROUND_COLOR;
    }
    return _separator;
}

-(void)setAdministrative:(Administrative *)administrative
{

    self.headLabel.text = administrative.department;
    self.contentLabel.text = @"内分泌科是医院中一个专门治疗内分泌科疾病的地方，主要负责糖尿病，肥胖症，骨质疏松，痛风，脂质代谢紊乱以及甲状腺，垂体，肾上腺，性腺，甲状腺等疾病的临床诊治";
}

@end
