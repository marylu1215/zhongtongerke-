//
//  DoctorEvaluateView.m
//  ZhongTongErKe
//
//  Created by khj on 2017/6/16.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "DoctorEvaluateView.h"
#import "TggStarEvaluationView.h"


@implementation DoctorEvaluateView

-(id)initWithFrame:(CGRect)frame EvaluArray:(NSArray *)evaluArray
{
    if (self = [super initWithFrame:frame]) {
        
     
        //列
        int totalloc = 4;
        CGFloat btnWidth = px(170)*kScreenWidthScale;
        CGFloat btnHeight = px(48);
        CGFloat btnX = 0;
        CGFloat btnY = 0;
        
        CGFloat margin=(kScreenWidth - totalloc * btnWidth-2*px(20))/(totalloc-1);
        
        for (int index = 0; index < evaluArray.count; index++) {
            
            // 行号
            int row = index / totalloc;
            // 列号
            int col = index % totalloc;
            
            btnX = px(20) + (margin + btnWidth) * col;
            btnY = px(40)+ (px(10) + btnHeight) * row;
            
           UIButton *verButton = [[UIButton alloc] init];
            verButton.tag = index;
            verButton.titleLabel.font = font(Font13);
            verButton.frame = CGRectMake(btnX, btnY, btnWidth, btnHeight);
            [verButton setTitle:evaluArray[index] forState:UIControlStateNormal];
            [verButton setTitleColor:cHBColor forState:UIControlStateNormal];
            [verButton setTitleColor:c255255255 forState:UIControlStateSelected];
            verButton.layer.cornerRadius =6;
            verButton.clipsToBounds =YES;
            verButton.layer.borderColor =cHBColor.CGColor;
            verButton.layer.borderWidth =px(2);
          
            [verButton addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:verButton];
        }
        
       
        
    }
    return self;
}

-(void)btnClick:(UIButton *)btn
{
    btn.selected = !btn.selected;
}
@end
