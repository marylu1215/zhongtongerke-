//
//  CourseTitleView.m
//  ZhongTongErKe
//
//  Created by khj on 2017/6/20.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "CourseTitleView.h"

@interface CourseTitleView ()

@property (nonatomic ,strong) UILabel *titleLabel;

@property (nonatomic ,strong) UIImageView *bottomImageView;

@property (nonatomic ,strong) UIImageView *rightImageView;

@end


@implementation CourseTitleView

-(id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.titleLabel = [UILabel labelWithText:@"" Font:Font13 Color:TITLE_COLOR Alignment:NSTextAlignmentCenter];
        [self addSubview:self.titleLabel];
      
        
        self.bottomImageView = [UIImageView createImageViewWithImageName:nil color:[UIColor colorWithHexString:@"e9e9e9"]];
        [self addSubview:self.bottomImageView];
        self.bottomImageView.sd_layout.leftSpaceToView(self,0).rightSpaceToView(self,0).heightIs(px(2)).bottomSpaceToView(self,0);
        
        self.rightImageView = [UIImageView createImageViewWithImageName:nil color:[UIColor colorWithHexString:@"e9e9e9"]];
        [self addSubview:self.rightImageView];
        
        self.rightImageView.sd_layout.rightSpaceToView(self,0).widthIs(px(2)).topSpaceToView(self,0).bottomSpaceToView(self,0);
    }
    return self;
}
-(void)setCourseStr:(NSString *)courseStr
{
    _courseStr = courseStr;
    self.titleLabel.text = courseStr;
    
    self.titleLabel.sd_layout.centerXEqualToView(self).centerYEqualToView(self).heightIs(Font13).widthIs([NSString backSizeWithText:self.titleLabel.text andFont:font(Font13)].width);
}

@end
