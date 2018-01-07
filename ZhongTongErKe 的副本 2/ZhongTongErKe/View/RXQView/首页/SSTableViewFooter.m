//
//  SSTableViewFooter.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/3.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSTableViewFooter.h"

@interface SSTableViewFooter ()

@property (nonatomic,strong)UIView *grayBackground;

@end

@implementation SSTableViewFooter

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubviews];
        [self makeConstaits];
    }
    return self;
}
- (void)addSubviews{
    [self addSubview:self.grayBackground];
}
- (void)makeConstaits{
    [self.grayBackground mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(kScreenWidth, 7*kScreenHeightScale));
        make.left.mas_equalTo(0);
    }];
}



- (UIView *)grayBackground{
    if (!_grayBackground) {
        _grayBackground = [[UIView alloc]init];
        _grayBackground.backgroundColor = BACKGROUND_COLOR;
    }
    return _grayBackground;
}



@end
