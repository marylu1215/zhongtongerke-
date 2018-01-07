//
//  PersonInfoView.m
//  ZhongTongErKe
//
//  Created by khj on 2017/6/22.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "PersonInfoView.h"
#import "PiechartView.h"
@interface PersonInfoView ()

@property (nonatomic,strong) UILabel *nameLabel;
@property (nonatomic,strong) UILabel *detailLabel;
@property (nonatomic,strong) UILabel *percentLabel;
@property (strong,nonatomic) PiechartView *chartOne;


@end
@implementation PersonInfoView

-(id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = c255255255;
        self.layer.cornerRadius = px(250)/2;
        self.clipsToBounds = YES;
        
    _chartOne = [[PiechartView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height) withStrokeWidth:6 andColor:cHBColor andPercent:0.8 andAnimation:YES];
    [self addSubview:_chartOne];
        
    
    self.nameLabel = [UILabel addLabelWithText:@""AndFont:Font13 AndAlpha:1.0 AndColor:cHBColor];
    [self addSubview: self.nameLabel];
  
    
    self.detailLabel = [UILabel addLabelWithText:@"" AndFont:Font13 AndAlpha:1.0 AndColor:TITLE_COLOR];
    [self addSubview: self.detailLabel];
    

    self.percentLabel = [UILabel addLabelWithText:[NSString stringWithFormat:@"资料完整度 %.lf %%",0.8*100] AndFont:Font13 AndAlpha:1.0 AndColor:REMARK_COLOR];
    [self addSubview:self.percentLabel];
  
    }
    return self;
}

-(void)setUser:(User *)user
{
   
    self.nameLabel.text = user.username.length?user.username:user.mobile;
    self.nameLabel.sd_layout.widthIs([NSString backSizeWithText: self.nameLabel.text andFont:font(Font13)].width).heightIs(Font13).centerXEqualToView(self).topSpaceToView(self,px(70));
    
    self.detailLabel.text =  [NSString stringWithFormat:@"%@,%@",user.sex.integerValue?@"男":@"女",  [NSString stringWithFormat:@"%@岁",[NSString dateToOld:user.birthday]]];
    
    self.detailLabel.sd_layout.widthIs([NSString backSizeWithText:self.detailLabel.text andFont:font(Font13)].width).heightIs(Font13).topSpaceToView(self.nameLabel,px(14)).centerXEqualToView(self);
    
    
    self.percentLabel.sd_layout.widthIs([NSString backSizeWithText: self.percentLabel.text andFont:font(Font13)].width).heightIs(Font13).topSpaceToView(self.detailLabel,px(14)).centerXEqualToView(self);
}



@end
