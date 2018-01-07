//
//  UIButton+Extension.m
//  Shopping
//
//  Created by beijingduanluo on 15/8/14.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "UIButton+Extension.h"

@implementation UIButton (Extension)
+ (UIButton *)addBtnImage:(NSString *)imgName WithTarget:(id)target action:(SEL)action
{
    UIButton *btn =[UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:imgName] forState:UIControlStateNormal];
    
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];

    return btn;
}

+ (UIButton *)addStatusImage:(UIImage *)statusImg WithTarget:(id)target action:(SEL)action
{
    UIButton *btn =[UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:statusImg forState:UIControlStateNormal];
    
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return btn;
}


+(UIButton *)addBtnImage:(NSString *)img  WithTitle:(NSString *)title AndTitleColor:(UIColor *)color AndTitleFont:(CGFloat)font AndImgInsets:(UIEdgeInsets)edgeInset AndTitleEdgeInsets:(UIEdgeInsets)titleInsets AndTarget:(id)traget AndAction:(SEL)selector
{
    UIButton *btn =[UIButton buttonWithType:UIButtonTypeCustom];
 
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:color forState:UIControlStateNormal];
    [btn setTitleEdgeInsets:titleInsets];
    [btn setImageEdgeInsets:edgeInset];
    btn.titleLabel.font =[UIFont systemFontOfSize:font];
    UIImage *image = [[UIImage imageNamed:img] imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
    [btn setImage:image forState:UIControlStateNormal];
    [btn addTarget:traget action:selector forControlEvents:UIControlEventTouchUpInside];
    return btn;
}
+(UIButton *)addBtnImage:(NSString *)img  WithTitle:(NSString *)title AndTitleColor:(UIColor *)color AndTitleFont:(CGFloat)font AndTarget:(id)traget AndAction:(SEL)selector
{
    UIButton *btn =[UIButton buttonWithType:UIButtonTypeCustom];
    
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:color forState:UIControlStateNormal];
   
    btn.titleLabel.font =[UIFont systemFontOfSize:font];
    [btn setImage:[UIImage imageNamed:img] forState:UIControlStateNormal];
    [btn addTarget:traget action:selector forControlEvents:UIControlEventTouchUpInside];
    return btn;
}


+(UIButton *)addBtnWithTitle:(NSString *)title WithBGImg:(NSString *)backImg WithFont:(CGFloat)font WithTitleColor:(UIColor *)color Target:(id)traget Action:(SEL)action
{
    UIButton *btn =[UIButton buttonWithType:UIButtonTypeCustom];

    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:color forState:UIControlStateNormal];
    btn.titleLabel.font =[UIFont systemFontOfSize:font];
    [btn setBackgroundImage:[UIImage imageNamed:backImg] forState:UIControlStateNormal];
    [btn addTarget:traget action:action forControlEvents:UIControlEventTouchUpInside];
    return btn;
}
+(UIButton *)addCornerBtnWithTitle:(NSString *)title WithBGImg:(NSString *)backImg WithFont:(CGFloat)font WithTitleColor:(UIColor *)color Target:(id)traget Action:(SEL)action
{
    UIButton *btn =[UIButton buttonWithType:UIButtonTypeCustom];
    
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:color forState:UIControlStateNormal];
    btn.titleLabel.font =[UIFont systemFontOfSize:font];
    [btn setBackgroundImage:[UIImage imageNamed:backImg] forState:UIControlStateNormal];
    [btn addTarget:traget action:action forControlEvents:UIControlEventTouchUpInside];
    
    btn.layer.cornerRadius = 5;
   btn.layer.masksToBounds = YES;  
    
    return btn;
}

+(UIButton *)creatLeftBtnWithImageName:(NSString *)imageName Target:(id)traget Action:(SEL)action
{
    UIImage *leftimage = [UIImage imageNamed:imageName];
    leftimage = [leftimage imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
    
    UIButton *leftBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, leftimage.size.width+5, leftimage.size.height)];
    
    
    [leftBtn setImage:leftimage forState:(UIControlStateNormal)];
    [leftBtn addTarget:traget action:action forControlEvents:(UIControlEventTouchUpInside)];
    return leftBtn;
    
}

+(UIButton *)addBgBtnWithBGClor:(UIColor  *)color  Target:(id)traget Action:(SEL)action
{
    UIButton *bgBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
   
    bgBtn.backgroundColor =color;
    
    [bgBtn  addTarget:traget action:action forControlEvents:UIControlEventTouchUpInside];

    return bgBtn;

}


+ (UIButton *)addArrowBtnWithImageName:(NSString *)imageName
{
    UIButton *arrowBtn = [UIButton new];
    [arrowBtn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    arrowBtn.imageView.contentMode = UIViewContentModeCenter;
    arrowBtn.imageView.clipsToBounds = NO;
    arrowBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;

    arrowBtn.userInteractionEnabled = NO;
    
    return arrowBtn;

}

- (void)setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state {
    [self setBackgroundImage:[UIButton imageWithColor:backgroundColor] forState:state];
}

+ (UIImage *)imageWithColor:(UIColor *)color {
    
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
   
    CGContextFillRect(context, rect);

    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
}

+(UIButton *)addLeftImage:(NSString *)img  WithTitle:(NSString *)title AndTitleColor:(UIColor *)color AndTitleFont:(CGFloat)font
{
    UIButton *btn =[UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:color forState:UIControlStateNormal];
    btn.titleLabel.font =[UIFont systemFontOfSize:font];
    [btn setImage:[UIImage imageNamed:img] forState:UIControlStateNormal];
    return btn;
}

@end
