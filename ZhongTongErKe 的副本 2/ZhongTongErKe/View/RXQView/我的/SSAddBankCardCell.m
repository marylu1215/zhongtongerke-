//
//  SSAddBankCardCell.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/25.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSAddBankCardCell.h"

@interface SSAddBankCardCell ()

@property (nonatomic,strong)UIView *line;

@end

@implementation SSAddBankCardCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)addSubviews{
    [self addSubview:self.headImageView];
    [self addSubview:self.bankLabel];
    [self addSubview:self.lastNumberLabel];
    [self addSubview:self.line];
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addSubviews];
        [self makeConstraits];
    }
    return self;
}
- (void)makeConstraits{
    [self.headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(40*kScreenWidthScale, 40*kScreenHeightScale));
        make.left.mas_equalTo(15*kScreenWidthScale);
    }];
    [self.bankLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(200*kScreenWidthScale, 14*kScreenHeightScale));
        make.left.mas_equalTo(70*kScreenWidthScale);
    }];
    [self.lastNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(38*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(100*kScreenWidthScale, 12*kScreenHeightScale));
        make.left.mas_equalTo(70*kScreenWidthScale);
    }];
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(kScreenWidth, 1*kScreenHeightScale));
        make.left.mas_equalTo(0);
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
- (UIView *)line{
    if (!_line) {
        _line = [[UIView alloc]init];
        _line.backgroundColor = BACKGROUND_COLOR;
    }
    return _line;
}



@end
