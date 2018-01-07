//
//  LMMessageBtn.m
//  ZhongTongErKe
//
//  Created by khj on 2017/5/28.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "LMMessageBtn.h"

@implementation LMMessageBtn

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
       
        [self setImage:[UIImage imageNamed:massageImageName] forState:UIControlStateNormal];
        self.sd_layout.widthIs(self.imageView.image.size.width).heightIs(self.imageView.image.size.height);
        [self showRedPoint];
        [self hideRedPoint];
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    // 小红点
   self.redPointImageView.frame = CGRectMake(10, 0, self.redPointImageView.image.size.width, self.redPointImageView.image.size.height);
   
}
- (void)showRedPoint
{
    self.redPointImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:newMassageImageName]];
    [self addSubview: self.redPointImageView];
}
- (void)hideRedPoint
{
    self.redPointImageView.hidden = YES;
}


@end
