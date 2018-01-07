//
//  SSWonderfulAnswerCell.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/25.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSWonderfulAnswerCell.h"

@interface SSWonderfulAnswerCell ()

@property (nonatomic,strong)UIView *bottomLine;

@end

@implementation SSWonderfulAnswerCell

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
    [self addSubview:self.tagImageView1];
    [self addSubview:self.tagImageView2];
    [self addSubview:self.headLabel];
    [self addSubview:self.headImageView];
    [self addSubview:self.phoneLabel];
    [self addSubview:self.contentLabel];
    [self addSubview:self.goodImageView];
    [self addSubview:self.goodLabel];
    [self addSubview:self.clockImageView];
    [self addSubview:self.clockLabel];
    [self addSubview:self.bottomLine];
}
- (void)makeConstaits{
    [self.tagImageView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(9*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(30*kScreenWidthScale, 15*kScreenHeightScale));
        make.left.mas_equalTo(7*kScreenWidthScale);
    }];
    [self.tagImageView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(9*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(30*kScreenWidthScale, 15*kScreenHeightScale));
        make.left.mas_equalTo(45*kScreenWidthScale);
    }];
    [self.headLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(7*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(280*kScreenWidthScale, 15*kScreenHeightScale));
        make.left.mas_equalTo(77*kScreenWidthScale);
    }];
    [self.headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(26*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(25*kScreenWidthScale, 25*kScreenHeightScale));
        make.left.mas_equalTo(7*kScreenWidthScale);
    }];
    [self.phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(37*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(200*kScreenWidthScale, 10*kScreenHeightScale));
        make.left.mas_equalTo(40*kScreenWidthScale);
    }];
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(61*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(360*kScreenWidthScale, 60*kScreenHeightScale));
        make.left.mas_equalTo(7*kScreenWidthScale);
    }];
    [self.goodImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(139*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(15*kScreenWidthScale, 15*kScreenHeightScale));
        make.left.mas_equalTo(15*kScreenWidthScale);
    }];
    [self.goodLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(141*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(80*kScreenWidthScale, 12*kScreenHeightScale));
        make.left.mas_equalTo(35*kScreenWidthScale);
    }];
    [self.clockImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(139*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(15*kScreenWidthScale, 15*kScreenHeightScale));
        make.left.mas_equalTo(156*kScreenWidthScale);
    }];
    [self.clockLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(141*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(150*kScreenWidthScale, 12*kScreenHeightScale));
        make.left.mas_equalTo(175*kScreenWidthScale);
    }];
    [self.bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(kScreenWidth, 1*kScreenHeightScale));
        make.left.mas_equalTo(0);
    }];
    
}




- (UIImageView *)tagImageView1{
    if (!_tagImageView1) {
        _tagImageView1 = [[UIImageView alloc]init];
    }
    return _tagImageView1;
}
- (UIImageView *)tagImageView2{
    if (!_tagImageView2) {
        _tagImageView2 = [[UIImageView alloc]init];
    }
    return _tagImageView2;
}
- (UILabel *)headLabel{
    if (!_headLabel) {
        _headLabel = [[UILabel alloc]init];
        _headLabel.font = [UIFont systemFontOfSize:15*kScreenHeightScale];
        _headLabel.textColor = TITLE_COLOR;
    }
    return _headLabel;
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
        _phoneLabel.font = [UIFont systemFontOfSize:10*kScreenHeightScale];
        _phoneLabel.textColor = REMARK_COLOR;
    }
    return _phoneLabel;
}
- (UILabel *)contentLabel{
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc]init];
        _contentLabel.font = [UIFont systemFontOfSize:12*kScreenHeightScale];
        _contentLabel.textColor = TITLE_COLOR;
        _contentLabel.numberOfLines = 0;
    }
    return _contentLabel;
}
- (UIImageView *)goodImageView{
    if (!_goodImageView) {
        _goodImageView = [[UIImageView alloc]init];
    }
    return _goodImageView;
}
- (UILabel *)goodLabel{
    if (!_goodLabel) {
        _goodLabel = [[UILabel alloc]init];
        _goodLabel.font = [UIFont systemFontOfSize:12*kScreenHeightScale];
        _goodLabel.textColor = TITLE_COLOR;
    }
    return _goodLabel;
}
- (UIImageView *)clockImageView{
    if (!_clockImageView) {
        _clockImageView = [[UIImageView alloc]init];
        
    }
    return _clockImageView;
}
- (UILabel *)clockLabel{
    if (!_clockLabel) {
        _clockLabel = [[UILabel alloc]init];
        _clockLabel.font = [UIFont systemFontOfSize:12*kScreenHeightScale];
        _clockLabel.textColor = TITLE_COLOR;
    }
    return _clockLabel;
}
- (UIView *)bottomLine{
    if (!_bottomLine) {
        _bottomLine = [[UIView alloc]init];
        _bottomLine.backgroundColor = BACKGROUND_COLOR;
    }
    return _bottomLine;
}





@end
