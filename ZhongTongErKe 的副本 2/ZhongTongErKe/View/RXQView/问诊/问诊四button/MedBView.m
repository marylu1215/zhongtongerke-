//
//  MedBView.m
//  ZhongTongErKe
//
//  Created by khj on 2017/7/31.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "MedBView.h"

@interface MedBView ()

@property (nonatomic,strong) UILabel *medicalEduLabel;
@property (nonatomic,strong)  UIImageView  *line1;
@property (nonatomic,strong) UILabel *collegeLabel;
@end
@implementation MedBView

-(id)initWithTitle:(NSString *)title
{
    if (self = [super init]) {
        
        [self configueUIWithTitle:title];
        [self configueFrame];
        
    }
    return self;
}

-(void)configueUIWithTitle:(NSString *)title
{
    self.medicalEduLabel = [UILabel addLabelWithText:title AndFont:Font15 AndAlpha:1.0 AndColor:c255255255];
    [self addSubview:self.medicalEduLabel];
    
    self.line1 = [UIImageView createImageViewWithImageName:nil color:c255255255];
    [self addSubview:self.line1];
    
    self.collegeLabel = [UILabel addLabelWithText:@"" AndFont:Font15 AndAlpha:1.0 AndColor:TITLE_COLOR];
    self.collegeLabel.numberOfLines = 0;
    [self addSubview:self.collegeLabel];
}

-(void)configueFrame
{
    self.medicalEduLabel.sd_layout.leftSpaceToView(self,px(14)).heightIs(Font15).rightSpaceToView(self,0).topSpaceToView(self,0);
    self.line1.sd_layout.widthIs(kScreenWidth).heightIs(px(4)).topSpaceToView(self.medicalEduLabel,px(12));
    
    
}
-(void)setDoctorInfo:(NSString *)doctorInfo
{
    
    self.collegeLabel.text = doctorInfo;
    NSDictionary *descDic = @{NSFontAttributeName:font(Font13 )};
    CGRect descFrame =  [ self.collegeLabel.text textRectWithSize:CGSizeMake(kScreenWidth-px(44), MAXFLOAT) attributes:descDic];
    descFrame.origin.x = px(14);
    descFrame.origin.y = px(56);
    self.collegeLabel.frame = descFrame;
    
    CGFloat superMsgViewH = 0;
    superMsgViewH = CGRectGetMaxY(self.collegeLabel.frame);
    CGRect bounds = self.bounds;
    bounds.size.height = superMsgViewH;
    self.bounds=bounds;

}
@end
