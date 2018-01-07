//
//  SSDocDetailTopView.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/21.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSDocDetailTopView.h"

@interface SSDocDetailTopView ()

@property (nonatomic,strong) UIImageView *bgImageView;
@property (nonatomic,strong) UIView  *bottomSeparator;
@property (nonatomic,strong) UILabel *hospitalLabel;
@property (nonatomic,strong) UILabel *EnglishHospitalLabel;
@property (nonatomic,strong) UILabel *tagLabel1;
@property (nonatomic,strong) UILabel *tagLabel2;
@property (nonatomic,strong) UIButton *onLineConsultButton;

@end

@implementation SSDocDetailTopView


- (instancetype)init{
    if (self = [super init]) {
        
    self.bgImageView = [[UIImageView alloc]init];
    [self addSubview:self.bgImageView];
   self.bgImageView.userInteractionEnabled = YES;
    self.arrowBtn = [UIButton addBtnImage:index_backImageName WithTarget:self action:@selector(btnclick)];
    [self.bgImageView addSubview:self.arrowBtn];

    self.arrowBtn.imageEdgeInsets =UIEdgeInsetsMake(15, 10, 15, 10);
    
    self.arrowBtn.sd_layout.widthIs(self.arrowBtn.imageView.image.size.width+20).heightIs(self.arrowBtn.imageView.image.size.height+30).topSpaceToView(self.bgImageView,px(20)).leftSpaceToView(self.bgImageView,0);

    self.hospitalLabel = [UILabel addLabelWithText:@"" AndFont:Font13 AndAlpha:1.0 AndColor:TITLE_COLOR];
    [self addSubview:self.hospitalLabel];
    
    self.EnglishHospitalLabel = [UILabel addLabelWithText:@"" AndFont: Font9 AndAlpha:1.0 AndColor:TITLE_COLOR];
    [self addSubview:self.EnglishHospitalLabel];
    
    self.tagLabel1 = [UILabel labelWithText:@"" Font:Font13 Color:cHBColor Alignment:NSTextAlignmentCenter];
    self.tagLabel1.backgroundColor = c255255255;
    self.tagLabel1.layer.borderColor = cHBColor.CGColor;
    self.tagLabel1.layer.borderWidth = px(2);
    [self addSubview:self.tagLabel1];
    
    self.tagLabel2 = [UILabel labelWithText:@"" Font:Font13 Color:cHBColor Alignment:NSTextAlignmentCenter];
    self.tagLabel2.backgroundColor = c255255255;
    self.tagLabel2.layer.borderColor = cHBColor.CGColor;
    self.tagLabel2.layer.borderWidth = px(2);
    [self addSubview:self.tagLabel2];
    
    self.onLineConsultButton = [UIButton  addBtnWithTitle:@"在线问诊" WithBGImg:nil WithFont:Font13 WithTitleColor:c255255255 Target:self Action:@selector(oneLineAction)];
    self.onLineConsultButton.backgroundColor = cHBColor;
    self.onLineConsultButton.layer.cornerRadius =3;
    self.onLineConsultButton.clipsToBounds = YES;
    [self addSubview: self.onLineConsultButton];
   
    self.onLineConsultButton.sd_layout.widthIs(px(148)).topSpaceToView(self.bgImageView,px(40)).rightSpaceToView(self,px(30)).heightIs(px(48));

    }
    return self;
}



-(void)oneLineAction
{
    if (self.telBlock) {
        
        self.telBlock();
    }
}

-(void)setHospital:(Hospital *)hospital
{
    _hospital = hospital;
    
    
    [self.bgImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",ImageBaseURL,hospital.img]]placeholderImage:[UIImage imageNamed:@""]];
    
    self.bgImageView.frame = CGRectMake(0, 0, self.bgImageView.image.size.width, self.bgImageView.image.size.height);
    
    self.hospitalLabel.text = hospital.name;
    
    self.hospitalLabel.frame = CGRectMake(px(10), CGRectGetMaxY( self.bgImageView.frame)+px(10), [NSString backSizeWithText:self.hospitalLabel.text andFont:font(Font13)].width, Font13);
    
    self.EnglishHospitalLabel.text = hospital.subTitle;
    self.EnglishHospitalLabel.frame = CGRectMake(0, CGRectGetMaxY( self.hospitalLabel.frame)+px(10), kScreenWidth-px(10), Font9);
    
  
    self.tagLabel1.text = hospital.title;
    self.tagLabel1.frame = CGRectMake(px(10), CGRectGetMaxY(self.EnglishHospitalLabel.frame)+px(10), px(122), Font15);
    
    if (hospital.insurance.length) {
        
        self.tagLabel2.text = hospital.insurance;
        self.tagLabel2.sd_layout.widthIs([NSString backSizeWithText:self.tagLabel2.text andFont:font(Font13)].width+px(10)).heightIs(Font15).topSpaceToView( self.EnglishHospitalLabel,px(10)).leftSpaceToView(self.tagLabel1,px(10));
    }
    
    CGFloat superMsgViewH = 0;
    superMsgViewH = CGRectGetMaxY( self.tagLabel1.frame)+px(20);
    CGRect bounds = self.bounds;
    bounds.size.height = superMsgViewH;
    self.bounds=bounds;
    
}

-(void)btnclick
{
    if (self.backBlock) {
        
        self.backBlock();
        
    }
}

@end
