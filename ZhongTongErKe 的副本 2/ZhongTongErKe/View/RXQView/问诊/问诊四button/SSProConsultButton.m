//
//  SSProConsultButton.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/12.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSProConsultButton.h"

@implementation SSProConsultButton


- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubviews];
        [self makeConstaits];
    }
    return self;
}

- (void)addSubviews{
    [self addSubview:self.headImageView];
    [self addSubview:self.headLabel];
}
- (void)makeConstaits{
     __weak typeof(self) myself = self;
    [self.headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(25*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(25*kScreenWidthScale, 25*kScreenHeightScale));
        make.left.mas_equalTo(34*kScreenWidthScale);
    }];
    [self.headLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(myself.headImageView.mas_bottom).with.offset(7*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(93*kScreenWidthScale, 12*kScreenHeightScale));
        make.left.mas_equalTo(0*kScreenWidthScale);
        
    }];
}



- (UIImageView *)headImageView{
    if (!_headImageView) {
        _headImageView = [[UIImageView alloc]init];
        
    }
    return _headImageView;
}


- (UILabel *)headLabel{
    if (!_headLabel ) {
        _headLabel = [[UILabel alloc]init];
        _headLabel.font = [UIFont boldSystemFontOfSize:12*kScreenHeightScale];
        _headLabel.textColor = TITLE_COLOR;
        _headLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _headLabel;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
