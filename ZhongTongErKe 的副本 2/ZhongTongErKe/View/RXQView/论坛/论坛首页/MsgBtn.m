//
//  MsgBtn.m
//  ZhongTongErKe
//
//  Created by khj on 2017/5/27.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "MsgBtn.h"

@implementation MsgBtn

-(id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self prepareUI];
        
        [self configueFrame];
        
    }
    return self;
}

-(void)prepareUI
{
    self.messageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:massageImageName]];
    [self addSubview:self.messageView];
    
    self.redPointView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:newMassageImageName]];
    [self addSubview:self.redPointView ];
    
    
}
-(void)configueFrame
{
    self.messageView.sd_layout.widthIs(self.messageView.image.size.width).heightIs(self.imageView.image.size.height).leftSpaceToView(self,0).topSpaceToView(self,0);
    
    self.redPointView.sd_layout.widthIs(self.redPointView.image.size.width).heightIs(self.redPointView.image.size.height).rightSpaceToView(self,-self.redPointView.image.size.width/2.0).topSpaceToView(self,-self.redPointView.image.size.height/2.0);
}
@end
