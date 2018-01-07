//
//  PhotoImageView.m
//  ZhongTongErKe
//
//  Created by khj on 2017/7/12.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "PhotoImageView.h"

@implementation PhotoImageView

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.bgBtn = [[UIButton alloc]init];
        [self addSubview: self.bgBtn];
        
        self.bgBtn.sd_layout.leftSpaceToView(self,0).rightSpaceToView(self,0).topSpaceToView(self,0).bottomSpaceToView(self,0);
    }
    
    return self;
}


@end
