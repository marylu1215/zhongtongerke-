//
//  SSAccountHeader.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/24.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSAccountHeader.h"

@interface SSAccountHeader ()

@property (nonatomic,strong)UIView *bgImgeView;
@property (nonatomic,strong)UIView *bottomSeparator;
@property (nonatomic ,strong) UIButton *backBtn;

@end

@implementation SSAccountHeader

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = cHBColor;
        [self addSubviews];
        [self makeConstraits];
    }
    return self;
}

- (void)addSubviews{
    
   
   
    [self addSubview:self.bgImgeView];
    self.backBtn = [UIButton addBtnImage:index_backImageName WithTarget:self action:@selector(actionBack)];
    [self.bgImgeView addSubview: self.backBtn];
    self.backBtn.sd_layout.widthIs(self.backBtn.imageView.image.size.width).heightIs( self.backBtn.imageView.image.size.height).leftSpaceToView(self.bgImgeView,px(30)).topSpaceToView(self.bgImgeView,20+(NavBar_Height-self.backBtn.imageView.image.size.height)/2.0);
    [self addSubview:self.headLabel];
    [self addSubview:self.contentLabel];
    [self addSubview:self.bottomSeparator];
}
- (void)makeConstraits{
    [self.bgImgeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(kScreenWidth, 156*kScreenHeightScale));
        make.left.mas_equalTo(0);
    }];
    [self.headLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(NavBar_Height+26*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(200*kScreenWidthScale, 15*kScreenHeightScale));
        make.left.mas_equalTo(15*kScreenWidthScale);

    }];
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo( NavBar_Height+60*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(200*kScreenWidthScale, 78*kScreenHeightScale));
        make.left.mas_equalTo(15*kScreenWidthScale);

    }];
    [self.bottomSeparator mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(kScreenWidth, 7*kScreenHeightScale));
        make.left.mas_equalTo(0);
    }];
}


- (UIView *)bgImgeView{
    if (!_bgImgeView) {
        _bgImgeView = [[UIView alloc]init];
        _bgImgeView.backgroundColor = MAIN_COLOR;
    }
    return _bgImgeView;
}
- (UILabel *)headLabel{
    if (!_headLabel) {
        _headLabel = [[UILabel alloc]init];
        _headLabel.font = [UIFont systemFontOfSize:15*kScreenHeightScale];
        _headLabel.textColor = [UIColor whiteColor];
    }
    return _headLabel;
}
- (UILabel *)contentLabel{
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc]init];
        _contentLabel.font = [UIFont systemFontOfSize:78*kScreenHeightScale];
        _contentLabel.textColor = [UIColor whiteColor];
    }
    return _contentLabel;
}
- (UIView *)bottomSeparator{
    if (!_bottomSeparator) {
        _bottomSeparator = [[UIView alloc]init];
    }
    return _bottomSeparator;
}
-(void)actionBack
{
    if (self.backAction) {
        self.backAction();
    }
}
@end
