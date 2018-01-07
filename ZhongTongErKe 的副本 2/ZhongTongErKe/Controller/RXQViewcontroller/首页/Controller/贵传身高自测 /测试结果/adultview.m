//
//  adultview.m
//  ZhongTongErKe
//
//  Created by 研发部 on 2017/9/13.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "adultview.h"
#import <Masonry.h>
@implementation adultview
-(id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        _oneLabel = [[UILabel alloc]init];
        _oneLabel.text = @"158cm";
        _oneLabel.backgroundColor = [UIColor lightGrayColor];
        _oneLabel.textColor = TITLE_COLOR;
        _oneLabel.textAlignment = NSTextAlignmentCenter;
        _oneLabel.font = [UIFont systemFontOfSize:16];
        [self addSubview:_oneLabel];
        [_oneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.centerX.mas_equalTo(self.mas_centerX).offset(2);
            make.size.mas_equalTo(CGSizeMake(60, 20));
        }];
        
        _twoview = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"成年后遗传身高"]];
        [self addSubview:_twoview];
        [_twoview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_oneLabel.mas_bottom).offset(1);
            //make.size.mas_equalTo();
            make.centerX.mas_equalTo(_oneLabel.mas_centerX);
            make.size.mas_equalTo(CGSizeMake(90, 195));
        }];

    }
    return self;
}

@end
