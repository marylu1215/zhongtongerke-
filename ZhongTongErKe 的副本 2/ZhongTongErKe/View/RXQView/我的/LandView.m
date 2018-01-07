//
//  LandView.m
//  ZhongTongErKe
//
//  Created by khj on 2017/6/8.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "LandView.h"

@implementation LandView

-(id)initWithFrame:(CGRect)frame landBtnTitle:(NSString *)title account:(NSString *)accountTip registerStr:(NSString *)registerStr forgetPwd:(NSString *)forgetPwd
{
    if (self = [super initWithFrame:frame]) {
        
     
        UIView *bgView = [[UIView alloc]init];
        bgView.backgroundColor = c255255255;
        bgView.layer.cornerRadius =8;
        bgView.clipsToBounds = YES;
        [self addSubview:bgView];
        bgView.sd_layout.leftSpaceToView(self,px(140)).rightSpaceToView(self,px(140)).heightIs(px(74)*kScreenHeightScale).centerXEqualToView(self).topSpaceToView(self,0);
        
        UIButton *landBtn = [UIButton addBtnWithTitle:title WithBGImg:@"" WithFont:Font15  WithTitleColor:c255255255  Target:self Action:@selector(landAction)];
        landBtn.backgroundColor = [UIColor colorWithHexString:@"81d0d5"];
        landBtn.layer.cornerRadius =8;
        landBtn.clipsToBounds = YES;
        [bgView addSubview:landBtn];
        landBtn.sd_layout.leftSpaceToView(bgView,px(4)).topSpaceToView(bgView,px(4)).rightSpaceToView(bgView,px(4)).bottomSpaceToView(bgView,px(4));
        
        UILabel *tipLabel = [UILabel addLabelWithText:accountTip AndFont:Font13 AndAlpha:1.0 AndColor:c255255255];
        [self addSubview:tipLabel];
        
        tipLabel.sd_layout.widthIs([NSString backSizeWithText:tipLabel.text andFont:font(Font13)].width).leftEqualToView(bgView).heightIs(Font13).topSpaceToView(bgView,px(20));
        
      
        UIButton *registerBtn = [UIButton addBtnWithTitle:registerStr WithBGImg:nil WithFont:Font13  WithTitleColor:S_COLOR Target:self Action:@selector(registerAction)];
        [self addSubview:registerBtn ];
        registerBtn.sd_layout.widthIs([NSString backSizeWithText:registerBtn.titleLabel.text andFont:font(Font13)].width).heightIs(Font13).leftSpaceToView(tipLabel,px(20)*kScreenHeightScale).centerYEqualToView(tipLabel);
        
        UIButton *forgetButton = [UIButton addBtnWithTitle:forgetPwd WithBGImg:nil WithFont:Font13  WithTitleColor:S_COLOR Target:self Action:@selector(forgetAction)];
        [self addSubview:forgetButton ];
        forgetButton.sd_layout.widthIs([NSString backSizeWithText:forgetButton.titleLabel.text andFont:font(Font13)].width).heightIs(Font13).rightSpaceToView(self,px(154)*kScreenWidthScale).centerYEqualToView(tipLabel);
        
    }
    return self;
}


-(void)landAction
{
    if (self.landBlock) {
        self.landBlock();
    }
}
-(void)registerAction
{
    if (self.registerBlock) {
        
        self.registerBlock();
    }
}
-(void)forgetAction
{
    if (self.forgetBlock) {
        
        self.forgetBlock();
    }
}
@end
