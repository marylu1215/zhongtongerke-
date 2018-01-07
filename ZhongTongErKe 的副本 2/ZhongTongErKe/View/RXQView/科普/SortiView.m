//
//  SortiView.m
//  ZhongTongErKe
//
//  Created by khj on 2017/5/30.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SortiView.h"

@interface SortiView ()

@property (nonatomic ,strong) UILabel *sortiLabel;

@property (nonatomic ,strong) UIButton *arrowBtn;

@property (nonatomic ,strong) UIButton *bgBtn;

@end
@implementation SortiView

-(id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {

        self.bgBtn = [UIButton addBgBtnWithBGClor:c255255255 Target:self Action:@selector(sortAction:)];
        [self addSubview: self.bgBtn];
        self.bgBtn.sd_layout.topSpaceToView(self,0).bottomSpaceToView(self,0).leftSpaceToView(self,0).rightSpaceToView(self,0);
        
        self.sortiLabel = [UILabel addLabelWithText:@"智能排序" AndFont:12 AndAlpha:1.0 AndColor:cHBColor];
        [self addSubview:self.sortiLabel];
        
        self.arrowBtn = [UIButton addArrowBtnWithImageName:grayYslbImageName];
        [self addSubview:self.arrowBtn ];
        
        self.arrowBtn.sd_layout.widthIs(self.arrowBtn.imageView.image.size.width).heightIs(self.arrowBtn.imageView.image.size.height).rightSpaceToView(self,px(30)).centerYEqualToView(self);
        
         self.sortiLabel.sd_layout.widthIs([NSString backSizeWithText: self.sortiLabel.text andFont:font(12)].width).heightIs(12).rightSpaceToView( self.arrowBtn,px(10)).centerYEqualToView(self);
        
        
    }
    return self;
}


-(void)sortAction:(UIButton *)btn
{
    btn.selected = !btn.selected;
    //**默认降序
    BOOL isUP = NO;
    if (btn.selected) {
        [self.arrowBtn setImage:[UIImage imageNamed:greenYslbImageName] forState:UIControlStateNormal];
        isUP = YES;
    }
    else
    {
           [self.arrowBtn setImage:[UIImage imageNamed:grayYslbImageName] forState:UIControlStateNormal];
        isUP = NO;
    }
    if (self.sortBlock) {
        
        self.sortBlock(isUP);
    }
}


@end
