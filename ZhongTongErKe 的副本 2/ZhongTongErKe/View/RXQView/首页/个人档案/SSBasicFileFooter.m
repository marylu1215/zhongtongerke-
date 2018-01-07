//
//  SSBasicFileFooter.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/9.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSBasicFileFooter.h"

@implementation SSBasicFileFooter




- (instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.sureFileButton];
        [self.sureFileButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(10*kScreenHeightScale);
            make.size.mas_equalTo(CGSizeMake(200*kScreenWidthScale, 25*kScreenHeightScale));
            make.left.mas_equalTo(88*kScreenWidthScale);
        }];
    }
    return self;
}










- (UIButton *)sureFileButton{
    if (!_sureFileButton) {
        _sureFileButton = [[UIButton alloc]init];
        _sureFileButton.backgroundColor = MAIN_COLOR;        [_sureFileButton setTitle:@"确认资料" forState:UIControlStateNormal];
        [_sureFileButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _sureFileButton.layer.cornerRadius = 5*kScreenHeightScale;
        _sureFileButton.titleLabel.font = [UIFont systemFontOfSize:12*kScreenHeightScale];
    }
    return _sureFileButton;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
