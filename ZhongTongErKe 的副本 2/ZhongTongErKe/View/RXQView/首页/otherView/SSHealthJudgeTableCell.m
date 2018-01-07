//
//  SSHealthJudgeTableCell.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/3.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSHealthJudgeTableCell.h"

@implementation SSHealthJudgeTableCell

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
    [self addSubview:self.backgroundImageView];
    [self.backgroundImageView addSubview:self.writtingImageView];
    [self.backgroundImageView addSubview:self.startButton];
}

- (void)makeConstraits{
    [self.backgroundImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(7*kScreenHeightScale);
        //make.size.mas_equalTo(CGSizeMake(306*kScreenWidthScale, 126*kScreenHeightScale));
        make.left.mas_equalTo(33*kScreenWidthScale);
        make.bottom.mas_equalTo(0);
        make.right.mas_equalTo(-33*kScreenWidthScale);
    }];
    [self.writtingImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(17*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(150*kScreenWidthScale, 22*kScreenHeightScale));
        make.left.mas_equalTo(80*kScreenWidthScale);
    }];
    [self.startButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(75*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(110*kScreenWidthScale, 26*kScreenHeightScale));
        make.left.mas_equalTo(97*kScreenWidthScale);
    }];
}






#pragma mark --lazyload
- (UIImageView *)backgroundImageView{
    if (!_backgroundImageView) {
        _backgroundImageView = [[UIImageView alloc]init];
        //_backgroundImageView.contentMode = UIViewContentModeScaleToFill;
        _backgroundImageView.userInteractionEnabled = YES;
    }
    return _backgroundImageView;
}
- (UIImageView *)writtingImageView{
    if (!_writtingImageView) {
        _writtingImageView = [[UIImageView alloc]init];
        _writtingImageView.contentMode = UIViewContentModeCenter;
    }
    return _writtingImageView;
}
- (UIButton *)startButton{
    if (!_startButton) {
        _startButton = [[UIButton alloc]init];
        //_startButton.backgroundColor = [UIColor lightGrayColor];
    }
    return _startButton;
}












@end
