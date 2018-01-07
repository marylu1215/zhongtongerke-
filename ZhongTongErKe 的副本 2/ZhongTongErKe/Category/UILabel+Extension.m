//
//  UILabel+Extension.m
//  Shopping
//
//  Created by beijingduanluo on 15/8/14.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "UILabel+Extension.h"

@implementation UILabel (Extension)

+(UILabel *)addLabelWithText:(NSString *)text AndFont:(CGFloat)font AndAlpha:(CGFloat)alpha AndColor:(UIColor *)color
{
    UILabel *label =[[UILabel alloc]init];
    label.text = text;
    label.alpha = alpha;
    label.font =[UIFont systemFontOfSize:font];
    label.textColor = color;
    label.textAlignment =NSTextAlignmentLeft;
    //label.textAlignment =NSTextAlignmentCenter;
    return label;
}
+(UILabel *)labelWithText:(NSString *)text Font:(CGFloat)font Color:(UIColor *)color Alignment:(NSTextAlignment)alignment{
    UILabel *label =[[UILabel alloc]init];
    label.text = text;
    label.font =[UIFont systemFontOfSize:font];
    label.textColor = color;
    label.textAlignment = alignment;
    return label;
}
+(UILabel *)labelWithFrame:(CGRect)frame Text:(NSString *)text Font:(CGFloat)font Color:(UIColor *)color Alignment:(NSTextAlignment)alignment{
    UILabel *label =[[UILabel alloc]initWithFrame:frame];
    label.text = text;
    label.font =[UIFont systemFontOfSize:font];
    label.textColor = color;
    label.textAlignment = alignment;
    return label;
}

+(UILabel *)labelWithFrame:(CGRect)frame text:(NSString *)text font:(UIFont *)font color:(UIColor *)color alignment:(NSTextAlignment)alignment
{
    UILabel *label =[[UILabel alloc]initWithFrame:frame];
    label.text = text;
    label.font = font;
    label.textColor = color;
    label.textAlignment = alignment;
    return label;
}

+(UILabel *)creatLabelWithText:(NSString *)text AndFont:(UIFont *)font AndAlpha:(CGFloat)alpha AndColor:(UIColor *)color alignment:(NSTextAlignment)alignment
{
    UILabel *label =[[UILabel alloc]init];
    label.text = text;
    label.font =font;
    label.textColor = color;
    label.textAlignment = alignment;
    return label;
}
@end
