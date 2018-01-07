//
//  SSDocDetailHeader2.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/16.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSDocDetailHeader2.h"

@interface  SSDocDetailHeader2 ()
@property (nonatomic ,strong) NSMutableArray *btnMutableArray;

@end
@implementation SSDocDetailHeader2

-(NSMutableArray *)btnMutableArray
{
    if (!_btnMutableArray) {
        
        _btnMutableArray = [NSMutableArray new];
    }
    return _btnMutableArray;
}
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubviews];
        [self makeConstaits];
    }
    return self;
}

- (void)addSubviews{
    //[self addSubview:self.button1];
    [self addSubview:self.button2];
    [self addSubview:self.button3];
    [self addSubview:self.button4];
    [self addSubview:self.button5];
    [self addSubview:self.headLabel];
    
    self.sepView = [UIImageView createImageViewWithImageName:nil color:sepBgColor];
    [self addSubview:self.sepView];
    
    
}

- (void)makeConstaits{
//    [self.button1 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(7*kScreenHeightScale);
//        make.size.mas_equalTo(CGSizeMake(60*kScreenWidthScale, 90*kScreenHeightScale));
//        make.left.mas_equalTo(10*kScreenWidthScale);
//    }];
    [self.button2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(7*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(60*kScreenWidthScale, 90*kScreenHeightScale));
        make.left.mas_equalTo(10*kScreenWidthScale);
        //make.centerX.mas_equalTo(self.mas_centerX).multipliedBy(0.5);
    }];
    [self.button3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(7*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(60*kScreenWidthScale, 90*kScreenHeightScale));
       // make.left.mas_equalTo(153*kScreenWidthScale);
        make.centerX.mas_equalTo(self.mas_centerX).multipliedBy(0.7);
    }];
    [self.button4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(7*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(60*kScreenWidthScale, 90*kScreenHeightScale));
       // make.left.mas_equalTo(224*kScreenWidthScale);
        //make.left.mas_equalTo(1.25);
        make.centerX.mas_equalTo(self.mas_centerX).multipliedBy(1.25);
    }];
    [self.button5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(7*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(60*kScreenWidthScale, 90*kScreenHeightScale));
        make.left.mas_equalTo(295*kScreenWidthScale);
    }];
    [self.headLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(90*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(kScreenWidth-2*px(30), 50*kScreenHeightScale));
        make.left.mas_equalTo(px(30)*kScreenWidthScale);
    }];
    
    self.sepView.sd_layout.widthIs(kScreenWidth).heightIs(px(10)).topSpaceToView(self.headLabel,0);
   
}


//- (SSDocDeTailButton *)button1{
//    if (!_button1) {
//        _button1 = [[SSDocDeTailButton alloc]init];
//        [_button1 addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
//         _button1.tag=1;
//        [self.btnMutableArray  addObject:_button1];
//        
//    }
//    return _button1;
//}
- (SSDocDeTailButton *)button2{
    if (!_button2) {
        _button2 = [[SSDocDeTailButton alloc]init];
         [self.btnMutableArray  addObject:_button2];
         _button2.tag=2;
         [_button2 addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button2;
}
- (SSDocDeTailButton *)button3{
    if (!_button3) {
        _button3 = [[SSDocDeTailButton alloc]init];
         [self.btnMutableArray  addObject:_button3];
         _button3.tag=3;
         [_button3 addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button3;
}
- (SSDocDeTailButton *)button4{
    if (!_button4) {
        _button4 = [[SSDocDeTailButton alloc]init];
         [self.btnMutableArray  addObject:_button4];
         _button4.tag=4;
         [_button4 addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button4;
}
- (SSDocDeTailButton *)button5{
    if (!_button5) {
        _button5 = [[SSDocDeTailButton alloc]init];
         [self.btnMutableArray  addObject:_button5];
        _button5.tag=5;
         [_button5 addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button5;
}

- (UILabel *)headLabel{
    if (!_headLabel) {
        _headLabel = [[UILabel alloc]init];
        _headLabel.textColor = REMARK_COLOR;
        _headLabel.font = [UIFont systemFontOfSize:12*kScreenHeightScale];
        _headLabel.numberOfLines = 0;
    }
    return _headLabel;
}

-(void)clickAction:(SSDocDeTailButton *)btn
{
    for (UIButton *button in self.btnMutableArray) {
        
       button.layer.borderColor = c255255255.CGColor;
        button.layer.borderWidth =0;
        button.layer.cornerRadius=0;
      
    }
    btn.layer.borderColor =S_COLOR.CGColor;
    btn.layer.borderWidth =px(2);
    btn.layer.cornerRadius=6;
    btn.clipsToBounds =YES;
    
    if (self.clickBlock) {
        self.clickBlock(btn);
    }
    
    
}
@end
