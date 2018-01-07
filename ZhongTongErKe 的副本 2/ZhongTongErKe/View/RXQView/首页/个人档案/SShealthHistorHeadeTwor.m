//
//  SShealthHistorHeadeTwor.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/9.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SShealthHistorHeadeTwor.h"

@interface SShealthHistorHeadeTwor ()

@property (nonatomic,strong)UIView *line1;
@property (nonatomic,strong)UIView *line2;
@property (nonatomic ,strong) NSMutableArray *btnMutableArray;
@property (nonatomic,strong) UILabel *headLabel;
@property (nonatomic,strong) UILabel *contentLabel;
@property (nonatomic,strong) UIView *headView;

@end

@implementation SShealthHistorHeadeTwor

-(NSMutableArray *)btnMutableArray
{
    if (!_btnMutableArray) {
        
        _btnMutableArray = [NSMutableArray new];
    }
    return _btnMutableArray;
}
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubviews];
        [self makeConstaits];
    }
    return self;
}

- (void)addSubviews{
    
    self.headView = [[UIView alloc]init];
    [self addSubview:self.headView];
    [self.headView addSubview:self.headLabel];
    
    [self addSubview:self.contentLabel];
    [self addSubview:self.yesButton];
    [self addSubview:self.noButton];
    [self addSubview:self.line1];
    [self addSubview:self.line2];
 
}
- (void)makeConstaits{
   
    self.headView.sd_layout.widthIs(kScreenWidth).heightIs(px(64)).topSpaceToView(self,0);
    
    self.headLabel.sd_layout.leftSpaceToView(self.headView,px(30)).rightSpaceToView(self.headView,0).heightIs(Font15).centerYEqualToView(self.headView);

    self.line1.sd_layout.widthIs(kScreenWidth).heightIs(px(2)).topSpaceToView(self.headView,0);
    
    self.contentLabel.sd_layout.leftSpaceToView(self,px(30)).rightSpaceToView(self,0).topSpaceToView(self.line1,px(20)).heightIs(Font13);
    
    self.yesButton.sd_layout.widthIs(px(200)).heightIs(25).leftSpaceToView(self,px(56)).topSpaceToView(self.contentLabel,px(20));
    
    self.noButton.sd_layout.widthIs(px(200)).heightIs(25).leftSpaceToView(self.yesButton,px(20)).centerYEqualToView(self.yesButton);
    
    self.line2.sd_layout.widthIs(kScreenWidth).heightIs(px(2)).topSpaceToView(self.yesButton,px(20));

}

- (UILabel *)headLabel
    {
    if (!_headLabel) {
        _headLabel = [UILabel addLabelWithText:@"家族病史" AndFont:Font15 AndAlpha:1.0 AndColor:cHBColor];
    }
    return _headLabel;
}
- (UILabel *)contentLabel{
    if (!_contentLabel) {
    _contentLabel = [UILabel addLabelWithText:@"你的父母或者兄弟姐妹是否患有明确诊断的疾病" AndFont:Font13 AndAlpha:1.0 AndColor:TITLE_COLOR];
    }
    return _contentLabel;
}
- (UIButton *)yesButton{
    if (!_yesButton) {
        _yesButton = [UIButton addBtnWithTitle:@"是" WithFont:Font13 WithTitleNomalColor:REMARK_COLOR TitleHighlightedColor:cHBColor];
        _yesButton.layer.cornerRadius =6;
        _yesButton.layer.borderColor = REMARK_COLOR.CGColor;
        _yesButton.layer.borderWidth =px(2);
        _yesButton.clipsToBounds =YES;
        _yesButton.tag=0;
        [_yesButton addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.btnMutableArray addObject:_yesButton];
        
    }
    return _yesButton;
}
- (UIButton *)noButton{
    if (!_noButton) {
        _noButton = [UIButton addBtnWithTitle:@"否" WithFont:Font13 WithTitleNomalColor:REMARK_COLOR TitleHighlightedColor:cHBColor];
         _noButton.layer.cornerRadius =6;
         _noButton.layer.borderColor = REMARK_COLOR.CGColor;
        _noButton.layer.borderWidth =px(2);
        _noButton.clipsToBounds =YES;
        _noButton.tag =1;
        [ _noButton addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.btnMutableArray addObject:_noButton];
    }
    return _noButton;
}

-(void)clickAction:(UIButton *)btn
{
    
    for (UIButton *button in self.btnMutableArray) {
        
        button.layer.borderColor = REMARK_COLOR.CGColor;
        [button setTitleColor:TITLE_COLOR forState:UIControlStateNormal];
    }
    
    btn.layer.borderColor = cHBColor.CGColor;
    [btn setTitleColor:cHBColor forState:UIControlStateNormal];
 
    if (self.backSelectBlock) {
        self.backSelectBlock(btn);
    }
}
- (UIView *)line1{
    if (!_line1) {
        _line1 = [[UIView alloc]init];
        _line1.backgroundColor = BACKGROUND_COLOR;
    }
    return _line1;
}
- (UIView *)line2{
    if (!_line2) {
        _line2 = [[UIView alloc]init];
        _line2.backgroundColor = BACKGROUND_COLOR;
    }
    return _line2;
    
}

-(void)setHealthHistory:(HealthHistory *)healthHistory
{
    //默认为无疾病
    if (!healthHistory.jks.length) {

        _noButton.layer.borderColor = cHBColor.CGColor;
        [ _noButton setTitleColor:cHBColor forState:UIControlStateNormal];
    }
    
    else
    {
        _yesButton.layer.borderColor = cHBColor.CGColor;
        [_yesButton setTitleColor:cHBColor forState:UIControlStateNormal];
    }
}

@end
