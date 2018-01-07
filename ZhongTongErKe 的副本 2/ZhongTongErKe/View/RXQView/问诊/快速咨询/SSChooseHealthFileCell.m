//
//  SSChooseHealthFileCell.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/10.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSChooseHealthFileCell.h"

@interface SSChooseHealthFileCell ()

@property (nonatomic,strong) UIImageView *bgImageView;
@property (nonatomic,strong) UILabel *headLabel;
@property (nonatomic,strong) UIImageView *line;
@property (nonatomic,strong) UILabel *contentLabel;
@property (nonatomic,strong) UILabel *remarkLabel;


@end


@implementation SSChooseHealthFileCell



- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = c240240240;
        [self addSubviews];
        [self makeConstaits];
    }
    return  self;
}

- (void)addSubviews{
    
    [self addSubview:self.bgImageView];
    [self addSubview:self.headLabel];
    [self addSubview:self.line];
    [self addSubview:self.contentLabel];
    [self addSubview:self.remarkLabel];
    [self addSubview:self.checkButton];
}
- (void)makeConstaits{

    
    [self.bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(345*kScreenWidthScale, 75*kScreenHeightScale));
        make.left.mas_equalTo(15*kScreenWidthScale);
    }];
    [self.headLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(71*kScreenWidthScale, 75*kScreenHeightScale));
        make.left.mas_equalTo(30*kScreenWidthScale);
    }];
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(1*kScreenWidthScale, 55*kScreenHeightScale));
        make.left.mas_equalTo(101*kScreenWidthScale);
    }];
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(80*kScreenWidthScale, 75*kScreenHeightScale));
        make.left.mas_equalTo(120*kScreenWidthScale);
    }];
    [self.remarkLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(80*kScreenWidthScale, 75*kScreenHeightScale));
        make.left.mas_equalTo(205*kScreenWidthScale);
    }];
    [self.checkButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(28*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(20*kScreenWidthScale, 20*kScreenHeightScale));
        make.left.mas_equalTo(310*kScreenWidthScale);
    }];
}



- (UILabel *)headLabel{
    if (!_headLabel) {
        _headLabel = [[UILabel alloc]init];
        _headLabel.textColor = TITLE_COLOR;
        _headLabel.font = [UIFont systemFontOfSize:14*kScreenHeightScale];
        _headLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _headLabel;
}
- (UIImageView *)bgImageView{
    if (!_bgImageView) {
        _bgImageView = [[UIImageView alloc]init];
    }
    return _bgImageView;
}
- (UIImageView *)line{
    if (!_line) {
        _line = [[UIImageView alloc]init];
    }
    return _line;
}
- (UILabel *)contentLabel{
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc]init];
        _contentLabel.font = [UIFont systemFontOfSize:14*kScreenHeightScale];
        _contentLabel.textColor = TITLE_COLOR;
    }
    return _contentLabel;
}
- (UILabel *)remarkLabel{
    if (!_remarkLabel) {
        _remarkLabel = [[UILabel alloc]init];
        _remarkLabel.font = [UIFont systemFontOfSize:12*kScreenHeightScale];
        _remarkLabel.textColor = REMARK_COLOR;
    }
    return _remarkLabel;
}
- (UIButton *)checkButton{
    if (!_checkButton) {
       
        _checkButton = [UIButton  addBtnImage:unchooseImageName WithTarget:self action:@selector(checkAction:)];
      
    }
    return _checkButton;
}

-(void)setFamilyGroup:(FamilyGroup *)familyGroup
{
    _familyGroup = familyGroup;
    if ([familyGroup.sex isEqualToString:@"0"]) {
        
        self.bgImageView.image = [UIImage imageNamed:basicFile_malebg];
    }
    else
    {
         self.bgImageView.image = [UIImage imageNamed:basicFile_femalebg];
    }
    
    self.headLabel.text = familyGroup.cid;
    self.contentLabel.text = familyGroup.nikename;
    self.remarkLabel.text = [NSString stringWithFormat:@"(%@ %@)",familyGroup.sex,familyGroup.year];
    
    self.line.image = [UIImage imageNamed:healthTask_line];
}

-(void)checkAction:(UIButton *)btn
{
    if ([self.delegate respondsToSelector:@selector(handleSelectedButtonActionWithSelectedIndexPath:)]) {
        
        [self.delegate handleSelectedButtonActionWithSelectedIndexPath:self.selectedIndexPath];
    }
}
@end
