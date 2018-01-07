//
//  SSPhysicHeaderView.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/24.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSPhysicHeaderView.h"

@implementation SSPhysicHeaderView


- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubviews];
        [self makeConstaits];
    }
    return self;
}

- (void)addSubviews{
    [self addSubview:self.bgImageView];
    [self addSubview:self.transparentView];
    [self addSubview:self.middleView];
}
- (void)makeConstaits{
    [self.bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(kScreenWidth, 200*kScreenHeightScale));
        make.left.mas_equalTo(0);
    }];
    [self.transparentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(159*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(kScreenWidth, 41*kScreenHeightScale));
        make.left.mas_equalTo(0);
    }];
    [self.middleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(200*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(kScreenWidth, 173*kScreenHeightScale));
        make.left.mas_equalTo(0);
    }];
}




- (UIImageView *)bgImageView{
    if (!_bgImageView) {
        _bgImageView = [[UIImageView alloc]init];
    }
    return _bgImageView;
}
- (SSPhysicTransparentView *)transparentView{
    if (!_transparentView) {
        _transparentView = [[SSPhysicTransparentView alloc]init];
    }
    return _transparentView;
}
- (SSPhysicMiddleView *)middleView{
    if (!_middleView) {
        _middleView = [[SSPhysicMiddleView alloc]init];
    }
    return _middleView;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
