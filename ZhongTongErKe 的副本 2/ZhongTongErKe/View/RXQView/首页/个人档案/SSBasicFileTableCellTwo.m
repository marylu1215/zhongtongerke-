//
//  SSBasicFileTableCellTwo.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/5.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSBasicFileTableCellTwo.h"

@interface SSBasicFileTableCellTwo ()

@property (nonatomic,strong)UIView *bottomLineView;

@end

@implementation SSBasicFileTableCellTwo

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
    [self addSubview:self.headLabel];
    [self addSubview:self.button1];
    [self addSubview:self.button2];
    [self addSubview:self.button3];
    [self addSubview:self.button4];
    [self addSubview:self.button5];
    [self addSubview:self.button6];
    [self addSubview:self.bottomLineView];
}
- (void)makeConstaits{
    [self.headLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(350*kScreenWidthScale, 22*kScreenHeightScale));
        make.left.mas_equalTo(15*kScreenWidthScale);
    }];
    [self.button1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(32*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(100*kScreenWidthScale, 25*kScreenHeightScale));
        make.left.mas_equalTo(63*kScreenWidthScale);
    }];
    [self.button2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(32*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(100*kScreenWidthScale, 25*kScreenHeightScale));
        make.left.mas_equalTo(213*kScreenWidthScale);
    }];
    [self.button3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(67*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(100*kScreenWidthScale, 25*kScreenHeightScale));
        make.left.mas_equalTo(63*kScreenWidthScale);
    }];
    [self.button4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(67*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(100*kScreenWidthScale, 25*kScreenHeightScale));
        make.left.mas_equalTo(213*kScreenWidthScale);
    }];
    [self.button5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(102*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(100*kScreenWidthScale, 25*kScreenHeightScale));
        make.left.mas_equalTo(63*kScreenWidthScale);
    }];
    [self.button6 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(102*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(100*kScreenWidthScale, 25*kScreenHeightScale));
        make.left.mas_equalTo(213*kScreenWidthScale);
    }];
    [self.bottomLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(kScreenWidth, 1*kScreenHeightScale));
        make.left.mas_equalTo(0);
    }];
    
}



#pragma mark --lazyload
- (UILabel *)headLabel{
    if (!_headLabel) {
        _headLabel = [[UILabel alloc]init];
        _headLabel.font = [UIFont systemFontOfSize:12*kScreenHeightScale];
        _headLabel.textColor = TITLE_COLOR;
        
    }
    return _headLabel;
}
- (SSBasicFileButton *)button1{
    if (!_button1) {
        _button1 = [[SSBasicFileButton alloc]init];
        
    }
    return _button1;
}
- (SSBasicFileButton *)button2{
    if (!_button2) {
        _button2 = [[SSBasicFileButton alloc]init];
        
    }
    return _button2;
}
- (SSBasicFileButton *)button3{
    if (!_button3) {
        _button3 = [[SSBasicFileButton alloc]init];
        
    }
    return _button3;
}
- (SSBasicFileButton *)button4{
    if (!_button4) {
        _button4 = [[SSBasicFileButton alloc]init];
        
    }
    return _button4;
}
- (SSBasicFileButton *)button5{
    if (!_button5) {
        _button5 = [[SSBasicFileButton alloc]init];
        
    }
    return _button5;
}
- (SSBasicFileButton *)button6{
    if (!_button6) {
        _button6 = [[SSBasicFileButton alloc]init];
        
    }
    return _button6;
}
- (UIView *)bottomLineView{
    if (!_bottomLineView) {
        _bottomLineView = [[UIView alloc]init];
        _bottomLineView.backgroundColor = BACKGROUND_COLOR;
    }
    return _bottomLineView;
}








@end
