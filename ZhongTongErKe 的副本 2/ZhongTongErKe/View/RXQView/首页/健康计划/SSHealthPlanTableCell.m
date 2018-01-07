//
//  SSHealthPlanTableCell.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/5.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSHealthPlanTableCell.h"

@implementation SSHealthPlanTableCell

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
        [self makeConstraits];
    }
    return self;
}

- (void)addSubViews{

    [self addSubview:self.bgImageView];
    [self addSubview:self.headLabel];
    [self addSubview:self.starPlanButton];
}
- (void)makeConstraits{

 
    [self.bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(7*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(345*kScreenWidthScale, 100*kScreenHeightScale));
        make.left.mas_equalTo(15*kScreenWidthScale);
    }];
    [self.headLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(30*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(180*kScreenWidthScale, 15*kScreenHeightScale));
        make.left.mas_equalTo(175*kScreenWidthScale);
    }];
    [self.starPlanButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(62*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(100*kScreenWidthScale, 25*kScreenHeightScale));
        make.left.mas_equalTo(188*kScreenWidthScale);
    }];
}





- (UIImageView *)bgImageView{
    if (!_bgImageView) {
        _bgImageView = [[UIImageView alloc]init];
    }
    return _bgImageView;
}
- (UILabel *)headLabel{
    if (!_headLabel) {
        _headLabel = [[UILabel alloc]init];
        _headLabel.font = [UIFont systemFontOfSize:15*kScreenHeightScale];
        _headLabel.textColor = TITLE_COLOR;
        
    }
    return _headLabel;
}
- (UIButton *)starPlanButton{
    if (!_starPlanButton) {
        _starPlanButton = [[UIButton alloc]init];
    }
    return _starPlanButton;
}



@end
