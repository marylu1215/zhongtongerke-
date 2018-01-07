//
//  SSInteScoreView.m
//  ZhongTongErKe
//
//  Created by khj on 2017/5/28.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSInteScoreView.h"

@interface SSInteScoreView()

@property (nonatomic ,strong) UILabel *infoLabel;
@property (nonatomic ,strong) UIImageView *bottomImageView;

@end
@implementation SSInteScoreView

-(id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = c255255255;
        self.infoLabel = [UILabel addLabelWithText:@"" AndFont:12 AndAlpha:1.0 AndColor:cGrayWord];
        [self addSubview: self.infoLabel];
        
        self.bottomImageView = [UIImageView createImageViewWithImageName:nil color:sepBgColor];
        [self addSubview:self.bottomImageView];
        self.bottomImageView.sd_layout.widthIs(kScreenWidth).heightIs(px(2)).bottomSpaceToView(self,0);
    }
    return self;
}

-(void)setIntegral:(Integral *)integral
{


    
    self.infoLabel.text =  [NSString stringWithFormat:@"%@日 %@", [[integral.time componentsSeparatedByString:@"-"]lastObject],[NSString weekdayStringFromYYMMDDStr:integral.time]];
    
    self.infoLabel.sd_layout.widthIs([NSString backSizeWithText: self.infoLabel.text andFont:font(12)].width).heightIs(12).leftSpaceToView(self,px(20)).centerYEqualToView(self);
}

@end
