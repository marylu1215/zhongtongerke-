//
//  DoctorInfoView.m
//  ZhongTongErKe
//
//  Created by khj on 2017/6/16.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "DoctorInfoView.h"

@interface DoctorInfoView ()

@property (nonatomic ,strong) UIImageView *headImageView;
@property (nonatomic ,strong) UILabel *docNameLabel;
@property (nonatomic ,strong) UILabel *adLabel;
@property (nonatomic ,strong) UILabel *levelLabel;
@property (nonatomic ,strong) UILabel *skillLabel;




@end
@implementation DoctorInfoView

-(id)init
{
    if (self = [super init]) {
        
        [self configueUI];
        [self configueFrame];
        
       
 
    }
    return self;
}

-(void)configueUI
{
    self.backgroundColor = c255255255;
    self.headImageView = [[UIImageView alloc]init];
    self.headImageView.layer.cornerRadius = px(100)/2.0;
    self.headImageView.clipsToBounds = YES;
    self.headImageView.layer.borderColor = cHBColor.CGColor;
    self.headImageView.layer.borderWidth =px(2);
    [self addSubview:self.headImageView];
   
   self.docNameLabel =[UILabel addLabelWithText:@"" AndFont:Font15 AndAlpha:1.0 AndColor:TITLE_COLOR];
    [self addSubview: self.docNameLabel];
   
   self.adLabel = [UILabel addLabelWithText:@"" AndFont:Font13 AndAlpha:1.0 AndColor:REMARK_COLOR];
    [self addSubview:self.adLabel];
    
    self.levelLabel = [UILabel addLabelWithText:@"" AndFont:Font13 AndAlpha:1.0 AndColor:REMARK_COLOR];
    [self addSubview:self.levelLabel];
    

    self.skillLabel = [UILabel addLabelWithText:@"" AndFont:Font13 AndAlpha:1.0 AndColor:REMARK_COLOR];
    self.skillLabel.numberOfLines = 0;
    [self addSubview:self.skillLabel];
    

}

-(void)configueFrame
{

    self.headImageView.sd_layout.widthIs(px(100)).heightIs(px(100)).leftSpaceToView(self,px(30)).topSpaceToView(self,px(20));
}

-(void)setMyServices:(MyServices *)myServices
{
    
    [self.headImageView sd_setImageWithURL:[NSURL URLWithString:[myServices.doctor_head containsString:@"http"]?myServices.doctor_head:[NSString stringWithFormat:@"%@%@",ImageBaseURL,myServices.doctor_head]] placeholderImage:[UIImage imageNamed:@"1"]];
    
    
    self.docNameLabel.text = myServices.doctor_name;
    self.docNameLabel.sd_layout.leftSpaceToView(self.headImageView,px(10)).heightIs(Font15).widthIs([NSString backSizeWithText:self.docNameLabel.text andFont:font(Font15)].width).topSpaceToView(self,px(28));
    
    self.adLabel.text = myServices.ssyy;
    self.adLabel.sd_layout.leftSpaceToView(self.docNameLabel,px(10)).centerYEqualToView(self.docNameLabel).widthIs([NSString backSizeWithText:self.adLabel.text andFont:font(Font15)].width).heightIs(Font15);
    
    self.levelLabel.text = myServices.department;
    self.levelLabel.sd_layout.leftSpaceToView(self.adLabel,px(10)).centerYEqualToView(self.adLabel).widthIs([NSString backSizeWithText:self.levelLabel.text andFont:font(Font15)].width).heightIs(Font15);
   
    
    self.skillLabel.text = [NSString stringWithFormat:@"购买的服务:%@",myServices.service];
    NSDictionary *descDic = @{NSFontAttributeName:font(Font13 )};
    CGRect descFrame =  [self.skillLabel.text textRectWithSize:CGSizeMake(kScreenWidth-px(164), MAXFLOAT) attributes:descDic];
    descFrame.origin.x = px(144);
    descFrame.origin.y = px(64);
    self.skillLabel.frame = descFrame;
    
    CGFloat superMsgViewH = 0;
    superMsgViewH = CGRectGetMaxY(CGRectGetMaxY(self.headImageView.frame)>CGRectGetMaxY(self.skillLabel.frame)?self.headImageView.frame:self.skillLabel.frame)+px(40);
    CGRect bounds = self.bounds;
    bounds.size.height = superMsgViewH;
    self.bounds=bounds;
}
@end
