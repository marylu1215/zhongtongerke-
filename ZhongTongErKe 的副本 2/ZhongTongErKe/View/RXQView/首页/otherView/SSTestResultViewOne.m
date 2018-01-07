//
//  SSTestResultViewOne.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/4.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSTestResultViewOne.h"

@interface SSTestResultViewOne ()

@property (nonatomic,strong)UIView *separatorLineView;

@end

@implementation SSTestResultViewOne


- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubviews];
        [self makeConstraits];
    }
    return self;
}

- (void)addSubviews{
    [self addSubview:self.reportLabel];
    [self addSubview:self.separatorLineView];
    [self addSubview:self.contentLabel];
    [self addSubview:self.againButton];
}
- (void)makeConstraits{
    [self.reportLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(300*kScreenWidthScale, 32*kScreenHeightScale));
        make.left.mas_equalTo(15*kScreenWidthScale);
    }];
    [self.separatorLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(32*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(kScreenWidth, 1*kScreenHeightScale));
        make.left.mas_equalTo(0);
    }];
   
    
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(65*kScreenHeightScale);
       
        make.left.mas_equalTo(20*kScreenWidthScale);
        make.right.mas_equalTo(-20*kScreenWidthScale);
     
    }];
    [self.againButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(217*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(200*kScreenWidthScale, 25*kScreenHeightScale));
        make.left.mas_equalTo(88*kScreenWidthScale);

    }];
}

- (UILabel *)reportLabel{
    if (!_reportLabel) {
        _reportLabel = [[UILabel alloc]init];
        _reportLabel.font = [UIFont systemFontOfSize:14*kScreenHeightScale];
        _reportLabel.textColor = MAIN_COLOR;
    }
    return _reportLabel;
}
- (UIView *)separatorLineView{
    if (!_separatorLineView) {
        _separatorLineView = [[UIView alloc]init];
        _separatorLineView.backgroundColor = BACKGROUND_COLOR;
    }
    return _separatorLineView;
}
- (UILabel *)contentLabel{
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc]init];
        _contentLabel.font = [UIFont systemFontOfSize:12*kScreenHeightScale];
        _contentLabel.numberOfLines = 0;
        _contentLabel.textColor = TITLE_COLOR;
    }
    return _contentLabel;
}
- (UIButton *)againButton{
    if (!_againButton) {
        _againButton = [[UIButton alloc]init];
    }
    return _againButton;
}






@end
