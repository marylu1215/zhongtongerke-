//
//  SSPersonalFileTableCell.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/5.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSPersonalFileTableCell.h"

@interface SSPersonalFileTableCell ()

@property(nonatomic,strong)UIView *bottomLineView;

@end

@implementation SSPersonalFileTableCell

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
        [self addSubViews];
        [self makeConstaits];
    }
    return self;
}

- (void)addSubViews{
    [self addSubview:self.headImageView];
    [self addSubview:self.headLabel];
    [self addSubview:self.detailImageView];
    [self addSubview:self.bottomLineView];
}
- (void)makeConstaits{
    [self.headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(12*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(16*kScreenWidthScale, 16*kScreenHeightScale));
        make.left.mas_equalTo(7*kScreenWidthScale);
    }];
    [self.headLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(12*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(300*kScreenWidthScale, 16*kScreenHeightScale));
        make.left.mas_equalTo(30*kScreenWidthScale);
    }];
    [self.detailImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(12*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(16*kScreenWidthScale, 16*kScreenHeightScale));
        make.right.mas_equalTo(-20*kScreenWidthScale);
    }];
    [self.bottomLineView mas_makeConstraints:^(MASConstraintMaker *make) {
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
        _headLabel.font = [UIFont systemFontOfSize:14*kScreenHeightScale];
        _headLabel.textColor = TITLE_COLOR;
    }
    return _headLabel;
}
- (UIImageView *)detailImageView{
    if (!_detailImageView) {
        _detailImageView = [[UIImageView alloc]init];
    }
    return _detailImageView;
}
- (UIView *)bottomLineView{
    if (!_bottomLineView) {
        _bottomLineView = [[UIView alloc]init];
        _bottomLineView.backgroundColor = BACKGROUND_COLOR;    }
    return _bottomLineView;
}





@end
