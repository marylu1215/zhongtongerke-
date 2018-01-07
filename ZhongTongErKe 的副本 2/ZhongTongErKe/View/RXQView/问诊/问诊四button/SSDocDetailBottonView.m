//
//  SSDocDetailBottonView.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/22.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSDocDetailBottonView.h"
#import "hospitalTitleView.h"
#import "HonorInfoView.h"
#import "HospitalAdressView.h"

@interface SSDocDetailBottonView ()



@end

@implementation SSDocDetailBottonView

-(instancetype)initWithHospital:(Hospital *)hospital
{
    if (self = [super init]) {
       
        [self addSubviewsWith:hospital];
       
    }
    return self;
}
-(void)addSubviewsWith:(Hospital *)hospital
{
    
    hospitalTitleView *titleView = [[hospitalTitleView alloc]init];
    [self addSubview:titleView];
    titleView.hospital = hospital;
   titleView.frame = CGRectMake(0, 0, kScreenWidth, titleView.bounds.size.height);
    
    HonorInfoView *infoView = [[HonorInfoView alloc]init];
     [self addSubview:infoView];
    infoView.hospital = hospital;
    infoView.frame = CGRectMake(0, CGRectGetMaxY(titleView.frame), kScreenWidth, infoView.bounds.size.height);

    HospitalAdressView *adressView = [[HospitalAdressView alloc]init];
    [self addSubview:adressView];
    adressView.hospital = hospital;
    adressView.frame = CGRectMake(0, CGRectGetMaxY(infoView.frame), kScreenWidth, px(158));
    
    CGFloat superMsgViewH = 0;
    superMsgViewH = CGRectGetMaxY(adressView.frame)+px(20);
    CGRect bounds = self.bounds;
    bounds.size.height = superMsgViewH;
    self.bounds=bounds;
}
@end
