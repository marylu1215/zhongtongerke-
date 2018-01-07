//
//  HosGuiView.m
//  ZhongTongErKe
//
//  Created by khj on 2017/6/1.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "HosGuiView.h"

@interface HosGuiView ()

@property (nonatomic ,strong) UIImageView *dImageView;
@property (nonatomic ,strong) UILabel *dNameLabel;
@property (nonatomic ,strong) UILabel *adminLabel;
@property (nonatomic ,strong) UILabel *reLabel;
@property (nonatomic ,strong) UILabel *priceLabel;
@property (nonatomic ,strong) UILabel *desLabel;
@property (nonatomic ,strong) UIImageView *lineImageView;
@property (nonatomic ,strong) UILabel *totalPriceLabel;
@end
@implementation HosGuiView

-(id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = c255255255;
        
        [self prepareUI];
        [self configueFrame];
    }
    return self;
}
-(void)prepareUI
{
    self.dImageView = [[UIImageView alloc]init];
    self.dImageView.layer.cornerRadius = px(80)/2.0;
    self.dImageView.clipsToBounds = YES;
    self.dImageView.layer.borderWidth =px(2);
    self.dImageView.layer.borderColor = cHBColor.CGColor;
    [self addSubview:self.dImageView];
    
    self.dNameLabel = [UILabel addLabelWithText:@"" AndFont:15 AndAlpha:1.0 AndColor:TITLE_COLOR];
    [self addSubview: self.dNameLabel];
    
    self.adminLabel = [UILabel addLabelWithText:@"" AndFont:12 AndAlpha:1.0 AndColor:cGrayWord];
    [self addSubview:self.adminLabel];
    
    self.reLabel = [UILabel addLabelWithText:@"最低购买1天" AndFont:12 AndAlpha:1.0 AndColor:cGrayWord];
    [self addSubview: self.reLabel];
    
    self.priceLabel = [UILabel addLabelWithText:@"" AndFont:12 AndAlpha:1.0 AndColor:S_COLOR];
    [self addSubview:self.priceLabel];
    
    self.desLabel =[UILabel addLabelWithText:@"个人信息帮助医生全面了解疾病需要，将会严格保密仅仅医患双方可以看到信息内容" AndFont:12 AndAlpha:1.0 AndColor:cGrayWord];
    self.desLabel.numberOfLines = 0;
    [self addSubview: self.desLabel];
    
    //数量
    numberChooseBtnView *numberChoose = [numberChooseBtnView numberChooseBtnViewWith:1];
    _numberChoose = numberChoose;
    [self addSubview:numberChoose];
    [numberChoose.leftBtn addTarget:self action:@selector(numberMimus:) forControlEvents:(UIControlEventTouchUpInside)];
    [numberChoose.rightBtn addTarget:self action:@selector(numberPlus:) forControlEvents:(UIControlEventTouchUpInside)];

    self.totalPriceLabel = [UILabel addLabelWithText:@"购买天数" AndFont:Font13 AndAlpha:1.0 AndColor:TITLE_COLOR];
    [self addSubview:self.totalPriceLabel];
    
    self.lineImageView = [UIImageView createImageViewWithImageName:nil color:sepBgColor];
    [self addSubview: self.lineImageView];
    
    
}
-(void)configueFrame
{
    self.dImageView.sd_layout.widthIs(px(80)).heightIs(px(80)).leftSpaceToView(self,px(20)).topSpaceToView(self,px(20));
     self.lineImageView.sd_layout.widthIs(kScreenWidth).heightIs(px(2)).topSpaceToView(self.dImageView,px(20));
    
     _numberChoose.sd_layout.rightSpaceToView(self,px(30)).topSpaceToView(self,px(60)).widthIs(px(196)).heightIs(px(60));
    
    self.totalPriceLabel.sd_layout.rightSpaceToView( _numberChoose,0).centerYEqualToView( _numberChoose).widthIs([NSString backSizeWithText: self.totalPriceLabel.text andFont:font(Font13)].width).heightIs(Font13);
    
    
    NSDictionary *descDic = @{NSFontAttributeName:font(12)};
    CGRect descFrame =  [self.desLabel.text textRectWithSize:CGSizeMake(kScreenWidth - px(60), MAXFLOAT) attributes:descDic];
    self.desLabel.sd_layout.leftSpaceToView(self,px(20)).rightSpaceToView(self,px(20)).topSpaceToView(self,px(146)).heightIs(descFrame.size.height);
}

-(void)setDoctor:(Doctor *)doctor
{
  
    _doctor = doctor;
    
    [self.dImageView sd_setImageWithURL:[NSURL URLWithString:[doctor.head containsString:@"http"]?doctor.head:[NSString stringWithFormat:@"%@%@",ImageBaseURL,doctor.head]] placeholderImage:[UIImage imageNamed:@"1"]];
    
    self.priceLabel.text = [NSString stringWithFormat:@"%@/天", doctor.service.guidance[0]];
    self.priceLabel.sd_layout.widthIs([NSString backSizeWithText: self.priceLabel.text andFont:font(12)].width).heightIs(12).rightSpaceToView(self,px(30)).topSpaceToView(self,px(30));
    
    self.dNameLabel.text = doctor.name;
    self.dNameLabel.sd_layout.widthIs([NSString backSizeWithText: self.dNameLabel.text andFont:font(15)].width).heightIs(15).leftSpaceToView( self.dImageView,px(30)).centerYEqualToView(self.priceLabel);
    
    self.adminLabel.text = doctor.department;
    self.adminLabel.sd_layout.widthIs([NSString backSizeWithText: self.adminLabel.text andFont:font(12)].width).heightIs(12).leftSpaceToView( self.dNameLabel,px(10)).centerYEqualToView(self.priceLabel);
 
    self.reLabel.sd_layout.widthIs([NSString backSizeWithText: self.reLabel.text andFont:font(12)].width).heightIs(12).leftSpaceToView( self.dImageView,px(30)).topSpaceToView(self.dNameLabel,px(10));
}

-(void)numberMimus:(UIButton *)btn{
    numberChooseBtnView *numberChoose = (numberChooseBtnView *)btn.superview;
    [numberChoose leftBtnClick];
}
-(void)numberPlus:(UIButton *)btn{
    numberChooseBtnView *numberChoose = (numberChooseBtnView *)btn.superview;
    [numberChoose rightBtnClick];
    
    
}


@end
