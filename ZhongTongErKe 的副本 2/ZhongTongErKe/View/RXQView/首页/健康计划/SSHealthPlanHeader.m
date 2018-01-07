//
//  SSHealthPlanHeader.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/5.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSHealthPlanHeader.h"

@implementation SSHealthPlanHeader

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubViews];
        [self makeConstaits];
    }
    return  self;
}


- (void)addSubViews{
    [self addSubview:self.headImageView];
    [self addSubview:self.plancalenderButton];
    [self addSubview:self.line1];
    [self addSubview:self.addPlanButton];
    [self addSubview:self.line2];
    [self addSubview:self.completePlanButton];
}

- (void)makeConstaits{
    [self.headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(kScreenWidth, 204*kScreenHeightScale));
        make.left.mas_equalTo(0);
    }];
    [self.plancalenderButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(212*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(52*kScreenWidthScale, 52*kScreenHeightScale));
        make.left.mas_equalTo(37*kScreenWidthScale);
    }];
    [self.line1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(214*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(1*kScreenWidthScale, 45*kScreenHeightScale));
        make.left.mas_equalTo(125*kScreenWidthScale);
    }];
    [self.addPlanButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(212*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(52*kScreenWidthScale, 52*kScreenHeightScale));
        make.left.mas_equalTo(162*kScreenWidthScale);
    }];
    [self.line2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(214*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(1*kScreenWidthScale, 45*kScreenHeightScale));
        make.left.mas_equalTo(250*kScreenWidthScale);
    }];
    [self.completePlanButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(212*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(52*kScreenWidthScale, 52*kScreenHeightScale));
        make.left.mas_equalTo(287*kScreenWidthScale);
    }];
}





- (LMImageView *)headImageView{
    if (!_headImageView) {
        _headImageView = [[LMImageView alloc]init];
    }
    return _headImageView;
}
- (SSHealthPlanButton *)plancalenderButton{
    if (!_plancalenderButton) {
        _plancalenderButton = [[SSHealthPlanButton alloc]init];
    }
    return _plancalenderButton;
}
- (UIImageView *)line1{
    if (!_line1) {
        _line1 = [[UIImageView alloc]init];
    }
    return _line1;
}
- (SSHealthPlanButton *)addPlanButton{
    if (!_addPlanButton) {
        _addPlanButton = [[SSHealthPlanButton alloc]init];
    }
    return _addPlanButton;
}
- (UIImageView *)line2{
    if (!_line2) {
        _line2 = [[UIImageView alloc]init];
    }
    return _line2;
}
- (SSHealthPlanButton *)completePlanButton{
    if (!_completePlanButton) {
        _completePlanButton = [[SSHealthPlanButton alloc]init];
    }
    return _completePlanButton;
}







/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
