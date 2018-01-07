//
//  LMImageView.m
//  ZhongTongErKe
//
//  Created by khj on 2017/6/5.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "LMImageView.h"

@interface LMImageView()




@end
@implementation LMImageView

-(id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.userInteractionEnabled = YES;
        self.arrowBtn = [UIButton addBtnImage:index_backImageName WithTarget:self action:@selector(btnclick)];
        [self addSubview:self.arrowBtn];
      
        self.arrowBtn.imageEdgeInsets =UIEdgeInsetsMake(15, 10, 15, 10);
        
        self.arrowBtn.sd_layout.widthIs(self.arrowBtn.imageView.image.size.width+20).heightIs(self.arrowBtn.imageView.image.size.height+30).topSpaceToView(self,px(20)).leftSpaceToView(self,0);
        
    }
    
    return self;
}

-(void)btnclick
{
    if (self.backBlock) {
        
        self.backBlock();
    }
}
@end
