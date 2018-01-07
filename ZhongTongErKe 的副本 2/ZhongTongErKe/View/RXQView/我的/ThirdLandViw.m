//
//  ThirdLandViw.m
//  ZhongTongErKe
//
//  Created by khj on 2017/6/9.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "ThirdLandViw.h"

@implementation ThirdLandViw

-(id)initWithFrame:(CGRect)frame WithIconArr:(NSArray *)IconArr
{
    if (self  =[super initWithFrame:frame]) {
        
        for (int index=0; index<IconArr.count; index++) {
            
            UIButton *landBtn = [UIButton addBtnImage:IconArr[index] WithTarget:self action:@selector(landAction:)];
            landBtn.tag = index;
            
            landBtn.frame = CGRectMake((landBtn.imageView.image.size.width+px(50))*kScreenWidthScale*index, 0, landBtn.imageView.image.size.width, landBtn.imageView.image.size.height);
            
            [self addSubview:landBtn];
        }
    }
    return self;
}

-(void)landAction:(UIButton *)btn
{
    if (self.clickBtnBlock) {
        self.clickBtnBlock(btn);
    }
}
@end
