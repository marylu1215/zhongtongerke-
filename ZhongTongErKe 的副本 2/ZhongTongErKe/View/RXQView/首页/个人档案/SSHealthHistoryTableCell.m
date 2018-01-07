//
//  SSHealthHistoryTableCell.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/6.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSHealthHistoryTableCell.h"

@interface SSHealthHistoryTableCell ()


@end

@implementation SSHealthHistoryTableCell

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
    [self addSubview:self.bgImageView];
    [self addSubview:self.line];
    [self addSubview:self.nameLabel];
    [self addSubview:self.memberLabel];
}
- (void)makeConstaits{
    [self.bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(7*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(345*kScreenWidthScale, 73*kScreenHeightScale));
        make.left.mas_equalTo(15*kScreenWidthScale);

    }];
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(7*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(1*kScreenWidthScale, 73*kScreenHeightScale));
        make.left.mas_equalTo(101*kScreenWidthScale);

    }];
    [self.memberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(7*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(70*kScreenWidthScale, 73*kScreenHeightScale));
        make.left.mas_equalTo(30*kScreenWidthScale);

    }];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(7*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(256*kScreenWidthScale, 73*kScreenHeightScale));
        make.left.mas_equalTo(103*kScreenWidthScale);

    }];
}


- (UIImageView *)bgImageView{
    if (!_bgImageView) {
        _bgImageView = [[UIImageView alloc]init];
    }
    return _bgImageView;

}
- (UILabel *)memberLabel{
    if (!_memberLabel) {
        _memberLabel = [[UILabel alloc]init];
        _memberLabel.font = [UIFont systemFontOfSize:14*kScreenHeightScale];
        _memberLabel.textAlignment = NSTextAlignmentCenter;
        _memberLabel.textColor = TITLE_COLOR;

    }
    return _memberLabel;
}
- (UIImageView *)line{
    if (!_line) {
        _line = [[UIImageView alloc]init];
            }
    return _line;
}
- (UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc]init];
        _nameLabel.textAlignment = NSTextAlignmentCenter;
        _nameLabel.font = [UIFont systemFontOfSize:14*kScreenHeightScale];
        _nameLabel.textColor = TITLE_COLOR;
    }
    return _nameLabel;
}





@end
