//
//  SSBasicFileSectionViewTwo.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/6.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSBasicFileSectionViewTwo.h"

@interface SSBasicFileSectionViewTwo ()

@property (nonatomic,strong)UIView *topBgView;

@property (nonatomic,strong)UIView *bottomLineView;

@end

@implementation SSBasicFileSectionViewTwo

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubViews];
        [self makeConstaits];
    }
    return self;
}

- (void)addSubViews{
    [self addSubview:self.topBgView];
    [self addSubview:self.headLabel];
    [self addSubview:self.bottomLineView];
}

- (void)makeConstaits{
    [self.topBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(kScreenWidth, 7*kScreenHeightScale));
        make.left.mas_equalTo(0);
    }];
    [self.headLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(7*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(300*kScreenWidthScale, 32*kScreenHeightScale));
        make.left.mas_equalTo(15*kScreenWidthScale);
    }];
    [self.bottomLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(kScreenWidth, 1*kScreenHeightScale));
        make.left.mas_equalTo(0);
    }];
}


- (UILabel *)headLabel{
    if (!_headLabel) {
        _headLabel = [[UILabel alloc]init];
        _headLabel.font = [UIFont systemFontOfSize:14*kScreenHeightScale];
        _headLabel.textColor = MAIN_COLOR;
    }
    return _headLabel;
}
- (UIView *)topBgView{
    if (!_topBgView) {
        _topBgView = [[UIView alloc]init];
        _topBgView.backgroundColor = BACKGROUND_COLOR;
    }
    return _topBgView;
}
- (UIView *)bottomLineView{
    if (!_bottomLineView) {
        _bottomLineView = [[UIView alloc]init];
        _bottomLineView.backgroundColor = BACKGROUND_COLOR;
    }
    return _bottomLineView;
}




@end
