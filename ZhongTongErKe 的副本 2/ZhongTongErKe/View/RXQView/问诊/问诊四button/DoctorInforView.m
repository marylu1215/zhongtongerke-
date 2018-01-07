//
//  DoctorInforView.m
//  ZhongTongErKe
//
//  Created by khj on 2017/7/31.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "DoctorInforView.h"

@interface DoctorInforView ()

@property (nonatomic,strong) UIImageView *headImageview;
@property (nonatomic,strong) UILabel *headLabel;
@property (nonatomic,strong) UILabel *describeLabel;
@property (nonatomic,strong) UILabel *hospitalLel;
@property (nonatomic,strong) UILabel *detailLabel;
@property (nonatomic,strong) UILabel *tagLabel1;
@property (nonatomic,strong) UILabel *tagLabel2;
@property (nonatomic,strong) UILabel *tagLabel3;

@end
@implementation DoctorInforView

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
    self.headImageview = [[UIImageView alloc]init];
    self.headImageview.layer.cornerRadius = px(120)/2;
    self.headImageview.clipsToBounds = YES;
    [self addSubview:self.headImageview];
    
    self.headLabel = [UILabel addLabelWithText:@"" AndFont:Font15 AndAlpha:1.0 AndColor:TITLE_COLOR];
    [self addSubview: self.headLabel];
    
    self.describeLabel = [UILabel addLabelWithText:@"" AndFont:Font13 AndAlpha:1.0 AndColor:TITLE_COLOR];
    [self addSubview: self.describeLabel];
    
    self.hospitalLel = [UILabel addLabelWithText:@"" AndFont:Font13 AndAlpha:1.0 AndColor:TITLE_COLOR];
    [self addSubview:self.hospitalLel];
    
    self.detailLabel = [UILabel addLabelWithText:@"" AndFont:Font13 AndAlpha:1.0 AndColor:TITLE_COLOR];
    self.detailLabel.numberOfLines =0;
    [self addSubview:self.detailLabel];
    [self addSubview:self.detailLabel];
    
    self.tagLabel1 = [UILabel labelWithText:@"" Font:Font13 Color:cHBColor Alignment:NSTextAlignmentCenter];
    self.tagLabel1.backgroundColor = [UIColor whiteColor];
      [self addSubview:self.tagLabel1];
    
    self.tagLabel2 = [UILabel labelWithText:@"" Font:Font13 Color:cHBColor Alignment:NSTextAlignmentCenter];
    self.tagLabel2.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.tagLabel2];

    self.tagLabel3 = [UILabel labelWithText:@"" Font:Font13 Color:cHBColor Alignment:NSTextAlignmentCenter];
    self.tagLabel3.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.tagLabel3];
    

}

-(void)configueFrame
{
    
    self.headImageview.sd_layout.topSpaceToView(self,px(42)).widthIs(px(120)).heightIs(px(120)).leftSpaceToView(self,px(14));
    
}


-(void)setDoctor:(Doctor *)doctor
{
   
    [self.headImageview sd_setImageWithURL:[NSURL URLWithString: [doctor.head containsString:@"http"]?doctor.head:[NSString stringWithFormat:@"%@%@",ImageBaseURL,doctor.head]] placeholderImage:[UIImage imageNamed:@"1"]];

    self.headLabel.text = doctor.name;
    self.headLabel.sd_layout.leftSpaceToView(self.headImageview,px(10)).rightSpaceToView(self,0).topSpaceToView(self,px(44)).heightIs(Font15);
    
    self.describeLabel.text = [NSString stringWithFormat:@"%@ %@",doctor.department,doctor.title];
    self.describeLabel.sd_layout.leftSpaceToView(self.headImageview,px(10)).rightSpaceToView(self,0).topSpaceToView(self.headLabel,px(14)).heightIs(Font13);

    self.hospitalLel.text = doctor.ssyy;
    self.hospitalLel.sd_layout.leftSpaceToView(self.headImageview,px(10)).rightSpaceToView(self,0).topSpaceToView(self.describeLabel,px(14)).heightIs(Font13);
    
    self.detailLabel.text = [NSString stringWithFormat:@"擅长:%@",doctor.specialty];
    NSDictionary *descDic = @{NSFontAttributeName:font(Font13 )};
    CGRect descFrame =  [ self.detailLabel.text textRectWithSize:CGSizeMake(kScreenWidth-px(172), MAXFLOAT) attributes:descDic];
    descFrame.origin.x = px(142);
    descFrame.origin.y = px(158);
    self.detailLabel.frame = descFrame;
    
    self.tagLabel1.text = [NSString stringWithFormat:@"%@经验",doctor.experience] ;
    self.tagLabel1.sd_layout.widthIs([NSString backSizeWithText: self.tagLabel1.text andFont:font(Font13)].width+10).heightIs(px(30)).leftSpaceToView(self.headImageview,px(10)).topSpaceToView( self.detailLabel,px(14));
    
    self.tagLabel2.text = @"三甲医院";
    self.tagLabel2.sd_layout.widthIs([NSString backSizeWithText: self.tagLabel2.text andFont:font(Font13)].width+10).heightIs(px(30)).leftSpaceToView( self.tagLabel1,px(10)).centerYEqualToView(self.tagLabel1);
    
    self.tagLabel3.text = @"回复及时";
   self.tagLabel3.sd_layout.widthIs([NSString backSizeWithText: self.tagLabel3.text andFont:font(Font13)].width+10).heightIs(px(30)).leftSpaceToView(self.tagLabel2,px(10)).centerYEqualToView(self.tagLabel1);
    
    
    CGFloat superMsgViewH = 0;
    superMsgViewH = CGRectGetMaxY(self.detailLabel.frame)+px(76);
    CGRect bounds = self.bounds;
    bounds.size.height = superMsgViewH;
    self.bounds=bounds;


}
@end
