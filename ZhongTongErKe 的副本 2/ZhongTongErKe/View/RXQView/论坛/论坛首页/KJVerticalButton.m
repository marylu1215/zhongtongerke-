//
//  KJVerticalButton.m
//
//  Created by kouhanjin on 16/2/19.
//  Copyright © 2016年 khj. All rights reserved.
//

#import "KJVerticalButton.h"

@interface KJVerticalButton ()

@end

@implementation KJVerticalButton

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 图标居中
        self.imageView.contentMode = UIViewContentModeCenter;
        // 文字居中
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        // 字体大小
        self.titleLabel.font = font(15);
        // 文字颜色
        [self setTitleColor:cGrayWord forState:UIControlStateNormal];
        
        [self showRedPoint];
        [self hideRedPoint];
        
    }
    return self;
}

// 重写去掉高亮状态
- (void)setHighlighted:(BOOL)highlighted {}


-(void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat imageW = self.imageView.size.width;
    CGFloat imageH = self.imageView.size.height;
    CGFloat imageX = (self.frame.size.width-imageW)/2.0;
    CGFloat imageY = 0;
    self.imageView.frame = CGRectMake(imageX, imageY, imageW, imageH);
    CGSize titleSize=[self.titleLabel.text sizeWithFont:font(15)];
    CGFloat titleW = titleSize.width;
    CGFloat titleH = titleSize.height;
    CGFloat titleX = (self.frame.size.width-titleSize.width)/2.0;
    CGFloat titleY = CGRectGetMaxY(self.imageView.frame) + px(10);
    self.titleLabel.frame = CGRectMake(titleX, titleY, titleW, titleH);
    
    // 小红点
    CGFloat badgeX = CGRectGetMaxX(self.imageView.frame) - 20;
    CGFloat badgeY = imageY;
    self.badgeView.frame = CGRectMake(badgeX, badgeY, 10, 10);
}

- (void)showRedPoint
{
    //新建小红点
    UIView *badgeView = [[UIView alloc]init];
    badgeView.layer.cornerRadius = 5;//圆形
    badgeView.backgroundColor = [UIColor redColor];//颜色：红色
    self.badgeView = badgeView;
    [self addSubview:badgeView];
}

- (void)hideRedPoint
{
    self.badgeView.hidden = YES;
}
@end
