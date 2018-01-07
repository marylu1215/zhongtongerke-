//
//  SelectPicOrTextView.m
//  ZhongTongErKe
//
//  Created by khj on 2017/6/15.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SelectPicOrTextView.h"

@interface  SelectPicOrTextView ()

@property (nonatomic ,strong) UIView *topSepView;
@property (nonatomic ,strong) UIView *midView;
@property (nonatomic ,strong) UIButton *textButton;
@property (nonatomic ,strong) UIView *textView;

@property (nonatomic ,strong) UIButton *picButton;
@property (nonatomic ,strong) UIView *picView;

@end

@implementation SelectPicOrTextView

-(id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.topSepView = [[UIView alloc]init];
        [self addSubview:self.topSepView];
        self.topSepView.backgroundColor = [UIColor colorWithHexString:@"aaaaaa"];
        self.topSepView.sd_layout.widthIs(kScreenWidth).heightIs(px(2)).topSpaceToView(self,0);
        
        self.midView = [[UIView alloc]init];
        [self addSubview:self.midView];
        self.midView.backgroundColor = [UIColor colorWithHexString:@"aaaaaa"];
         self.midView.sd_layout.widthIs(px(2)).heightIs(px(80)).centerXEqualToView(self).centerYEqualToView(self);
        
        self.textView = [[UIView alloc]init];
        [self addSubview:self.textView];
        self.textView.sd_layout.leftSpaceToView(self,0).rightSpaceToView( self.midView,0).topSpaceToView(self,0).bottomSpaceToView(self,0);
        
        
        self.picView = [[UIView alloc]init];
        [self addSubview:self.picView];
        self.picView.sd_layout.rightSpaceToView(self,0).leftSpaceToView( self.midView,0).topSpaceToView(self,0).bottomSpaceToView(self,0);
        
        
        self.textButton = [UIButton  addBtnImage:@"keybod" WithTarget:self action:@selector(clickAction:)];
        [self.textView addSubview:self.textButton];
        self.textButton.tag = 0;
        self.textButton.sd_layout.widthIs(self.textButton.imageView.image.size.width).heightIs(self.textButton.imageView.image.size.height).centerYEqualToView(self.textView).centerXEqualToView(self.textView);
        
        
        self.picButton = [UIButton  addBtnImage:@"selectPic" WithTarget:self action:@selector(clickAction:)];
        self.picButton.tag = 1;
        [self.picView addSubview: self.picButton];
        
        self.picButton.sd_layout.widthIs(self.picButton.imageView.image.size.width).heightIs(self.picButton.imageView.image.size.height).centerYEqualToView(self.picView).centerXEqualToView(self.picView);
    }
    return self;
}


-(void)clickAction:(UIButton *)btn
{
    if (self.btnSelectBlock) {
        
        self.btnSelectBlock(btn);
    }
}

@end
