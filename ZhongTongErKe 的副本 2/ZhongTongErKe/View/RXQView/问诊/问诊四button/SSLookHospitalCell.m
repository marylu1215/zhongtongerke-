//
//  SSLookHospitalCell.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/18.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSLookHospitalCell.h"

@interface SSLookHospitalCell ()

@property (nonatomic,strong)UIView *separator;

@end

@implementation SSLookHospitalCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addSubviews];
        [self makeConstaits];
    }
    return self;
}

- (void)addSubviews{
    [self addSubview:self.headImageview];
    [self addSubview:self.headLabel];
    [self addSubview:self.label1];
    [self addSubview:self.label2];
    [self addSubview:self.label3];
    [self addSubview:self.arrowImageview];
    [self addSubview:self.separator];
}
- (void)makeConstaits{
    [self.headImageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(7*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(18*kScreenWidthScale, 18*kScreenHeightScale));
        make.left.mas_equalTo(7*kScreenWidthScale);
    }];
    [self.headLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(9*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(200*kScreenWidthScale, 15*kScreenHeightScale));
        make.left.mas_equalTo(30*kScreenWidthScale);
    }];
    [self.label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(32*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(200*kScreenWidthScale, 12*kScreenHeightScale));
        make.left.mas_equalTo(8*kScreenWidthScale);
    }];
    [self.label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(51*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(200*kScreenWidthScale, 12*kScreenHeightScale));
        make.left.mas_equalTo(8*kScreenWidthScale);
    }];
    [self.label3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(70*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(200*kScreenWidthScale, 12*kScreenHeightScale));
        make.left.mas_equalTo(8*kScreenWidthScale);
    }];
    [self.arrowImageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(33*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(8*kScreenWidthScale, 15*kScreenHeightScale));
        make.right.mas_equalTo(-15*kScreenWidthScale);
    }];
    [self.separator mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(0*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(kScreenWidth, 7*kScreenHeightScale));
        make.left.mas_equalTo(0*kScreenWidthScale);
    }];
}


- (UIImageView *)headImageview{
    if (!_headImageview) {
        _headImageview = [[UIImageView alloc]init];
    }
    return _headImageview;
}
- (UILabel *)headLabel{
    if (!_headLabel) {
        _headLabel = [[UILabel alloc]init];
        _headLabel.font = [UIFont systemFontOfSize:15*kScreenHeightScale];
        _headLabel.textColor = TITLE_COLOR;
    }
    return _headLabel;
}
- (UILabel *)label1{
    if (!_label1) {
        _label1 = [[UILabel alloc]init];
        _label1.font = [UIFont systemFontOfSize:12*kScreenHeightScale];
        _label1.textColor = REMARK_COLOR;
    }
    return _label1;
}
- (UILabel *)label2{
    if (!_label2) {
        _label2 = [[UILabel alloc]init];
        _label2.font = [UIFont systemFontOfSize:12*kScreenHeightScale];
        _label2.textColor = REMARK_COLOR;
    }
    return _label2;
}
-(UILabel *)label3{
    if (!_label3) {
        _label3 = [[UILabel alloc]init];
        _label3.font = [UIFont systemFontOfSize:12*kScreenHeightScale];
        _label3.textColor = REMARK_COLOR;
    }
    return _label3;
}
- (UIImageView *)arrowImageview{
    if (!_arrowImageview) {
        _arrowImageview = [[UIImageView alloc]init];
    }
    return _arrowImageview;
}
- (UIView *)separator{
    if (!_separator) {
        _separator = [[UIImageView alloc]init];
        _separator.backgroundColor = BACKGROUND_COLOR;
    }
    return _separator;
}




@end
