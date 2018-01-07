//
//  CourseButton.m
//  ZhongTongErKe
//
//  Created by khj on 2017/6/20.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "CourseButton.h"

@interface CourseButton ()

@property (nonatomic ,strong) UIImageView *bottomImageView;

@property (nonatomic ,strong) UIImageView *rightImageView;
@end

@implementation CourseButton

-(id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.bottomImageView = [UIImageView createImageViewWithImageName:nil color:[UIColor colorWithHexString:@"e9e9e9"]];
        [self addSubview:self.bottomImageView];
        self.bottomImageView.sd_layout.leftSpaceToView(self,0).rightSpaceToView(self,0).heightIs(px(2)).bottomSpaceToView(self,0);
        
        self.rightImageView = [UIImageView createImageViewWithImageName:nil color:[UIColor colorWithHexString:@"e9e9e9"]];
        [self addSubview:self.rightImageView];
        
        self.rightImageView.sd_layout.rightSpaceToView(self,0).widthIs(px(2)).topSpaceToView(self,0).bottomSpaceToView(self,0);
        
    }
    return self;
}

@end
