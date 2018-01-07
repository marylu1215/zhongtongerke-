//
//  SectionHeaderView.m
//  ZhongTongErKe
//
//  Created by khj on 2017/5/31.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SectionHeaderView.h"

@interface SectionHeaderView ()

@property (nonatomic ,strong) UIImageView *leftImageView;

@property (nonatomic ,strong) UILabel *infoLabel;

@end
@implementation SectionHeaderView

-(id)initWithFrame:(CGRect)frame LeftImagrName:(NSString *)imagrName Info:(NSString *)info Margin:(CGFloat)margin
{
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = c255255255;
        self.leftImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:imagrName]];
        [self addSubview: self.leftImageView];
        
        self.leftImageView.sd_layout.widthIs(self.leftImageView.image.size.width).heightIs(self.leftImageView.image.size.height).centerYEqualToView(self).leftSpaceToView(self,margin);
        
        self.infoLabel = [UILabel addLabelWithText:info AndFont:12 AndAlpha:1.0 AndColor:cHBColor];
        [self addSubview: self.infoLabel];
        self.infoLabel.sd_layout.leftSpaceToView( self.leftImageView,px(10)).heightIs(12).centerYEqualToView(self).rightSpaceToView(self,0);
        
    }
    return self;
}

@end
