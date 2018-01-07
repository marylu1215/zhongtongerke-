//
//  QuDetailUIView.m
//  ZhongTongErKe
//
//  Created by khj on 2017/6/16.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "QuDetailUIView.h"

@interface QuDetailUIView ()

@property (nonatomic ,strong) UILabel *titleLabel;
@property (nonatomic ,strong) UILabel *subLabel;
@property (nonatomic ,strong) UIButton *reButton;
@property (nonatomic ,strong) UIButton *sureBtn;
@property (nonatomic ,strong) UIView *bottomSepView;
@property (nonatomic ,strong) NSMutableArray *buttonMutableArray;

@end
@implementation QuDetailUIView

-(NSMutableArray *)buttonMutableArray
{
    if (!_buttonMutableArray) {
        
        _buttonMutableArray = [NSMutableArray new];
    }
    return _buttonMutableArray;
}
-(id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        
        UIView *headView = [[UIView alloc]init];
        [self addSubview:headView];
        headView.sd_layout.leftSpaceToView(self,px(140)).topSpaceToView(self,px(20)).rightSpaceToView(self,0).heightIs(px(30));
        
        self.titleLabel = [UILabel addLabelWithText:@"智能分诊已经把您的问题提交到" AndFont: Font13 AndAlpha:1.0 AndColor:TITLE_COLOR];
        [headView addSubview:self.titleLabel];
       self.titleLabel.sd_layout.leftSpaceToView(headView,0).widthIs([NSString backSizeWithText: self.titleLabel.text andFont:font(Font13)].width).heightIs(Font13).centerYEqualToView(headView);
        
        self.subLabel = [UILabel addLabelWithText:@"呼吸内科" AndFont:Font13 AndAlpha:1.0 AndColor:cHBColor];
        [headView addSubview:self.subLabel];
         self.subLabel.sd_layout.leftSpaceToView(self.titleLabel,0).rightSpaceToView(headView,0).heightIs(Font13).centerYEqualToView(headView);
        
       
        self.reButton = [UIButton addBtnWithTitle:@"重选科室" WithBGImg:nil WithFont:Font13 WithTitleColor:cHBColor Target:self Action:@selector(clickAction:)];
        self.reButton.tag =0;
        self.reButton.backgroundColor = [UIColor whiteColor];
        self.reButton.layer.cornerRadius=6;
        self.reButton.clipsToBounds =YES;
        self.reButton.layer.borderColor =cHBColor.CGColor;
        self.reButton.layer.borderWidth = px(2);
        [self.buttonMutableArray addObject:self.reButton];
        [self  addSubview:self.reButton];
       self.reButton.sd_layout.leftSpaceToView(self,px(150)).widthIs((kScreenWidth-2*px(150)-px(50))/2).heightIs(px(46)).topSpaceToView(headView,px(24));
        
         self.sureBtn = [UIButton addBtnWithTitle:@"确认科室" WithBGImg:nil WithFont:Font13 WithTitleColor:cHBColor Target:self Action:@selector(clickAction:)];
         self.sureBtn.backgroundColor = [UIColor whiteColor];
         self.sureBtn.layer.borderColor =cHBColor.CGColor;
         self.sureBtn.layer.borderWidth = px(2);
        self.sureBtn.layer.cornerRadius=6;
        self.sureBtn.clipsToBounds =YES;
        self.sureBtn.tag = 1;
        [self.buttonMutableArray addObject:self.sureBtn];
        [self addSubview: self.sureBtn];
      self.sureBtn.sd_layout.rightSpaceToView(self,px(150)).widthIs((kScreenWidth-2*px(150)-px(50))/2).heightIs(px(46)).topSpaceToView(headView,px(24));
        
        
        self.bottomSepView = [[UIView alloc]init];
        self.bottomSepView.backgroundColor = [UIColor colorWithHexString:@"aaaaaa"];
        [self addSubview:self.bottomSepView];
        self.bottomSepView.sd_layout.widthIs(kScreenWidth).heightIs(px(2)).bottomSpaceToView(self,0);
    }
    return self;
}

-(void)clickAction:(UIButton *)btn
{
    btn.selected = !btn.selected;
    for (UIButton *button in self.buttonMutableArray) {
        
        [button setTitleColor:cHBColor forState:UIControlStateNormal];
        button.backgroundColor =c255255255;
    
    }
      [ btn setTitleColor:c255255255 forState:UIControlStateNormal];
     btn.backgroundColor = cHBColor;
    if (self.clickBlock) {
        
        self.clickBlock(btn);
    }
  
}
@end
