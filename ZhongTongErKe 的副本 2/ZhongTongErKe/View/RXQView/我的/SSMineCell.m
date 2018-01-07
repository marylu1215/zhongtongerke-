//
//  SSMineCell.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/24.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSMineCell.h"

@interface SSMineCell ()

@property (nonatomic,strong)UIView *line;

@end

@implementation SSMineCell

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
        [self makeConstraits];
    }
    return self;
}

- (void)addSubviews{
    [self addSubview:self.headImageView];
    [self addSubview:self.headLabel];
    [self addSubview:self.arrowImageView];
    [self addSubview:self.line];
}
- (void)makeConstraits{
    [self.headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(13*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(15*kScreenWidthScale, 15*kScreenHeightScale));
        make.left.mas_equalTo(7*kScreenWidthScale);
    }];
    [self.headLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(200*kScreenWidthScale, 40*kScreenHeightScale));
        make.left.mas_equalTo(28*kScreenWidthScale);
    }];
    [self.arrowImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(13*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(7*kScreenWidthScale, 13*kScreenHeightScale));
        make.right.mas_equalTo(-15*kScreenWidthScale);

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
- (UILabel *)headLabel{
    if (!_headLabel) {
        _headLabel = [[UILabel alloc]init];
        _headLabel.font = [UIFont systemFontOfSize:15*kScreenHeightScale];
        _headLabel.textColor = TITLE_COLOR;
    }
    return _headLabel;
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
