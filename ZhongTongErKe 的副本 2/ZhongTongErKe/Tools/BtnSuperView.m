//
//  BtnSuperView.m
//  MagicFinger
//
//  Created by khj on 16/8/22.
//  Copyright © 2016年 zeenc. All rights reserved.
//

#import "BtnSuperView.h"
#import "HighlightedButton.h"

@interface BtnSuperView ()
@property (nonatomic, weak) UIView *bottomView;
@end

@implementation BtnSuperView
- (instancetype)initWithTitle:(NSString *)btnTitle
{
    if (self = [super init]) {
        [self setupChildViewWithTitle:btnTitle];
    }
    
    return self;
}

- (void)setupChildViewWithTitle:(NSString *)btnTitle
{
    
    KJMenuButton *topButton = [[KJMenuButton alloc] init];
    self.topButton = topButton;
    [topButton setTitle:btnTitle forState:UIControlStateNormal];
    [topButton setTitleColor:TITLE_COLOR forState:UIControlStateNormal];
    [topButton setTitleColor:cHBColor forState:UIControlStateSelected];
    topButton.titleLabel.font = font(15);
    
    [topButton setImage:[UIImage imageNamed:graySelectImageName] forState:UIControlStateNormal];
    [topButton setImage:[UIImage imageNamed:greenSelectImageName] forState:UIControlStateSelected];
    [topButton addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:topButton];
    
    UIView *bottomView = [[UIView alloc] init];
    self.bottomView = bottomView;
    bottomView.backgroundColor = sepBgColor;
    [self addSubview:self.bottomView];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.bottomView.x = 0;
    self.bottomView.width = self.width;
    self.bottomView.height = 0.5;
    self.bottomView.y = self.height - self.bottomView.height;
    
    self.topButton.x = 2;
    self.topButton.y = 0;
    self.topButton.height = self.height - self.bottomView.height;
    self.topButton.width = self.width - 1 - 2 * self.topButton.x;
    
    self.lineView.y = 5;
    self.lineView.width = 0.5;
    self.lineView.x = self.width - self.lineView.width;
    self.lineView.height = self.height - self.bottomView.height - 2 * self.lineView.y;
    
}

- (void)btnClick:(HighlightedButton *)btn
{
    if (self.btnClickBolck) {
        self.btnClickBolck(btn);
    }
    
    
}

@end
