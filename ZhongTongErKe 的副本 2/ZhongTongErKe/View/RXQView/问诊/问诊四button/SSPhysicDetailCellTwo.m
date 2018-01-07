//
//  SSPhysicDetailCellTwo.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/24.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSPhysicDetailCellTwo.h"

@interface SSPhysicDetailCellTwo ()

@property (nonatomic,strong)UIView *line;

@end

@implementation SSPhysicDetailCellTwo

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
    [self addSubview:self.headLabel];
    [self addSubview:self.priceLabel];
    [self addSubview:self.doorPriceLabel];
    [self addSubview:self.arrowImageView];
    [self addSubview:self.line];
    
}

- (void)makeConstaits{
    [self.headLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(7*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(300*kScreenWidthScale, 15*kScreenHeightScale));
        make.left.mas_equalTo(8*kScreenWidthScale);
    }];
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(29*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(44*kScreenWidthScale, 12*kScreenHeightScale));
        make.left.mas_equalTo(8*kScreenWidthScale);
    }];
    [self.doorPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(29*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(200*kScreenWidthScale, 12*kScreenHeightScale));
        make.left.mas_equalTo(52*kScreenWidthScale);
    }];
    [self.arrowImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(16*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(8*kScreenWidthScale, 15*kScreenHeightScale));
        make.left.mas_equalTo(-15*kScreenWidthScale);
    }];
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(0*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(kScreenWidth, 1*kScreenHeightScale));
        make.left.mas_equalTo(0*kScreenWidthScale);
    }];
}


- (UILabel *)headLabel{
    if (!_headLabel) {
        _headLabel = [[UILabel alloc]init];
        _headLabel.font = [UIFont systemFontOfSize:15*kScreenHeightScale];
        _headLabel.textColor = TITLE_COLOR;
    }
    return _headLabel;
}
- (UILabel *)priceLabel{
    if (!_priceLabel) {
        _priceLabel = [[UILabel alloc]init];
        _priceLabel.font  = [UIFont systemFontOfSize:12*kScreenHeightScale];
        _priceLabel.textColor = S_COLOR;
    }
    return _priceLabel;
}
- (UILabel *)doorPriceLabel{
    if (!_doorPriceLabel) {
        _doorPriceLabel = [[UILabel alloc]init];
        _doorPriceLabel.font = [UIFont systemFontOfSize:12*kScreenHeightScale];
        _doorPriceLabel.textColor = REMARK_COLOR;
    }
    return _doorPriceLabel;
}
- (UIImageView *)arrowImageView{
    if (!_arrowImageView) {
        _arrowImageView = [[UIImageView alloc]init];
    }
    return _arrowImageView;
}
- (UIView *)line{
    if (!_line) {
        _line = [[UIView alloc]init];
        _line.backgroundColor = BACKGROUND_COLOR;
    }
    return _line;
}



@end
