//
//  TitleButton.m
//  ZhongTongErKe
//
//  Created by khj on 2017/6/26.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "TitleButton.h"

@interface TitleButton ()

@property (nonatomic ,strong) UIImageView *vLineImageView;
@property (nonatomic ,strong) UIImageView *tLineImageView;
@property (nonatomic ,strong) UIImageView *btnImageView;
@property (nonatomic ,strong) UILabel *btnTitleLabel;

@end


@implementation TitleButton

-(id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.vLineImageView = [UIImageView createImageViewWithImageName:nil color:sepBgColor];
        [self addSubview: self.vLineImageView];
        
        self.tLineImageView = [UIImageView createImageViewWithImageName:nil color:sepBgColor];
        [self addSubview:self.tLineImageView];
        
        self.btnImageView = [[UIImageView alloc]init];
        [self addSubview:self.btnImageView];
        
        self.btnTitleLabel = [UILabel addLabelWithText:@"" AndFont:Font13 AndAlpha:1.0 AndColor:TITLE_COLOR];
        [self addSubview:self.btnTitleLabel];
        
        
       
    }
    
    return self;
}

-(void)setAssessment:(Assessment *)assessment
{
    _assessment = assessment;
   [self.btnImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",ImageBaseURL,assessment.img]]];
    self.vLineImageView.sd_layout.widthIs(px(2)).topSpaceToView(self,0).bottomSpaceToView(self,0).rightSpaceToView(self,0);
    self.tLineImageView.sd_layout.leftSpaceToView(self,0).rightSpaceToView(self,0).heightIs(px(2)).bottomSpaceToView(self,0);
    
    self.btnImageView.sd_layout.widthIs(px(60)).heightIs(px(60)).topSpaceToView(self,px(50)).centerXEqualToView(self);
    
    self.btnTitleLabel.text = assessment.ceshi_name;
    self.btnTitleLabel.sd_layout.widthIs([NSString backSizeWithText: self.btnTitleLabel.text andFont:font(Font13)].width).centerXEqualToView(self).bottomSpaceToView(self,px(50)).heightIs(Font13);
}

- (void)setAdministrative:(Administrative *)administrative
{
    
    _administrative = administrative;
    [self.btnImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",ImageBaseURL,administrative.img]] placeholderImage:[UIImage imageNamed:@"hhzlIcon"]];
    self.vLineImageView.sd_layout.widthIs(px(2)).topSpaceToView(self,0).bottomSpaceToView(self,0).rightSpaceToView(self,0);
    self.tLineImageView.sd_layout.leftSpaceToView(self,0).rightSpaceToView(self,0).heightIs(px(2)).bottomSpaceToView(self,0);
    
    self.btnImageView.sd_layout.widthIs(px(60)).heightIs(px(60)).topSpaceToView(self,(kScreenWidth/4-px(90))/2).centerXEqualToView(self);
    
    self.btnTitleLabel.text = administrative.department;
    self.btnTitleLabel.sd_layout.widthIs([NSString backSizeWithText: self.btnTitleLabel.text andFont:font(Font13)].width).centerXEqualToView(self).bottomSpaceToView(self,(kScreenWidth/4-px(90))/2).heightIs(Font13);
}
@end
