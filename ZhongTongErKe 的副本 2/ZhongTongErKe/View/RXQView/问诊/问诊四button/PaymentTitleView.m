//
//  PaymentTitleView.m
//  ZhongTongErKe
//
//  Created by khj on 2017/7/7.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "PaymentTitleView.h"

@implementation PaymentTitleView

-(id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        
        UILabel *titleLable = [UILabel addLabelWithText:@"支付方式" AndFont:Font15 AndAlpha:1.0 AndColor:TITLE_COLOR];
        [self addSubview:titleLable];
        
        titleLable.sd_layout.leftSpaceToView(self,px(30)).rightSpaceToView(self,px(30)).heightIs(Font15).centerYEqualToView(self);
        
    }
    return self;
}

@end
