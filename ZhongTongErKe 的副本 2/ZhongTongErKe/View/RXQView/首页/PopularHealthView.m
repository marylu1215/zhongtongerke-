//
//  PopularHealthView.m
//  ZhongTongErKe
//
//  Created by khj on 2017/6/26.
//  Copyright © 2017年 Claf. All rights reserved.
//

#define btnNum 3
#import "PopularHealthView.h"
#import "SectionHeaderView.h"
#import "Assessment.h"

@interface PopularHealthView ()

@property (nonatomic ,strong) UIImageView *sepImageView;


@end
@implementation PopularHealthView

-(id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = c255255255;
      
        SectionHeaderView  *headerView = [[SectionHeaderView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 30) LeftImagrName:homeThemeImageName Info:@"热门健康评估" Margin:px(30)];
        [self addSubview:headerView];
        
        self.sepImageView = [UIImageView createImageViewWithImageName:nil color:sepBgColor];
        [self addSubview:self.sepImageView];
        
        self.sepImageView.sd_layout.widthIs(kScreenWidth).heightIs(px(2)).topSpaceToView(headerView,0);
        
       UIButton *moreBtn = [UIButton addBtnWithTitle:@"更多>>" WithBGImg:nil WithFont:Font13 WithTitleColor:cHBColor Target:self Action:@selector(moreAction)];
        [headerView addSubview: moreBtn];
       moreBtn.sd_layout.widthIs(px(100)).rightSpaceToView(headerView,px(20)).heightIs(Font13).centerYEqualToView(headerView);
    }
    
    return self;
}

-(void)setAssessmentArray:(NSArray *)assessmentArray
{
    _assessmentArray = assessmentArray;
    CGFloat btnWidth = kScreenWidth/btnNum;
    CGFloat btnHeight = px(190);
    
    for (int index=0; index<assessmentArray.count; index++)
    {
        TitleButton *titleButton = [[TitleButton alloc]initWithFrame:CGRectMake(btnWidth*index, 30, btnWidth, btnHeight)];
        titleButton.assessment = assessmentArray[index];
        [titleButton addTarget:self action:@selector(selectACtion:) forControlEvents:UIControlEventTouchUpInside];
        titleButton.tag = index;

        [self addSubview:titleButton];
    }
   
}
-(void)moreAction
{
    if (self.moreBlock) {
        self.moreBlock();
    }
}
-(void)selectACtion:(TitleButton *)titleButton
{
    if (self.selectBlock) {
        
        self.selectBlock(_assessmentArray[titleButton.tag]);
    }
}

@end
