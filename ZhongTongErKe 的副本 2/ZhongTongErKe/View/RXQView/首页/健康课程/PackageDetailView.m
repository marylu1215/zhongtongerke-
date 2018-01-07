//
//  PackageDetailView.m
//  ZhongTongErKe
//
//  Created by khj on 2017/6/20.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "PackageDetailView.h"

@interface PackageDetailView ()

@property (nonatomic ,strong) UIImageView *headImageView;
@property (nonatomic ,strong) UIView *courseView;
@property (nonatomic ,strong) UILabel *courseLabel;
@property (nonatomic ,strong) UILabel *stateLabel;
@property (nonatomic ,strong) UIView *sepView;
@property (nonatomic ,strong) UIButton *seHealthButton;
@property (nonatomic ,strong) UILabel *selectLabel;
@property (nonatomic ,strong) UILabel *nameLabel;
@property (nonatomic ,strong) UIImageView *rightArrow;
@property (nonatomic ,strong) UIImageView *lineView;
@property (nonatomic ,strong) UIView *classHourView;
@property (nonatomic ,strong) UILabel *classLabel;
@property (nonatomic ,strong) UIImageView  *piImageView;
@property (nonatomic ,strong) UILabel *piNumberLabel;
@property (nonatomic ,strong) UIView *bottomView;

@end

@implementation PackageDetailView

-(id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self prepareUI];
        [self configueFrame];
        
    }
    return self;
}

-(void)prepareUI
{
    self.headImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:DetailsbannerIconImageName]];
    [self addSubview: self.headImageView];
    
    self.courseView  = [[UIView alloc]init];
    self.courseView.backgroundColor = c255255255;
    [self addSubview:self.courseView];
    
    self.courseLabel = [UILabel addLabelWithText:@"" AndFont:18 AndAlpha:1.0 AndColor:[UIColor colorWithHexString:@"333333"]];
    [self.courseView addSubview:self.courseLabel];
    
    self.stateLabel = [UILabel addLabelWithText:@"" AndFont:18 AndAlpha:1.0 AndColor:REMARK_COLOR];
    [self.courseView addSubview:self.stateLabel];
    
    self.sepView = [[UIView alloc]init];
    self.sepView.backgroundColor = [UIColor colorWithHexString:@"f1f0f0"];
    [self addSubview:self.sepView];
    
    self.seHealthButton = [UIButton addBgBtnWithBGClor:c255255255 Target:self Action:@selector(selectAction)];
    [self addSubview:self.seHealthButton];
    
    self.selectLabel = [UILabel addLabelWithText:@"选择健康档案" AndFont:15 AndAlpha:1.0 AndColor:[UIColor colorWithHexString:@"333333"]];
    [self.seHealthButton addSubview:self.selectLabel];
    
    self.nameLabel = [UILabel addLabelWithText:@"" AndFont:Font15 AndAlpha:1.0 AndColor:[UIColor colorWithHexString:@"333333"]];
    self.nameLabel.textAlignment = NSTextAlignmentRight;
    [self.seHealthButton addSubview: self.nameLabel];
   
    self.rightArrow = [[UIImageView alloc]initWithImage:[UIImage imageNamed:rightImageName]];
    [self.seHealthButton addSubview:self.rightArrow];

    self.lineView  = [UIImageView createImageViewWithImageName:nil color:[UIColor colorWithHexString:@"f1f0f0"]];
    [self addSubview:self.lineView];
    
    self.classHourView = [[UIView alloc]init];
    self.classHourView.backgroundColor =c255255255;
    [self addSubview:self.classHourView];
    
    self.classLabel = [UILabel addLabelWithText:@"课时需求" AndFont:Font15 AndAlpha:1.0 AndColor:[UIColor colorWithHexString:@"333333"]];
    [self.classHourView addSubview: self.classLabel];
    
    self.piImageView = [UIImageView createImageViewWithImageName:nil color:[UIColor colorWithHexString:@"aaaaaa"]];
    [self.classHourView addSubview: self.piImageView];
    
    self.piNumberLabel = [UILabel addLabelWithText:@"节" AndFont:Font15 AndAlpha:1.0 AndColor:[UIColor colorWithHexString:@"333333"]];
    [self.classHourView addSubview:self.piNumberLabel];
    
    self.bottomView = [[UIView alloc]init];
    self.bottomView.backgroundColor = [UIColor colorWithHexString:@"f1f0f0"];
    [self addSubview:self.bottomView];
}

-(void)configueFrame
{
    self.headImageView.sd_layout.widthIs(self.headImageView.image.size.width).heightIs(px(266)).topSpaceToView(self,0).centerXEqualToView(self);

    self.courseView.sd_layout.widthIs(kScreenWidth).heightIs(px(76)).topSpaceToView(self.headImageView,0);
    
    self.sepView.sd_layout.widthIs(kScreenWidth).heightIs(px(20)).topSpaceToView( self.courseView,0);
    
    self.seHealthButton.sd_layout.widthIs(kScreenWidth).heightIs(px(80)).topSpaceToView(self.sepView,0);
    
    self.selectLabel.sd_layout.widthIs([NSString backSizeWithText:self.selectLabel.text andFont:font(Font15)].width).heightIs(Font15).leftSpaceToView(self.seHealthButton,px(30)).centerYEqualToView(self.seHealthButton);
    
    self.rightArrow.sd_layout.widthIs(self.rightArrow.image.size.width).heightIs(self.rightArrow.image.size.height).rightSpaceToView(self.seHealthButton,px(30)).centerYEqualToView(self.seHealthButton);
    
    self.nameLabel.sd_layout.leftSpaceToView( self.rightArrow,px(10)).rightSpaceToView(self.selectLabel,px(10)).heightIs(Font15).centerYEqualToView(self.seHealthButton);
    
    self.lineView.sd_layout.widthIs(kScreenWidth).heightIs(px(2)).topSpaceToView( self.seHealthButton,0);
    
    self.classHourView.sd_layout.widthIs(kScreenWidth).heightIs(px(80)).topSpaceToView(self.lineView,0);
    
    self.classLabel.sd_layout.widthIs([NSString backSizeWithText:self.classLabel.text andFont:font(Font15)].width).heightIs(Font15).centerYEqualToView(self.classHourView).leftSpaceToView(self.classHourView,px(30));
    
    self.piNumberLabel.sd_layout.widthIs([NSString backSizeWithText:self.piNumberLabel.text andFont:font(Font15)].width).heightIs(Font15).centerYEqualToView(self.classHourView).rightSpaceToView(self.classHourView,px(30));
    
    self.piImageView.sd_layout.widthIs(px(140)).heightIs(px(2)).rightSpaceToView(self.piNumberLabel,0).bottomSpaceToView(self.classHourView,px(20));
    
    self.bottomView.sd_layout.widthIs(kScreenWidth).heightIs(px(20)).bottomSpaceToView(self,0);
}
-(void)selectAction
{
    if (self.ClickBlock) {
        
        self.ClickBlock();
    }
}
-(void)setCourse:(Course *)course
{
    _course = course;
    
    self.courseLabel.text = course.title;
    self.courseLabel.sd_layout.widthIs([NSString backSizeWithText:self.courseLabel.text andFont:font(18)].width).heightIs(18).centerYEqualToView(self.courseView).leftSpaceToView(self.courseView,px(30));
    
    self.stateLabel.text = @"已参与";
     self.stateLabel.sd_layout.widthIs([NSString backSizeWithText:self.stateLabel.text andFont:font(18)].width).heightIs(18).centerYEqualToView(self.courseView).rightSpaceToView(self.courseView,px(30));
}
@end
