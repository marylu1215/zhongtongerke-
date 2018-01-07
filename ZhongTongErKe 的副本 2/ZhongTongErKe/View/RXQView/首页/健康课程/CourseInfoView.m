//
//  CourseInfoView.m
//  ZhongTongErKe
//
//  Created by khj on 2017/6/18.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "CourseInfoView.h"

@implementation CourseInfoView

-(id)initWithFrame:(CGRect)frame LeftInfo:(NSString *)leftInfo RightInfo:(NSString *)rightInfo
{
    if (self = [super initWithFrame:frame]) {
        
        
      
        
        UILabel *leftLabel = [UILabel addLabelWithText:[NSString stringWithFormat:@"%@:",leftInfo] AndFont:12 AndAlpha:1.0 AndColor:[UIColor colorWithHexString:@"333333"]];
        [self addSubview:leftLabel];
        
        leftLabel.frame =CGRectMake(px(36), 0, [NSString backSizeWithText:leftLabel.text andFont:font(12)].width, Font13);
        
        UIImageView *circleImageView = [[UIImageView alloc]init];
        circleImageView.backgroundColor = cHBColor;
        circleImageView.layer.cornerRadius = px(10)/2;
        circleImageView.clipsToBounds =YES;
        [self addSubview:circleImageView];
        circleImageView.sd_layout.widthIs(px(10)).heightIs(px(10)).rightSpaceToView( leftLabel,px(10)).centerYEqualToView(leftLabel);
        
        
        UILabel *rightLabel = [UILabel addLabelWithText:rightInfo AndFont:Font13 AndAlpha:1.0 AndColor:[UIColor colorWithHexString:@"333333"]];
        rightLabel.numberOfLines =0;
        [self addSubview:rightLabel];
        
        NSDictionary *descDic = @{NSFontAttributeName:font(Font13)};
        CGRect descFrame =  [rightLabel.text textRectWithSize:CGSizeMake(kScreenWidth - px(204), MAXFLOAT) attributes:descDic];
     
        rightLabel.sd_layout.leftSpaceToView(leftLabel,px(10)).rightSpaceToView(self,px(50)).heightIs(descFrame.size.height).topSpaceToView(self,0);
        
    }
    return self;
}

@end
