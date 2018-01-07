//
//  totalLabel.m
//  ZhongTongErKe
//
//  Created by 研发部 on 2017/9/14.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "totalLabel.h"

@implementation totalLabel
+ (UILabel*)createLableFrame:(CGRect)frame  backgroundColor:(UIColor *)color  text:(NSString *)str  textColor:(UIColor *)textColor font:(UIFont *)font  numberOfLines:(int)numberOfLines   adjustsFontSizeToFitWidth:(BOOL)adjustsFontSizeToFitWidth{
    //UILabel *label = [[UILabel alloc]init];
    UILabel *label = [[UILabel alloc]initWithFrame:frame];
    label.text = str;
    label.textColor = TITLE_COLOR;
    label.font = font;
    label.numberOfLines = numberOfLines;
    label.adjustsFontSizeToFitWidth = YES;
    
    return label;
}
@end
