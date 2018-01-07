//
//  GroupButton.m
//  ZhongTongErKe
//
//  Created by khj on 2017/7/2.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "GroupButton.h"

@implementation GroupButton

-(id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.groupImageView = [[UIImageView alloc]init];
        [self addSubview:self.groupImageView];
        self.groupImageView.sd_layout.widthIs(px(130)).heightIs(px(130)).topSpaceToView(self,px(12)).centerXEqualToView(self);
        
        self.groupLabel = [UILabel labelWithText:@"" Font:Font13 Color:TITLE_COLOR Alignment:NSTextAlignmentCenter];
        [self addSubview:self.groupLabel];
        
        self.groupLabel.sd_layout.leftSpaceToView(self,0).rightSpaceToView(self,0).topSpaceToView(self.groupImageView,px(10)).heightIs(Font13);
    }
    return self;
}

@end
