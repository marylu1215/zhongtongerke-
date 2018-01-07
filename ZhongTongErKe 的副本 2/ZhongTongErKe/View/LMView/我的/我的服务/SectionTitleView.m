//
//  SectionTitleView.m
//  ZhongTongErKe
//
//  Created by khj on 2017/6/1.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SectionTitleView.h"

@implementation SectionTitleView

-(id)initWithFrame:(CGRect)frame title:(NSString *)Title
{
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = c255255255;
        UILabel *titleLabel = [UILabel addLabelWithText:Title AndFont:15 AndAlpha:1.0 AndColor:cHBColor];
        [self addSubview:titleLabel];
        
        titleLabel.sd_layout.leftSpaceToView(self,px(20)).rightSpaceToView(self,px(20)).centerYEqualToView(self).heightIs(15);
    }
    
    return self;
}

@end
