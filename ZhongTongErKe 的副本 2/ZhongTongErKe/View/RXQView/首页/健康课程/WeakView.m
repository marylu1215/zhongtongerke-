//
//  WeakView.m
//  ZhongTongErKe
//
//  Created by khj on 2017/6/20.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "WeakView.h"

@implementation WeakView

-(id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        NSArray *weakDays = @[@"星期一",@"星期二",@"星期三",@"星期四",@"星期五",@"星期六",@"星期日"];
        
        CGFloat buttonW = (kScreenWidth-px(150))/weakDays.count;
        
        for (int index=0; index<weakDays.count; index++) {
            
            UIButton *weakBtn = [UIButton addBtnWithTitle:weakDays[index] WithFont:Font13*kScreenWidthScale WithTitleColor:c255255255];
            weakBtn.frame = CGRectMake(px(150)+index*buttonW, 0, buttonW, px(50));
            [self addSubview:weakBtn];
        }
        
    }
    return self;
}

@end
