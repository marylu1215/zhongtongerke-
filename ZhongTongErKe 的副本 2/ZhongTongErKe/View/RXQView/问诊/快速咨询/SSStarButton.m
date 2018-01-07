//
//  SSStarButton.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/11.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSStarButton.h"

@implementation SSStarButton

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.contentLabel];
        [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.size.mas_equalTo(CGSizeMake(80*kScreenWidthScale, 25*kScreenHeightScale));
            make.left.mas_equalTo(0);
        }];
        self.layer.borderColor = [UIColor colorWithRed:(float)63/255.0 green:(float)230/255.0 blue:(float)216/255.0 alpha:1.000].CGColor;
        self.layer.borderWidth = 1;
    }
    return self;
}



- (UILabel *)contentLabel{
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc]init];
        _contentLabel.font = [UIFont systemFontOfSize:12*kScreenHeightScale];
        _contentLabel.textColor = MAIN_COLOR;
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
