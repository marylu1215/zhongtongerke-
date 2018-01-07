//
//  SVideoHeaderView.m
//  ZhongTongErKe
//
//  Created by khj on 2017/5/30.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SVideoHeaderView.h"

@interface  SVideoHeaderView ()

@end
@implementation SVideoHeaderView

-(id)initWithFrame:(CGRect)frame VideoArray:(NSArray *)videoArray
{
    if (self = [super initWithFrame:frame]) {
        
        for (int index=0; index<videoArray.count; index++) {
            
            self.playView = [[VideoPlayView alloc]initWithFrame:CGRectMake(0, index*px(300), kScreenWidth, px(300))];
          self.playView.video = videoArray[index];
        [self.playView.playBtn addTarget:self action:@selector(playAction:) forControlEvents:UIControlEventTouchUpInside];
            self.playView.playBtn.tag = index;
            [self addSubview:self.playView];
        }
        
    }
    return self;
}
-(void)playAction:(UIButton *)btn
{
    
  
    
    if (self.clickViewBlock) {
        
        self.clickViewBlock(btn);
        
    }
}
@end
