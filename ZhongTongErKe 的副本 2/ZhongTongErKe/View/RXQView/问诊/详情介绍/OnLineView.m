//
//  OnLineView.m
//  ZhongTongErKe
//
//  Created by khj on 2017/6/16.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "OnLineView.h"

@interface OnLineView ()

@property (nonatomic ,strong)  UILabel *suLabel;

@property (nonatomic ,strong)  UILabel *oneLineLabel;

@end

@implementation OnLineView

-(id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = c255255255;
        self.suLabel = [UILabel addLabelWithText:@"呼吸内科" AndFont:Font13 AndAlpha:1.0 AndColor:cHBColor];
        [self addSubview:self.suLabel];
        
        self.suLabel.sd_layout.widthIs([NSString backSizeWithText: self.suLabel.text andFont:font(Font13)].width).heightIs(Font13).leftSpaceToView(self,px(20)).centerYEqualToView(self);
        
        self.oneLineLabel = [UILabel addLabelWithText:@"在线接诊，预计2分钟内回复" AndFont:Font13 AndAlpha:1.0 AndColor:TITLE_COLOR];
        [self addSubview:self.oneLineLabel];
      self.oneLineLabel.sd_layout.heightIs(Font13).leftSpaceToView(self.suLabel,px(20)).centerYEqualToView(self).rightSpaceToView(self,0);
        
    }
    return self;
}

@end
