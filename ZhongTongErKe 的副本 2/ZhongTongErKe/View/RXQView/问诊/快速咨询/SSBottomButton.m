//
//  SSBottomButton.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/11.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSBottomButton.h"

@implementation SSBottomButton

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubviews];
        [self makeConstaits];
        self.backgroundColor = MAIN_COLOR;
    }
    return self;
}

+ (instancetype)loadBottomButtonWithTitle:(NSString *)title{
    SSBottomButton *button = [[SSBottomButton alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 50*kScreenHeightScale)];
    button.contentLabel.text = title;
    return button;
}

- (void)addSubviews{
    [self addSubview:self.contentLabel];
}
- (void)makeConstaits{
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(kScreenWidth, 27*kScreenHeightScale));
        make.left.mas_equalTo(0);
    }];
}





- (UILabel *)contentLabel{
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc]init];
        _contentLabel.font = [UIFont systemFontOfSize:15*kScreenHeightScale];
        _contentLabel.textColor = [UIColor whiteColor];
        _contentLabel.textAlignment = NSTextAlignmentCenter;
    
    }
    return _contentLabel;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
