//
//  PackContentView.m
//  ZhongTongErKe
//
//  Created by khj on 2017/8/1.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "PackContentView.h"

@interface PackContentView ()

@property (nonatomic ,strong) UILabel *titleLabel;
@property (nonatomic ,strong) UIView *titleView;
@property (nonatomic ,strong) UIImageView *botomImageView;
@property (nonatomic ,strong) UILabel *desLabel;
@property (nonatomic ,strong) UIImageView *lineImageView;

@end


@implementation PackContentView

-(id)init
{
    
    if (self = [super init])
    {
        [self configueUI];
        [self configueFrame];
        
       
    }
    
    return self;
}

-(void)configueUI
{
    self.titleView = [[UIView alloc]init];
    [self addSubview:self.titleView];
    
    self.titleLabel = [UILabel addLabelWithText:@"套餐内容" AndFont:Font13 AndAlpha:1.0 AndColor:TITLE_COLOR];
    [self.titleView addSubview:self.titleLabel];
    
    self.botomImageView = [UIImageView createImageViewWithImageName:nil color:sepBgColor];
    [self.titleView addSubview:self.botomImageView];
    
    self.desLabel = [UILabel addLabelWithText:@"" AndFont:Font13 AndAlpha:1.0 AndColor:TITLE_COLOR];
    self.desLabel.numberOfLines = 0;
    [self addSubview: self.desLabel];
    
    self.lineImageView = [UIImageView createImageViewWithImageName:nil color:sepBgColor];
    [self addSubview:self.lineImageView];
    
  
}

-(void)configueFrame
{
    self.titleView.sd_layout.widthIs(kScreenWidth).heightIs(px(60)).topSpaceToView(self,0);
    
    self.titleLabel.sd_layout.leftSpaceToView(self.titleView,px(16)).heightIs(Font15).centerYEqualToView( self.titleView).rightSpaceToView(self.titleView,px(30));
    
    self.botomImageView.sd_layout.widthIs(kScreenWidth).heightIs(px(2)).bottomSpaceToView(self.titleView,0);
    
    self.lineImageView.sd_layout.widthIs(kScreenWidth).heightIs(px(2)).bottomSpaceToView(self,0);
    
}

-(void)setPackage:(Package *)package
{
    self.desLabel.text = package.content;
    NSDictionary *descDic = @{NSFontAttributeName:font(Font13)};
    CGRect descFrame =  [package.content textRectWithSize:CGSizeMake(kScreenWidth-(7+px(30)), MAXFLOAT) attributes:descDic];
    
    descFrame.origin.x = 7;
    descFrame.origin.y = px(66);
    self.desLabel.frame = descFrame;
    
    CGFloat  superMsgViewH  =0;
    superMsgViewH = CGRectGetMaxY(self.desLabel.frame)+px(16);
    CGRect bounds = self.bounds;
    bounds.size.height = superMsgViewH;
    self.bounds=bounds;

}
@end
