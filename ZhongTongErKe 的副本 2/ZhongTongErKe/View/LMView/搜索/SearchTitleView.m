//
//  SearchTitleView.m
//  ZhongTongErKe
//
//  Created by khj on 2017/6/2.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SearchTitleView.h"

@implementation SearchTitleView

-(id)initWithFrame:(CGRect)frame leftTitle:(NSString *)title rightTitle:(NSString *)rightTitle
{
    if (self = [super initWithFrame:frame]) {
        
        UILabel *rightTitleLabel = [UILabel addLabelWithText:rightTitle AndFont:12 AndAlpha:1.0 AndColor:cGrayWord];
        [self addSubview:rightTitleLabel];
        
        rightTitleLabel.sd_layout.rightSpaceToView(self,px(30)).widthIs(px(120)).centerYEqualToView(self).heightIs(12);
        
        UILabel *leftTitleLabel = [UILabel addLabelWithText:title AndFont:15 AndAlpha:1.0 AndColor:cGrayWord];
        [self addSubview:leftTitleLabel];
        leftTitleLabel.sd_layout.leftSpaceToView(self,px(30)).rightSpaceToView(rightTitleLabel,0).heightIs(15).centerYEqualToView(self);
}
    
    return self;
}
@end
