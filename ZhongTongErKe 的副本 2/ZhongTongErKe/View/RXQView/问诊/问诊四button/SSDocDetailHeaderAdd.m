//
//  SSDocDetailHeaderAdd.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/17.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSDocDetailHeaderAdd.h"

@implementation SSDocDetailHeaderAdd

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubviews];
        
        self.backgroundColor = [UIColor colorWithHexString:@"f1f0f0"];
    }
    return self;
}


- (void)addSubviews{
    
    self.topView = [[SSDocDeailHeader alloc]init];
    [self addSubview: self.topView];
    [self.topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(kScreenWidth, 351*kScreenHeightScale));
        make.left.mas_equalTo(0);
    }];
    
    self.bottomView = [[SSDocDetailHeader2 alloc]init];
    [self addSubview:self.bottomView];
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(361*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(kScreenWidth, px(300)*kScreenHeightScale));
        make.left.mas_equalTo(0);
    }];
    
    
}




-(void)setDoctor:(Doctor *)doctor
{
    
    self.topView.doctor  = doctor;
    
    
    
    self.bottomView.backgroundColor = c255255255;
    
//    self.bottomView.button1.headImageView.image = [UIImage imageNamed:proConsult_voice];
//    self.bottomView.button1.headLabel.text = @"在线咨询";
//    self.bottomView.button1.priceLabel.text = [NSString stringWithFormat:@"%@元/次", doctor.service.voice];
    
    
    self.bottomView.button2.headImageView.image = [UIImage imageNamed:docDetail_picConsult];
    self.bottomView.button2.headLabel.text = @"在线咨询";
   // self.bottomView.button2.priceLabel.text = [NSString stringWithFormat:@"%@元/次", doctor.service.text];
    self.bottomView.button2.priceLabel.text = @"免费";
    
    
    self.bottomView.button3.headImageView.image = [UIImage imageNamed:docDetail_phone];
    self.bottomView.button3.headLabel.text = @"电话咨询";
    self.bottomView.button3.priceLabel.text = [NSString stringWithFormat:@"%@元/次", doctor.service.tel];
    
    
    
    self.bottomView.button4.headImageView.image = [UIImage imageNamed:docDetail_guide];
    self.bottomView.button4.headLabel.text = @"院后指导";
    self.bottomView.button4.priceLabel.text = [NSString stringWithFormat:@"%@元/天", doctor.service.guidance[0]];
    self.bottomView.button5.headImageView.image = [UIImage imageNamed:docDetail_privateDoc];
    
    
    
    self.bottomView.button5.headLabel.text = @"私人医生";
    self.bottomView.button5.priceLabel.text = [NSString stringWithFormat:@"%@元/周",  doctor.service.priDoctor[0]];
    
    
    
    self.bottomView.headLabel.text = @"提问后医生会一分钟语音答复，提问可选公开或私密，公开的回达每被偷听一次，你分成¥0.5";
    
}

@end
