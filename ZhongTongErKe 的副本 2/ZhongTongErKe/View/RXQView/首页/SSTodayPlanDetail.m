//
//  SSTodayPlanDetail.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/2.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSTodayPlanDetail.h"

@interface SSTodayPlanDetail ()

@property (nonatomic ,strong) UIImageView *bottomImageView;

@property (nonatomic ,strong) UILabel *courseLabel;
@property (nonatomic  ,strong) UILabel *buyersLabel;

@end

@implementation SSTodayPlanDetail


- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
       
        [self addSubViews];
        [self makeConstraits];
    }
    return self;
}

- (void)addSubViews
{
    self.bottomImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:today_classsImageName]];
    [self addSubview:self.bottomImageView];
    
    self.courseLabel = [UILabel addLabelWithText:@"" AndFont:Font15 AndAlpha:1.0 AndColor:TITLE_COLOR];
    [ self.bottomImageView addSubview: self.courseLabel];
    
    self.buyersLabel = [UILabel addLabelWithText:@"" AndFont:Font13 AndAlpha:1.0 AndColor:REMARK_COLOR];
    [self.bottomImageView addSubview: self.buyersLabel];
    
    
}
- (void)makeConstraits
{
    self.bottomImageView.sd_layout.widthIs(self.bottomImageView.image.size.width).heightIs(self.bottomImageView.image.size.height).centerYEqualToView(self).centerXEqualToView(self);
    
    self.courseLabel.sd_layout.leftSpaceToView(self.bottomImageView ,px(206)).topSpaceToView(self.bottomImageView,px(24)).rightSpaceToView(self.bottomImageView,0).heightIs(Font15);
    
    self.buyersLabel.sd_layout.leftSpaceToView(self.bottomImageView,px(222)).topSpaceToView(self.courseLabel,px(14)).centerXEqualToView(self.courseLabel).heightIs(Font13).rightSpaceToView(self.bottomImageView,0);
}

-(void)setCourse:(Course *)course
{
    _course = course;
    self.courseLabel.text  = course.title;
    self.buyersLabel.text = course.num;
}

@end
