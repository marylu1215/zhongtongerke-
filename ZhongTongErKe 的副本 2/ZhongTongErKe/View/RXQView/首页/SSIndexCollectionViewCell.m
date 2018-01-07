//
//  SSIndexCollectionViewCell.m
//  ZhongTongErKe
//
//  Created by Claf on 17/4/29.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSIndexCollectionViewCell.h"

@implementation SSIndexCollectionViewCell


- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self.contentView addSubview:self.imageView];
        [self.contentView addSubview:self.label];
        [self makeConstraits];
        
    }
    return self;
}
- (void)layoutSubviews{
    //[self.label setFrame:CGRectMake(0, 50, 60, 30)];
    //[self.imageView setFrame:CGRectMake(0, 0, 50, 50)];
}

- (void)makeConstraits{
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(53*kScreenWidthScale, 53*kScreenHeightScale));
        make.left.mas_equalTo(0*kScreenWidthScale);
    }];
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(53*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(53*kScreenWidthScale, 20*kScreenHeightScale));
        make.left.mas_equalTo(0*kScreenWidthScale);
    }];
}

#pragma mark lazyload
- (UILabel *)label{
    if (!_label) {
        _label = [[UILabel alloc]init];
        _label.textAlignment = NSTextAlignmentCenter;
        //_label.backgroundColor = [UIColor redColor];
        _label.font = [UIFont systemFontOfSize:12*kScreenHeightScale];
        _label.textColor = TITLE_COLOR;
    }
    return _label;
}
- (UIImageView *)imageView{
    if (!_imageView) {
        _imageView = [[UIImageView alloc]init];
        //_imageView.backgroundColor = [UIColor greenColor];
        
    }
    return _imageView;
}

@end
