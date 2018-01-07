//
//  LMBorderView.m
//  MagicFinger
//
//  Created by lm on 26/8/16.
//  Copyright © 2016年 zeenc. All rights reserved.
//

#import "LMBorderView.h"

@implementation LMBorderView

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        
        UIView *sepview = [[UIView alloc]init];
        sepview.backgroundColor = [UIColor colorWithHexString:@"e9e9e9"];
        [self addSubview:sepview];
        sepview.sd_layout.widthIs(kScreenWidth).heightIs(px(2)).bottomSpaceToView(self,0);
    }
    return self;
}

@end
