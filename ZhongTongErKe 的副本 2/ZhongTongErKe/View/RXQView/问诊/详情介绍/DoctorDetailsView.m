//
//  DoctorDetailsView.m
//  ZhongTongErKe
//
//  Created by khj on 2017/7/7.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "DoctorDetailsView.h"
#import "SectionHeaderView.h"
#import "WorkTableViewCell.h"


@implementation DoctorDetailsView

-(id)initWithMarkArray:(NSArray *)markArray
{
    if (self = [super init]) {
        
        self.backgroundColor = c255255255;
       SectionHeaderView  *headerView = [[SectionHeaderView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 30) LeftImagrName:homeThemeImageName Info:@"热门资讯" Margin:px(30)];
        [self addSubview:headerView];
        
        UIImageView *sepImageView = [UIImageView createImageViewWithImageName:@"" color:[UIColor colorWithHexString:@"aaaaaa"]];
        [self addSubview:sepImageView];
        sepImageView.sd_layout.widthIs(kScreenWidth).heightIs(px(2)).topSpaceToView(headerView,0);
        
        //列
        int totalloc = 4;
        CGFloat labelWidth = (kScreenWidth-2*px(30)-3*px(20))/totalloc;
        CGFloat labelHeight = px(50);
        CGFloat labelX = 0;
        CGFloat labelY = 0;
        CGFloat margin= px(30);
        
        for (int i = 0; i < markArray.count; i++) {
            
            // 行号
            int row = i / totalloc;
            // 列号
            int col = i % totalloc;
            
            labelX = margin + (px(20) + labelWidth) * col;
            labelY = 31+px(10) + (px(10) + labelHeight) * row;
            UILabel *titleLabel = [UILabel labelWithText:markArray[i]  Font:Font13*kScreenWidthScale Color:REMARK_COLOR Alignment:NSTextAlignmentCenter];
            titleLabel.layer.cornerRadius =6;
            titleLabel.clipsToBounds = YES;
            titleLabel.layer.borderColor = aSepBgColor.CGColor;
            titleLabel.layer.borderWidth = px(2);
             titleLabel.frame = CGRectMake(labelX, labelY, labelWidth, labelHeight);
            [self addSubview:titleLabel];
        }
        
        
        
        CGFloat superMsgViewH = 0;
        superMsgViewH = CGRectGetMaxY(self.subviews.lastObject.frame)+px(10);
        CGRect bounds = self.bounds;
        bounds.size.height = superMsgViewH;
        self.bounds=bounds;
        
        UIImageView *bottomImageView = [UIImageView createImageViewWithImageName:nil color:sepBgColor];
        [self addSubview:bottomImageView];
        bottomImageView.sd_layout.widthIs(kScreenWidth).heightIs(px(2)).bottomSpaceToView(self,0);
        

    }
    
    return self;
}

@end
