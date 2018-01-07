//
//  numberChooseBtnView.m
//  NYHealth
//
//  Created by xufeng on 16/2/19.
//  Copyright © 2016年 HY. All rights reserved.
//
#define cornerR 3
#import "numberChooseBtnView.h"

@interface numberChooseBtnView ()


@end

@implementation numberChooseBtnView
+(numberChooseBtnView *)numberChooseBtnViewWith:(int)number;{
    numberChooseBtnView *numberView = [[self alloc]init];
    numberView.number = number;
    numberView.numberLabel.text = [NSString stringWithFormat:@"%d",numberView.number];
    if (number == 1) {
        numberView.leftBtn.enabled = NO;
    }
    else if (number > 1){
        numberView.leftBtn.enabled = YES;
    }
    return numberView;
}
-(instancetype)init{
    if(self = [super init]){
        self.backgroundColor = [UIColor whiteColor];
        self.layer.borderColor = sepBgColor.CGColor;
        self.layer.borderWidth = 1;
        self.layer.cornerRadius = cornerR;
        //剪裁超出父视图范围的子视图部分
        self.clipsToBounds = YES;
        
        UIButton *leftBtn = [[UIButton alloc]init];
        _leftBtn = leftBtn;
        [self addSubview:leftBtn];
        [leftBtn setTitle:@"-" forState:(UIControlStateNormal)];
        leftBtn.titleLabel.font = [UIFont systemFontOfSize:px(40)];
        [leftBtn setTitleColor:TITLE_COLOR forState:(UIControlStateNormal)];
      
        leftBtn.layer.borderColor = sepBgColor.CGColor;
        leftBtn.layer.borderWidth = 1;
        leftBtn.enabled = NO;
        
        UIButton *rightBtn = [[UIButton alloc]init];
        _rightBtn = rightBtn;
        [self addSubview:rightBtn];
        [rightBtn setTitle:@"+" forState:(UIControlStateNormal)];
        rightBtn.titleLabel.font = [UIFont systemFontOfSize:px(40)];
        [rightBtn setTitleColor:TITLE_COLOR forState:(UIControlStateNormal)];
        rightBtn.layer.borderColor = sepBgColor.CGColor;
        rightBtn.layer.borderWidth = 1;
        
        UILabel *numberLabel = [[UILabel alloc]init];
        _numberLabel = numberLabel;
        [self addSubview:numberLabel];
        numberLabel.text = [NSString stringWithFormat:@"%d",_number];
        numberLabel.font = [UIFont systemFontOfSize:px(30)];
        numberLabel.textColor = TITLE_COLOR;
        numberLabel.textAlignment = NSTextAlignmentCenter;
        
    }
    return self;
}
-(void)leftBtnClick{
 
    if (_number > 1) {
        _number--;
        _numberLabel.text = [NSString stringWithFormat:@"%d",_number];
    }
    if (_number == 1) {
        _leftBtn.enabled = NO;
    }
    if (_number < 999) {
        _rightBtn.enabled = YES;
    }
}
-(void)rightBtnClick{
        _number++;
    _numberLabel.text = [NSString stringWithFormat:@"%d",_number];
    if (_number > 1) {
        _leftBtn.enabled = YES;
    }
    if (_number > 999) {
        _rightBtn.enabled = NO;
    }
}
-(void)layoutSubviews{
//    CGFloat width = self.width / 3;
    CGFloat height = self.height;
    _leftBtn.frame = CGRectMake(0, 0, (self.width - px(76))/2, height);
    _numberLabel.frame = CGRectMake(CGRectGetMaxX(_leftBtn.frame), 0, px(76), height);
    _rightBtn.frame = CGRectMake(CGRectGetMaxX(_numberLabel.frame), 0, (self.width - px(76))/2, height);
}
@end
