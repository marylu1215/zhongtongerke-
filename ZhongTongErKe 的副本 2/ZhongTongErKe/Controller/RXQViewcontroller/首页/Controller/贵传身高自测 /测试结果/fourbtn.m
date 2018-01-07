//
//  fourbtn.m
//  ZhongTongErKe
//
//  Created by 研发部 on 2017/9/13.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "fourbtn.h"
#import <Masonry.h>
@implementation fourbtn
-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
       // self.backgroundColor = [UIColor redColor];
        self.topLabel = [[UILabel alloc]init];
        //self.topLabel.backgroundColor = [UIColor purpleColor];
        
        //self.topLabel.text = @"宝贝";
        self.topLabel.textAlignment = NSTextAlignmentCenter;
        self.topLabel.font = [UIFont systemFontOfSize:16];
        [self addSubview:self.topLabel];
        [self.topLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.top.mas_equalTo(0);
            make.right.mas_equalTo(0);
            make.height.mas_equalTo(16);
        }];
        
        _bottomLabel = [[UILabel alloc]init];
        //_bottomLabel.backgroundColor = [UIColor orangeColor];
        _bottomLabel.text = @"明天明天";
        _bottomLabel.textAlignment = NSTextAlignmentCenter;
        _bottomLabel.font = [UIFont systemFontOfSize:14];
        [self addSubview:_bottomLabel];
        [_bottomLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.topLabel.mas_bottom);
            make.bottom.mas_equalTo(0);
            make.right.mas_equalTo(0);
            make.left.mas_equalTo(0);
        }];

        
    }
    return self;
}

@end
