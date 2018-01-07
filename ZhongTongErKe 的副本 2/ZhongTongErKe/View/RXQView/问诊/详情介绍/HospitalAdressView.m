//
//  HospitalAdressView.m
//  ZhongTongErKe
//
//  Created by khj on 2017/6/22.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "HospitalAdressView.h"


@interface HospitalAdressView ()

@property (nonatomic,strong) UIImageView *addressImageview;
@property (nonatomic ,strong) UIView *addressView;
@property (nonatomic,strong) UILabel *addressLabel;
@property (nonatomic,strong)  UIImageView *line3ImageView;
@property (nonatomic ,strong) UIView *locationView ;
@property (nonatomic,strong)  UIImageView *locationImageView;
@property (nonatomic,strong)  UILabel *locationLabel;
@end

@implementation HospitalAdressView

-(id)initWithFrame:(CGRect)frame
{
    
    if (self = [super initWithFrame:frame]) {
        
        self.addressImageview = [UIImageView createImageViewWithImageName:nil color:[UIColor colorWithHexString:@"f1eff0"]];
        [self addSubview: self.addressImageview];
        
        self.addressView = [[UIView alloc]init];
        [self addSubview: self.addressView];
        
        self.addressLabel = [UILabel addLabelWithText:@"医院地址" AndFont:Font15 AndAlpha:1.0 AndColor:TITLE_COLOR];
        [self.addressView addSubview:self.addressLabel];
        
        self.line3ImageView = [UIImageView createImageViewWithImageName:nil color:[UIColor colorWithHexString:@"f1eff0"]];
        [self.addressView addSubview:self.line3ImageView];
        
        self.locationView = [[UIView alloc]init];
        [self addSubview:self.locationView];
        
        self.locationImageView  = [[UIImageView alloc]initWithImage:[UIImage imageNamed:hos_LocationImageName]];
        [self.locationView addSubview:self.locationImageView];
        
        self.locationLabel = [UILabel addLabelWithText:@"" AndFont:Font13 AndAlpha:1.0 AndColor:TITLE_COLOR];
        [self.locationView addSubview:self.locationLabel];
        
        
        self.addressImageview.frame = CGRectMake(0, 0, kScreenWidth, px(20));
        
        self.addressView.frame = CGRectMake(0, CGRectGetMaxY( self.addressImageview.frame), kScreenWidth, px(54));
        
        self.addressLabel.sd_layout.leftSpaceToView(self.addressView,px(30)).rightSpaceToView(self.addressView,0).heightIs(Font15).centerYEqualToView( self.addressView);
        self.line3ImageView.sd_layout.widthIs(kScreenWidth).heightIs(px(2)).bottomSpaceToView(self.addressView,0);
        
        self.locationView.frame = CGRectMake(0, CGRectGetMaxY( self.addressView.frame), kScreenWidth, px(54));
        
        self.locationImageView.sd_layout.widthIs(self.locationImageView.image.size.width).heightIs(self.locationImageView.image.size.height).leftSpaceToView(self.locationView,px(30)).centerYEqualToView(self.locationView);
        
       
        self.locationLabel.sd_layout.leftSpaceToView( self.locationImageView,px(10)).rightSpaceToView(self.locationView,0).heightIs(Font13).centerYEqualToView(self.locationView);

    }
    
    return self;
}

-(void)setHospital:(Hospital *)hospital
{
   
    _hospital  = hospital;
    
     self.locationLabel.text = hospital.address;
    
}
@end
