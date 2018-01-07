//
//  SSHealthHistoryCollectionCell.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/9.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSHealthHistoryCollectionCell.h"

@implementation SSHealthHistoryCollectionCell



- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubviews];
        [self makeConstaits];
    }
    return self;
}


- (void)addSubviews{
    [self addSubview:self.bgImageView];
    [self.bgImageView addSubview:self.contentLabel];
}

- (void)makeConstaits{
    [self.bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(100*kScreenWidthScale, 25*kScreenHeightScale));
        make.left.mas_equalTo(0);
    }];
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(100*kScreenWidthScale, 25*kScreenHeightScale));
        make.left.mas_equalTo(0);
    }];
}








- (UIImageView *)bgImageView{
    if (!_bgImageView) {
        _bgImageView = [[UIImageView alloc]init];
    }
    return  _bgImageView;
}
- (UILabel *)contentLabel{
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc]init];
        _contentLabel.font = [UIFont systemFontOfSize:12*kScreenHeightScale];
        _contentLabel.textAlignment = NSTextAlignmentCenter;
        _contentLabel.textColor = TITLE_COLOR;
    }
    return _contentLabel;
    
}






@end
