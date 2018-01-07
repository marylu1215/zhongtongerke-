//
//  BottomUIView.m
//  ZhongTongErKe
//
//  Created by khj on 2017/6/9.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "BottomUIView.h"

@implementation BottomUIView

-(id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        UIView *leftView = [[UIView alloc]init];
        leftView.backgroundColor = c255255255;
        [self addSubview:leftView];
        leftView.sd_layout.widthIs(px(124)*kScreenWidthScale).heightIs(px(2)).leftSpaceToView(self,px(140)*kScreenWidthScale).centerYEqualToView(self);
        
        UIView *rightView = [[UIView alloc]init];
        [self addSubview:rightView];
        rightView.backgroundColor = c255255255;
        rightView.sd_layout.widthIs(px(124)*kScreenWidthScale).heightIs(px(2)).rightSpaceToView(self,px(140)*kScreenWidthScale).centerYEqualToView(self);
       
      
        UILabel *tipLabel = [UILabel addLabelWithText:@"第三方登录" AndFont:  Font13 AndAlpha:1.0 AndColor:  c255255255];
        [self addSubview:tipLabel];
        
        tipLabel.sd_layout.centerXEqualToView(self).centerYEqualToView(self).heightIs(Font13).widthIs(px(158)*kScreenWidthScale);
        
    }
    return self;
}

@end
