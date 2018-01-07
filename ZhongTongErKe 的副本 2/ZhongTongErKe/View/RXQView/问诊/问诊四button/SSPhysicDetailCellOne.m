//
//  SSPhysicDetailCellOne.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/24.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSPhysicDetailCellOne.h"

@interface SSPhysicDetailCellOne ()

@property (nonatomic,strong)UIView *line;

@end

@implementation SSPhysicDetailCellOne

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
    [self addSubview:self.headImageView];
    [self addSubview:self.phoneLabel];
    [self addSubview:self.judgeLabel];
    [self addSubview:self.contentLabel];
    [self addSubview:self.line];
}
- (void)makeConstaits{
    [self.headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(12*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(25*kScreenWidthScale, 25*kScreenHeightScale));
        make.left.mas_equalTo(8*kScreenWidthScale);
    }];
    [self.phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(16*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(70*kScreenWidthScale, 10*kScreenHeightScale));
        make.left.mas_equalTo(35*kScreenWidthScale);
    }];
    [self.judgeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(15*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(50*kScreenWidthScale, 12*kScreenHeightScale));
        make.left.mas_equalTo(210*kScreenWidthScale);
    }];
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(38*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(300*kScreenWidthScale, 12*kScreenHeightScale));
        make.left.mas_equalTo(53*kScreenWidthScale);
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
- (UILabel *)phoneLabel{
    if (!_phoneLabel) {
        _phoneLabel = [[UILabel alloc]init];
        _phoneLabel.textColor = REMARK_COLOR;
        _phoneLabel.font = [UIFont systemFontOfSize:10*kScreenHeightScale];
        _phoneLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _phoneLabel;
}
- (UILabel *)judgeLabel{
    if (!_judgeLabel) {
        _judgeLabel = [[UILabel alloc]init];
        _judgeLabel.font = [UIFont systemFontOfSize:12*kScreenHeightScale];
        _judgeLabel.textColor = S_COLOR;
    }
    return _judgeLabel;
}
- (UILabel *)contentLabel{
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc]init];
        _contentLabel.font = [UIFont systemFontOfSize:12*kScreenHeightScale];
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

@end
