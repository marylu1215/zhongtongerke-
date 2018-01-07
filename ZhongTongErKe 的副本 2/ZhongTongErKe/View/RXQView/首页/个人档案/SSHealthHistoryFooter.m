//
//  SSHealthHistoryFooter.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/9.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSHealthHistoryFooter.h"
#import "Disease.h"
#import "WorkTableViewCell.h"

@interface SSHealthHistoryFooter ()

@property (nonatomic ,strong) NSMutableArray *btnMutableArray;

@end

@implementation SSHealthHistoryFooter

-(NSMutableArray *)btnMutableArray
{
    if (!_btnMutableArray) {
        
        _btnMutableArray = [NSMutableArray new];
    }
    return _btnMutableArray;
}
- (instancetype)initWithFrame:(CGRect)frame withDiseaseArr:(NSArray *)diseaseArr{
    if (self = [super initWithFrame:frame]) {

        //列
        int totalloc = 3;
        CGFloat btnWidth = px(210)*kScreenWidthScale;
        CGFloat btnHeight = px(50);
        CGFloat btnX = 0;
        CGFloat btnY = 0;
        CGFloat margin= (kScreenWidth-totalloc*btnWidth-(totalloc-1)*px(20))/2;

        for (int index=0; index<diseaseArr.count; index++)
        {
            
            // 行号
            int row = index / totalloc;
            // 列号
            int col = index % totalloc;
            
            btnX = margin + (btnWidth+px(20)) * col;
            btnY = px(20) + (px(20) + btnHeight) * row;
        
            Disease *disease = diseaseArr[index];
            
            UIButton *diseaseBtn = [UIButton addBtnWithTitle:disease.title WithBGImg:nil WithFont:Font13 WithTitleColor:REMARK_COLOR Target:self Action:@selector(chooseAction:)];
            diseaseBtn.tag = index;
            [diseaseBtn setTitleColor:cHBColor forState:UIControlStateSelected];
            diseaseBtn.layer.cornerRadius = btnRadius;
            diseaseBtn.clipsToBounds = YES;
            diseaseBtn.layer.borderColor = REMARK_COLOR.CGColor;
            diseaseBtn.layer.borderWidth = px(2);
            [self addSubview:diseaseBtn];
            diseaseBtn.frame = CGRectMake(btnX, btnY, btnWidth, btnHeight);
            [self.btnMutableArray addObject:diseaseBtn];
        }
    }
    return self;
}


-(void)chooseAction:(UIButton *)btn
{
  
        btn.selected = !btn.selected;
        
        if (btn.selected) {
            
            if ([btn.titleLabel.text isEqualToString:@"其他"]) {
                
                for (UIButton *button in self.btnMutableArray) {
                    
                    button.layer.borderColor  = REMARK_COLOR.CGColor;
                    button.selected = NO;
                    button.userInteractionEnabled = NO;
                }
                
                btn.userInteractionEnabled = YES;
                btn.selected = YES;
            }
            
              btn.layer.borderColor = cHBColor.CGColor;
            
           
        }
        else
        {
            if ([btn.titleLabel.text isEqualToString:@"其他"]) {
                for (UIButton *button in self.btnMutableArray) {
                    button.userInteractionEnabled = YES;
                }
                
            }

            btn.layer.borderColor = REMARK_COLOR.CGColor;
        }
    
   
    if (self.backDiseBlock) {
        self.backDiseBlock(btn);
    }
}


-(void)setDiseaseArray:(NSArray *)diseaseArray
{
    for (UIButton *button in self.btnMutableArray) {
        
        
        for (int index=0; index<diseaseArray.count; index++) {
            
            
            if ([button.titleLabel.text isEqualToString:diseaseArray[index]]) {
                
                button.selected = NO;
                [self chooseAction:button];
            }
            
            else
            {
                if (diseaseArray.count==1) {
                    
                    UIButton *button = self.btnMutableArray.lastObject;
                    button.selected = NO;
                    [self chooseAction:button];
                }

            }
        }
    }
}



@end
