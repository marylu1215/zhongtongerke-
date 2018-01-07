//
//  SSMyCollectionVideoCell.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/29.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSMyCollectionVideoCell.h"

@interface SSMyCollectionVideoCell ()

@property (nonatomic,strong)UIView *topSeparator;

@end

@implementation SSMyCollectionVideoCell

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
    [self addSubview:self.topSeparator];
    [self addSubview:self.headImageView];
    [self addSubview:self.headLabel];
    [self addSubview:self.checkImageView];
    [self addSubview:self.checkLabel];
    [self addSubview:self.colletionImageView];
    [self addSubview:self.collectionLabel];
   
}
- (void)makeConstaits{
    [self.topSeparator mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(kScreenWidth, 7*kScreenHeightScale));
        make.left.mas_equalTo(0*kScreenWidthScale);
    }];
    [self.headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(12*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(90*kScreenWidthScale, 75*kScreenHeightScale));
        make.left.mas_equalTo(0*kScreenWidthScale);
    }];
    [self.headLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(15*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(255*kScreenWidthScale, 40*kScreenHeightScale));
        make.left.mas_equalTo(95*kScreenWidthScale);
        
    }];
        [self.checkImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(74*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(15*kScreenWidthScale, 10*kScreenHeightScale));
        make.left.mas_equalTo(213*kScreenWidthScale);
        
    }];
    [self.checkLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(73*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(52*kScreenWidthScale, 12*kScreenHeightScale));
        make.left.mas_equalTo(232*kScreenWidthScale);
        
    }];
    [self.colletionImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(74*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(15*kScreenWidthScale, 13*kScreenHeightScale));
        make.left.mas_equalTo(292*kScreenWidthScale);
        
    }];
    [self.collectionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(73*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(52*kScreenWidthScale, 12*kScreenHeightScale));
        make.left.mas_equalTo(311*kScreenWidthScale);
        
    }];
    
}


#pragma mark --lazyload
- (UIView *)topSeparator{
    if (!_topSeparator) {
        _topSeparator = [[UIView alloc]init];
        _topSeparator.backgroundColor = BACKGROUND_COLOR;
    }
    return _topSeparator;
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
        _headLabel.numberOfLines = 0;
    }
    return _headLabel;
}

- (UIImageView *)checkImageView{
    if (!_checkImageView) {
        _checkImageView = [[UIImageView alloc]init];
        
    }
    return _checkImageView;
}
- (UILabel *)checkLabel{
    if (!_checkLabel) {
        _checkLabel = [[UILabel alloc]init];
        _checkLabel.font = [UIFont systemFontOfSize:12*kScreenHeightScale];
        _checkLabel.textColor = TITLE_COLOR;
    }
    return _checkLabel;
}
- (UIImageView *)colletionImageView{
    if (!_colletionImageView) {
        _colletionImageView = [[UIImageView alloc]init];
    }
    return _colletionImageView;
}
- (UILabel *)collectionLabel{
    if (!_collectionLabel) {
        _collectionLabel = [[UILabel alloc]init];
        _collectionLabel.font = [UIFont systemFontOfSize:12*kScreenHeightScale];
        _collectionLabel.textColor = TITLE_COLOR;
    }
    return _collectionLabel;
}


@end
