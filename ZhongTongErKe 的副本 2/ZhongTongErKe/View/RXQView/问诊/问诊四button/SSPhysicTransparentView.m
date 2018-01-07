//
//  SSPhysicTransparentView.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/23.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSPhysicTransparentView.h"

@implementation SSPhysicTransparentView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubviews];
        [self makeConstaits];
    }
    return self;
}


- (void)addSubviews{
    [self addSubview:self.hospitalLabel];
    [self addSubview:self.englishHospitalLabel];
    [self addSubview:self.tagLabel2];
    [self addSubview:self.tagLabel1];
}
- (void)makeConstaits{
    [self.hospitalLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(7*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(150*kScreenWidthScale, 15*kScreenHeightScale));
        make.left.mas_equalTo(8*kScreenWidthScale);
    }];
    [self.englishHospitalLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(30*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(150*kScreenWidthScale, 10*kScreenHeightScale));
        make.left.mas_equalTo(8*kScreenWidthScale);
    }];
    [self.tagLabel1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(21*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(60*kScreenWidthScale, 15*kScreenHeightScale));
        make.left.mas_equalTo(250*kScreenWidthScale);
    }];
    [self.tagLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(21*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(40*kScreenWidthScale, 15*kScreenHeightScale));
        make.left.mas_equalTo(320*kScreenWidthScale);
    }];
}




- (UILabel *)hospitalLabel{
    if (!_hospitalLabel) {
        _hospitalLabel = [[UILabel alloc]init];
        _hospitalLabel.font = [UIFont systemFontOfSize:15*kScreenHeightScale];
        _hospitalLabel.textColor = [UIColor whiteColor];
        
    }
    return _hospitalLabel;
}
- (UILabel *)englishHospitalLabel{
    if (!_englishHospitalLabel) {
        _englishHospitalLabel = [[UILabel alloc]init];
        _englishHospitalLabel.font = [UIFont systemFontOfSize:10*kScreenHeightScale];
        _englishHospitalLabel.textColor = [UIColor whiteColor];
    }
    return _englishHospitalLabel;
}
- (UILabel *)tagLabel1{
    if (!_tagLabel1) {
        _tagLabel1 = [[UILabel alloc]init];
        _tagLabel1.font = [UIFont systemFontOfSize:12*kScreenHeightScale];
        _tagLabel1.textColor = MAIN_COLOR;
        _tagLabel1.layer.borderColor = [UIColor colorWithRed:(float)63/255.0 green:(float)230/255.0 blue:(float)216/255.0 alpha:1.000].CGColor;
        _tagLabel1.layer.borderWidth = 1;
        _tagLabel1.textAlignment = NSTextAlignmentCenter;
    }
    return _tagLabel1;
}
- (UILabel *)tagLabel2{
    if (!_tagLabel2) {
        _tagLabel2 = [[UILabel alloc]init];
        _tagLabel2.textAlignment = NSTextAlignmentCenter;
        _tagLabel2.font = [UIFont systemFontOfSize:12*kScreenHeightScale];
        _tagLabel2.textColor = MAIN_COLOR;
        _tagLabel2.layer.borderColor = [UIColor colorWithRed:(float)63/255.0 green:(float)230/255.0 blue:(float)216/255.0 alpha:1.000].CGColor;
        _tagLabel2.layer.borderWidth = 1;
    }
    return _tagLabel2;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
