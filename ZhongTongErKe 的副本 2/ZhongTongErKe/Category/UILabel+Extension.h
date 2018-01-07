//
//  UILabel+Extension.h
//  Shopping
//
//  Created by beijingduanluo on 15/8/14.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Extension)

+(UILabel *)addLabelWithText:(NSString *)text AndFont:(CGFloat)font AndAlpha:(CGFloat)alpha AndColor:(UIColor *)color;
+(UILabel *)labelWithText:(NSString *)text Font:(CGFloat)font Color:(UIColor *)color Alignment:(NSTextAlignment)alignment;
+(UILabel *)labelWithFrame:(CGRect)frame Text:(NSString *)text Font:(CGFloat)font Color:(UIColor *)color Alignment:(NSTextAlignment)alignment;

+(UILabel *)labelWithFrame:(CGRect)frame text:(NSString *)text font:(UIFont *)font color:(UIColor *)color alignment:(NSTextAlignment)alignment;

+(UILabel *)creatLabelWithText:(NSString *)text AndFont:(UIFont *)font AndAlpha:(CGFloat)alpha AndColor:(UIColor *)color alignment:(NSTextAlignment)alignment;

@end
