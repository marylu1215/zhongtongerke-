//
//  ThemeSectionView.m
//  ZhongTongErKe
//
//  Created by khj on 2017/6/12.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "ThemeSectionView.h"

@implementation ThemeSectionView

-(id)initWithFrame:(CGRect)frame WithSectionTitle:(NSString *)sectionTitle
{
    if (self = [super initWithFrame:frame]) {
        
        UILabel *sectionLabel = [UILabel addLabelWithText:sectionTitle AndFont:Font13 AndAlpha:1.0 AndColor:cHBColor];
        [self addSubview:sectionLabel];
        sectionLabel.sd_layout.widthIs([NSString backSizeWithText:sectionLabel.text andFont:font(Font13)].width).heightIs(Font13).centerXEqualToView(self).centerYEqualToView(self);
    }
    return self;
}
@end
