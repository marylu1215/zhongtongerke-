//
//  HealthTitleBtn.m
//  ZhongTongErKe
//
//  Created by khj on 2017/6/18.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "HealthTitleBtn.h"

@interface HealthTitleBtn ()

@property (nonatomic ,strong) UIImageView *healImageView;

@property (nonatomic ,strong) UILabel *healTitleLabel;

@property (nonatomic ,strong) UILabel *healPriceLabel;

@property (nonatomic ,strong) UIImageView *hImageView;

@property (nonatomic ,strong) UIImageView *vImageView;
@end
@implementation HealthTitleBtn

-(id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.healImageView = [[UIImageView alloc]init];
        [self addSubview:self.healImageView];
        
        self.healTitleLabel  = [UILabel addLabelWithText:@"" AndFont:12 AndAlpha:1.0 AndColor:[UIColor colorWithHexString:@"333333"]];
        [self addSubview:self.healTitleLabel];
        
        self.healPriceLabel  = [UILabel addLabelWithText:@"" AndFont:10 AndAlpha:1.0 AndColor:[UIColor colorWithHexString:@"aaaaaa"]];
        [self addSubview: self.healPriceLabel];
        
        self.hImageView = [UIImageView createImageViewWithImageName:nil color:[UIColor colorWithHexString:@"e9e9e9"]];
        [self addSubview: self.hImageView];
        
        self.vImageView = [UIImageView createImageViewWithImageName:nil color:[UIColor colorWithHexString:@"e9e9e9"]];
        [self addSubview: self.vImageView];
        
        
    }
    return self;
}

-(void)setCourse:(Course *)course
{
    _course =  course;
    
    [self.healImageView sd_setImageWithURL:[NSURL URLWithString:course.courseUrl] placeholderImage:[UIImage imageNamed:course.courseImageName]];
    self.healImageView.sd_layout.widthIs(self.healImageView.image.size.width).heightIs(self.healImageView.image.size.height).topSpaceToView(self,px(49)).centerXEqualToView(self);
    
    self.healTitleLabel.text = course.title;
    self.healTitleLabel.sd_layout.widthIs([NSString backSizeWithText:self.healTitleLabel.text andFont:font(12)].width).heightIs(12).topSpaceToView(self.healImageView,px(20)).centerXEqualToView(self);
    
    self.healPriceLabel.text = course.num;
     self.healPriceLabel.sd_layout.widthIs([NSString backSizeWithText:self.healPriceLabel.text andFont:font(10)].width).heightIs(10).topSpaceToView(self.healTitleLabel,px(10)).centerXEqualToView(self);
    
    self.hImageView.sd_layout.widthIs(px(2)).rightSpaceToView(self,0).topSpaceToView(self,0).bottomSpaceToView(self,0);
    self.vImageView.sd_layout.leftSpaceToView(self,0).rightSpaceToView(self,0).heightIs(px(2)).bottomSpaceToView(self,0);
}

@end
