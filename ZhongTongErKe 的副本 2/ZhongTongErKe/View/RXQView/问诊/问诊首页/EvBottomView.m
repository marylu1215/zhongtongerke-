//
//  EvBottomView.m
//  ZhongTongErKe
//
//  Created by khj on 2017/6/16.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "EvBottomView.h"

@implementation EvBottomView

-(id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = c255255255;
        
    
        UILabel *headLabel = [UILabel addLabelWithText:@"请您给医生一些评价吧。" AndFont:Font13 AndAlpha:1.0   AndColor:  TITLE_COLOR];
        [self addSubview:headLabel];
        
        headLabel.sd_layout.leftSpaceToView(self,px(30)).topSpaceToView (self,px(30)).rightSpaceToView(self,0).heightIs(Font13);
        
        UIView *sepView = [[UIView alloc]init];
        sepView.backgroundColor = sepBgColor;
        [self addSubview:sepView];
        sepView.sd_layout.widthIs(kScreenWidth).heightIs(px(2)).topSpaceToView(headLabel,px(30));
        
        
        //** 填写描述 */
        self.descView = [[DescriptionView alloc]initWithPlaceholder:@"请输入您要咨询的问题!" maxLength:500];
        [self addSubview:self.descView];
        
        
        //** 填写描述 */
        self.descView = [[DescriptionView alloc]initWithPlaceholder:@"欢迎提出更多意见会建议" maxLength:500];
        [self addSubview:self.descView];
        self.descView.sd_layout.widthIs(kScreenWidth).heightIs(250).topSpaceToView(sepView,px(30)) ;

        
    }
    return self;
}

@end
