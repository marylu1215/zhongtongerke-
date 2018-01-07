//
//  CourseDetailsView.m
//  ZhongTongErKe
//
//  Created by khj on 2017/6/18.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "CourseDetailsView.h"
#import "Course.h"
#import "CourseInfoView.h"
@interface CourseDetailsView ()

@property (nonatomic ,strong) UILabel *courseTitleLabel;

@property (nonatomic ,strong) UIView *courseView;

@property (nonatomic ,strong) UIView *bottomView;
@property (nonatomic ,strong) UILabel *detailLabel;
@property (nonatomic ,strong) UIImageView *sepImageView;

@property (nonatomic ,strong) CourseInfoView *infoView;

@property (nonatomic ,assign)  CGFloat y;
@property (nonatomic ,assign) CGRect descFrame;


@end

@implementation CourseDetailsView

- (id)initWithFrame:(CGRect)frame LeftcourseArray:(NSArray *)leftcourseArray  CourseInfo:(Course *)CourseInfo

{
    if (self  =[super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor colorWithHexString:@"f1f0f0"];
        
        self.courseView = [[UIView alloc]init];
        self.courseView .backgroundColor = c255255255;
        self.courseView.frame = CGRectMake(0, 0, kScreenWidth, px(70));
        [self addSubview: self.courseView];
       
    
        self.courseTitleLabel = [UILabel addLabelWithText:CourseInfo.title AndFont:18 AndAlpha:1.0 AndColor:[UIColor colorWithHexString:@"333333"]];
        [self.courseView addSubview:self.courseTitleLabel];
        self.courseTitleLabel.sd_layout.leftSpaceToView(self.courseView,px(30)).rightSpaceToView(self.courseView,0).heightIs(18).centerYEqualToView(self.courseView);
        
          
  
          NSArray *rightCourseArray = @[CourseInfo.adaptiveAge,CourseInfo.frequency,CourseInfo.period,CourseInfo.form,CourseInfo.goal];
       
       
        self.bottomView = [[UIView alloc]init];
        self.bottomView .backgroundColor = c255255255;
        [self addSubview:  self.bottomView];
        
        self.detailLabel = [UILabel addLabelWithText:@"课程详情" AndFont:15 AndAlpha:1.0 AndColor:[UIColor colorWithHexString:@"aaaaaa"]];
        self.detailLabel.frame =CGRectMake(px(30), px(14), kScreenWidth-px(30), Font15);
        [self.bottomView addSubview:self.detailLabel];
        
       
        self.sepImageView = [UIImageView createImageViewWithImageName:nil color:[UIColor colorWithHexString:@"e9e9e9"]];
        self.sepImageView.frame =CGRectMake(0, CGRectGetMaxY( self.detailLabel.frame)+px(10), kScreenWidth, px(2));
        [self.bottomView addSubview:self.sepImageView];
      
        

        for (int index =0; index<leftcourseArray.count; index++) {
            
            
           self.infoView = [[CourseInfoView alloc]initWithFrame:CGRectMake(0, px(64)+index*(CGRectGetMaxY(self.infoView.subviews.lastObject.frame)+px(20)), kScreenWidth, CGRectGetMaxY(self.infoView.subviews.lastObject.frame)+px(60)) LeftInfo:leftcourseArray[index] RightInfo:rightCourseArray[index]];
            [self.bottomView addSubview: self.infoView];
        }
        
        
        
        
        self.bottomView.frame =CGRectMake(0, CGRectGetMaxY(self.courseView.frame)+px(20), kScreenWidth, CGRectGetMaxY(self.bottomView.subviews.lastObject.frame));
        
        UIView *lastView = [[UIView alloc]init];
        [self addSubview:lastView];
        lastView.backgroundColor = c255255255;
        
        UILabel *leftLabel = [UILabel addLabelWithText:[NSString stringWithFormat:@"适应症状:"] AndFont:12 AndAlpha:1.0 AndColor:[UIColor colorWithHexString:@"333333"]];
        [lastView addSubview:leftLabel];
        leftLabel.sd_layout.widthIs([NSString backSizeWithText:leftLabel.text andFont:font(Font13)].width).heightIs(Font13).topSpaceToView(lastView,0).leftSpaceToView(lastView,px(38));
        
        UIImageView *circleImageView = [[UIImageView alloc]init];
        circleImageView.backgroundColor = cHBColor;
        circleImageView.layer.cornerRadius = px(10)/2;
         circleImageView.clipsToBounds =YES;
        [lastView addSubview:circleImageView];
        circleImageView.sd_layout.widthIs(px(10)).heightIs(px(10)).topSpaceToView(lastView,px(10)).rightSpaceToView( leftLabel,px(10));
        
    
       
        for (int index=0; index<CourseInfo.primaryArray.count; index++)
        {
              self.y += (self.descFrame.size.height);
            NSDictionary *descDic = @{NSFontAttributeName:font(Font13)};
            self.descFrame =  [CourseInfo.primaryArray[index] textRectWithSize:CGSizeMake(kScreenWidth - px(204), MAXFLOAT) attributes:descDic];
            
            UILabel *rightLabel =[UILabel addLabelWithText:CourseInfo.primaryArray[index] AndFont:Font13 AndAlpha:1.0 AndColor:[UIColor colorWithHexString:@"333333"]];
            rightLabel.numberOfLines =0;
            
            [lastView addSubview:rightLabel];
            
          rightLabel.frame = CGRectMake(px(154),self.y,self.descFrame.size.width ,self.descFrame.size.height);
        }
        
        lastView.frame = CGRectMake(0, CGRectGetMaxY(self.bottomView.frame)+px(30), kScreenWidth, CGRectGetMaxY(lastView.subviews.lastObject.frame));
    
        
    }
    return self;
}


@end
