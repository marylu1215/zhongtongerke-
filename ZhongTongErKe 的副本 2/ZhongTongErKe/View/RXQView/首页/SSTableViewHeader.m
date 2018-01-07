//
//  SSTableViewHeader.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/2.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSTableViewHeader.h"

@interface SSTableViewHeader ()

@property(nonatomic,strong)UIView *bottomLineView;

@end

@implementation SSTableViewHeader


- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        [self addSubViews];
        [self makeConstraits];
    }
    return self;
}
- (void)addSubViews{
    
    [self addSubview:self.label];
    [self addSubview:self.button];
    [self addSubview:self.imageView];
    [self addSubview:self.bottomLineView];
   
    
}
- (void)makeConstraits{
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {

        
        make.top.mas_equalTo(4*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(17*kScreenWidthScale, 17*kScreenHeightScale));
        make.left.mas_equalTo(8*kScreenWidthScale);
    }];
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(5*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(150*kScreenWidthScale, 15*kScreenHeightScale));
        make.left.mas_equalTo(30*kScreenWidthScale);
    }];
    [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(7*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(60*kScreenWidthScale, 11*kScreenHeightScale));
        make.right.mas_equalTo(-8*kScreenWidthScale);
    }];
    [self.bottomLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(kScreenWidth, 1*kScreenHeightScale));
        make.bottom.mas_equalTo(0);
    }];
   
}
- (UIImageView *)imageView{
    if (!_imageView) {
        _imageView = [[UIImageView alloc]init];
    }
    return _imageView;
}
- (UILabel *)label{
    if (!_label) {
        _label = [[UILabel alloc]init];
        _label.textAlignment = NSTextAlignmentLeft;
        _label.font = [UIFont systemFontOfSize:15*kScreenHeightScale];
        _label.textColor = MAIN_COLOR;
    }
    return _label;
}
- (UIButton *)button{
    if (!_button) {
        _button = [[UIButton alloc]init];
        //_button.titleLabel.textColor = MAIN_COLOR;
       // [_button setTitleColor:MAIN_COLOR forState:UIControlStateNormal];
        _button.titleLabel.font = [UIFont systemFontOfSize:12*kScreenHeightScale];
    }
    return _button;
}
- (UIView *)bottomLineView{
    if (!_bottomLineView) {
        _bottomLineView = [[UIView alloc]init];
        _bottomLineView.backgroundColor = LINE_COLOR;
    }
    return _bottomLineView;
}











/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
