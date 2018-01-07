//
//  PayButton.m
//  ZhongTongErKe
//
//  Created by khj on 2017/6/6.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "PayButton.h"

@implementation PayButton

-(id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self setTitleColor:c255255255 forState:UIControlStateNormal];
        self.backgroundColor = cHBColor;
    }
    return self;
}

@end
