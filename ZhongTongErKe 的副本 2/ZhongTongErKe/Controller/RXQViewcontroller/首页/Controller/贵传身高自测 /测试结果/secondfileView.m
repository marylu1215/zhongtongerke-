//
//  secondfileView.m
//  ZhongTongErKe
//
//  Created by 研发部 on 2017/9/13.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "secondfileView.h"
#import "totalLabel.h"
@implementation secondfileView
-(id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
//        //偏矮
//        @property(nonatomic,strong)UILabel *aiLabel;
//        
//        //年龄身高
//        @property(nonatomic,strong)UILabel *heightLabel;
//        //90.cm
//        @property(nonatomic,strong)UILabel *cmLabel;
//        //低于儿童身高标准4CM
//        @property(nonatomic,strong)UILabel *standarLabel;
    
        _onview = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"low"]];
        _onview.layer.cornerRadius =20;
        _onview.layer.masksToBounds = YES;
        [self addSubview:_onview];
        [_onview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(15);
            make.top.mas_equalTo(20);
            make.size.mas_equalTo(CGSizeMake(40, 40));
            
        }];
        
//        @property(nonatomic,strong)totalLabel *upLabel;
//        @property(nonatomic,strong)totalLabel *middleLabel;
//        @property(nonatomic,strong)totalLabel *downLabel;
        
        _upLabel = [[totalLabel alloc]init];
        _upLabel.numberOfLines = 1;
        _upLabel.font = [UIFont systemFontOfSize:16];
        _upLabel.text =@"年龄身高";
        [self addSubview:_upLabel];
        [_upLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_onview.mas_top);
            make.left.mas_equalTo(_onview.mas_right).offset(15);
            make.height.mas_equalTo(14);
        }];

        _middleLabel = [[totalLabel alloc]init];
        _middleLabel.font = [UIFont systemFontOfSize:18];
        _middleLabel.text = @"90.0cm";
        [self addSubview:_middleLabel];
        [_middleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_upLabel.mas_bottom).offset(4);
            make.centerX.mas_equalTo(_upLabel.mas_centerX);
            make.height.mas_equalTo(18);
        }];
        _downLabel = [[totalLabel alloc]init];
        _downLabel.font = [UIFont systemFontOfSize:14];
        _downLabel.text = @"低于儿童标准4 cm";
        _downLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_downLabel];
        [_downLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_onview.mas_bottom).offset(5);
            make.left.mas_equalTo(_onview.mas_left).offset(14);
           // make.centerX.mas_equalTo(_onview.mas_centerX);
            make.height.mas_equalTo(14);
            
        }];
    }
    return self;
}

@end
