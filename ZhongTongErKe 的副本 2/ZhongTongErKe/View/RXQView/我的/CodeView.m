//
//  CodeView.m
//  ZhongTongErKe
//
//  Created by khj on 2017/6/8.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "CodeView.h"

@implementation CodeView

-(id)initWithFrame:(CGRect)frame WithTitle:(NSString *)title tipStr:(NSString *)tipStr codeImage:(NSString *)codeImage
{
    if (self = [super initWithFrame:frame]) {
        
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:codeImage]];
        [self addSubview:imageView];
        imageView.sd_layout.widthIs(imageView.image.size.width).heightIs(imageView.image.size.height).centerXEqualToView(self).topSpaceToView(self,0);
        
        UILabel *contentLabel  = [UILabel addLabelWithText:title AndFont:Font13 AndAlpha:1.0 AndColor:TITLE_COLOR];
        [self addSubview:contentLabel];
        contentLabel.numberOfLines = 0;
       
        
        NSDictionary *descDic = @{NSFontAttributeName:font(Font13 )};
        CGRect descFrame =  [contentLabel.text textRectWithSize:CGSizeMake(self.frame.size.width, MAXFLOAT) attributes:descDic];
        descFrame.origin.x = 0;
        descFrame.origin.y = CGRectGetMaxY(imageView.frame)+px(20);
        contentLabel.frame = descFrame;
        
        UILabel *tipLabel = [UILabel addLabelWithText:tipStr AndFont:Font13 AndAlpha:1.0 AndColor:cGrayWord];
        [self addSubview:tipLabel];
        
        tipLabel.sd_layout.widthIs([NSString backSizeWithText:tipLabel.text andFont:font(Font13)].width).heightIs(Font13).centerXEqualToView(self).topSpaceToView(contentLabel,px(100));
        
    }
    return self;
}

@end
