//
//  SSBottomScrollView.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/2.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSBottomScrollView.h"
#import "SSTodayPlanDetail.h"
#import "Course.h"

@implementation SSBottomScrollView



- (instancetype)initWithFrame:(CGRect)frame courseArray:(NSArray *)courseArray
{
    if (self = [super initWithFrame:frame]) {
       
        self.addCourseBtn = [UIButton addBtnImage:add_classsImageName WithTarget:self action:@selector(clickAction)];
        [self addSubview: self.addCourseBtn];
       
        
         self.addCourseBtn.sd_layout.widthIs(self.addCourseBtn.imageView.image.size.width).heightIs( self.addCourseBtn.imageView.image.size.height).leftSpaceToView(self,0).centerYEqualToView(self);

        for (int index=0; index<courseArray.count; index++) {
            
            SSTodayPlanDetail *todayPlanDetailView =[[SSTodayPlanDetail alloc]initWithFrame:CGRectMake(px(136)+index*(px(475)+px(13)), px(18), px(475), px(122))];
          
            todayPlanDetailView.course = courseArray[index];
            [self addSubview: todayPlanDetailView];
        }
        
        
        self.contentSize = CGSizeMake(courseArray.count*(px(475)+px(140)), 0);
      self.showsHorizontalScrollIndicator =NO;
    
    }
    return self;
}

-(void)clickAction
{
    
    if (self.chooseBlock) {
        
        self.chooseBlock();
        
    }
}

@end
