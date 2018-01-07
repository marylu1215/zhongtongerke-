//
//  AcThemeView.m
//  ZhongTongErKe
//
//  Created by khj on 2017/6/12.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "AcThemeView.h"

@implementation AcThemeView

-(id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        UIImageView *headImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:banner_zthdImageName]];
        [self addSubview:headImageView];
        headImageView.sd_layout.widthIs(headImageView.image.size.width).heightIs(headImageView.image.size.height).topSpaceToView(self,0).centerXEqualToView(self);
        
        
        UIImageView *leadBgImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:bg_leadImageName]];
        [self addSubview:leadBgImageView];
        leadBgImageView.sd_layout.widthIs(leadBgImageView.image.size.width).heightIs(leadBgImageView.image.size.height).topSpaceToView(headImageView,0).centerXEqualToView(self);
        
        UIImageView *leadImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:lead_iconImageName]];
        [self addSubview:leadImageView];
        leadBgImageView.sd_layout.widthIs(leadBgImageView.image.size.width).heightIs(leadBgImageView.image.size.height).topSpaceToView(headImageView,0).centerXEqualToView(self);
        
    }
    return self;
}
@end
