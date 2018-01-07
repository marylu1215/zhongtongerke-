//
//  XFTopBottomLineView.m
//  MagicFinger
//
//  Created by xufeng on 16/6/16.
//  Copyright © 2016年 zeenc. All rights reserved.
//

#import "XFTopBottomLineView.h"

@interface XFTopBottomLineView ()

@end
@implementation XFTopBottomLineView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = MAIN_COLOR;
        _topLine = [[UIView alloc]init];
        _topLine.backgroundColor = cMainLine;
        [self addSubview:_topLine];
        _topLine.sd_layout.leftSpaceToView(self,0).rightSpaceToView(self,0).topSpaceToView(self,0).heightIs(pxLineHeight);
    }
    return self;
}

@end
