//
//  SSChooseDocDefaultCell.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/11.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSChooseDocDefaultCell.h"

@interface SSChooseDocDefaultCell ()

@property (nonatomic,strong)UIView *line;
@property (nonatomic,strong)UIView *bottomFooter;


@end

@implementation SSChooseDocDefaultCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addSubviews];
        [self makeConstraits];
    }
    return  self;
}

- (void)addSubviews{
    [self addSubview:self.headImageView];
    [self addSubview:self.nameLabel];
    [self addSubview:self.describeLabel];
    [self addSubview:self.detailLabel];
    [self addSubview:self.line];
    [self addSubview:self.priceLabel];
    [self addSubview:self.checkButton];
    [self addSubview:self.bottomFooter];
}
- (void)makeConstraits{
    [self.headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(9*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(50*kScreenWidthScale, 50*kScreenHeightScale));
        make.left.mas_equalTo(15*kScreenWidthScale);
    }];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(100*kScreenWidthScale, 14*kScreenHeightScale));
        make.left.mas_equalTo(70*kScreenWidthScale);
    }];
    [self.describeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(26*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(150*kScreenWidthScale, 16*kScreenHeightScale));
        make.left.mas_equalTo(70*kScreenWidthScale);
    }];
    [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(43*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(150*kScreenWidthScale, 16*kScreenHeightScale));
        make.left.mas_equalTo(70*kScreenWidthScale);
        
    }];
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(67*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(kScreenWidth, 1*kScreenHeightScale));
        make.left.mas_equalTo(0*kScreenWidthScale);
        
    }];
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(68*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(100*kScreenWidthScale, 32*kScreenHeightScale));
        make.left.mas_equalTo(70*kScreenWidthScale);
        
    }];
    [self.checkButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(77*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(15*kScreenWidthScale, 15*kScreenHeightScale));
        make.left.mas_equalTo(330*kScreenWidthScale);
        
    }];
    [self.bottomFooter mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(100*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(kScreenWidth, 7*kScreenHeightScale));
        make.left.mas_equalTo(0*kScreenWidthScale);
        
    }];
}


- (UIImageView *)headImageView{
    if (!_headImageView) {
        _headImageView = [[UIImageView alloc]init];
    }
    return _headImageView;
}
- (UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc]init];
        _nameLabel.textColor = TITLE_COLOR;
        _nameLabel.font = [UIFont systemFontOfSize:14*kScreenHeightScale];
        //_nameLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _nameLabel;
}
- (UILabel *)describeLabel{
    if (!_describeLabel) {
        _describeLabel = [[UILabel alloc]init];
        _describeLabel.textColor = REMARK_COLOR;
        _describeLabel.font = [UIFont systemFontOfSize:12*kScreenHeightScale];
    }
    return _describeLabel;
}
- (UILabel *)detailLabel{
    if (!_detailLabel) {
        _detailLabel = [[UILabel alloc]init];
        _detailLabel.textColor = REMARK_COLOR;
        _detailLabel.font = [UIFont systemFontOfSize:12*kScreenHeightScale];
        _detailLabel.numberOfLines = 2;
    }
    return _detailLabel;
}
- (UIView *)line{
    if (!_line) {
        _line = [[UIView alloc]init];
        _line.backgroundColor = BACKGROUND_COLOR;
    }
    return _line;
}
- (UILabel *)priceLabel{
    if (!_priceLabel) {
        _priceLabel = [[UILabel alloc]init];
        _priceLabel.textColor = S_COLOR;
        _priceLabel.font = [UIFont systemFontOfSize:16*kScreenHeightScale];
    }
    return _priceLabel;
}
- (UIButton *)checkButton
{
    if (!_checkButton) {
    _checkButton = [UIButton  addBtnImage: unchooseImageName WithTarget:self action:@selector(checkAction:)];
    }
    return _checkButton;
}



- (UIView *)bottomFooter{
    if (!_bottomFooter) {
        _bottomFooter = [[UIView alloc]init];
        _bottomFooter.backgroundColor = BACKGROUND_COLOR;
    }
    return _bottomFooter;
}

-(void)checkAction:(UIButton *)btn
{
   
   if ([self.delegate respondsToSelector:@selector(handleSelectedButtonActionWithSelectedIndexPath:)]) {
            
            [self.delegate handleSelectedButtonActionWithSelectedIndexPath:self.selectedIndexPath];
        }
  
}

@end
