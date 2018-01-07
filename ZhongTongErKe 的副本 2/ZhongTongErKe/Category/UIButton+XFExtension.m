//
//  UIButton+XFExtension.m
//  MagicFinger
//
//  Created by xufeng on 16/5/19.
//  Copyright © 2016年 zeenc. All rights reserved.
//

#import "UIButton+XFExtension.h"

@implementation UIButton (XFExtension)
+(UIButton *)addBtnWithTitle:(NSString *)title WithFont:(CGFloat)font WithTitleColor:(UIColor *)color
{
    UIButton *btn =[UIButton buttonWithType:UIButtonTypeCustom];
    
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:color forState:UIControlStateNormal];
    btn.titleLabel.font =[UIFont systemFontOfSize:font];
    return btn;
}
+(UIButton *)addBtnWithTitle:(NSString *)title WithFont:(CGFloat)font WithTitleNomalColor:(UIColor *)color TitleHighlightedColor:(UIColor *)highlightedColor
{
    UIButton *btn =[UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:title forState:UIControlStateNormal];
    btn.titleLabel.font =[UIFont systemFontOfSize:font];
    [btn setTitleColor:color forState:UIControlStateNormal];
    [btn setTitleColor:highlightedColor forState:UIControlStateHighlighted];
    
    return btn;
}
+(UIButton *)addBtnWithTitle:(NSString *)title WithFont:(CGFloat)font WithTitleColor:(UIColor *)color cornerRadius:(CGFloat)cornerRadius backNormalColor:(UIColor *)normalColor backHighlightedColor:(UIColor *)highlightedColor
{
    UIButton *btn =[UIButton buttonWithType:UIButtonTypeCustom];
    
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:color forState:UIControlStateNormal];
    btn.titleLabel.font =[UIFont systemFontOfSize:font];
    
    btn.layer.cornerRadius = cornerRadius;
    btn.clipsToBounds = YES;
    [btn setBackgroundImage:[UIColor imageWithColor:normalColor] forState:(UIControlStateNormal)];
    [btn setBackgroundImage:[UIColor imageWithColor:highlightedColor] forState:(UIControlStateHighlighted)];
    return btn;
}
+(UIButton *)topImageBtnWithTitle:(NSString *)title ImageName:(NSString *)imageName{
    UIButton *userBtn = [self addBtnWithTitle:title WithFont:px(22) WithTitleColor:cGrayWord cornerRadius:px(6) backNormalColor:c255255255 backHighlightedColor:cMainLine];
    
    [userBtn setImage:[UIImage imageNamed:imageName] forState:(UIControlStateNormal)];
    [userBtn setImageEdgeInsets:UIEdgeInsetsMake(4, 10, 18, 0)];
    
    [userBtn setContentVerticalAlignment:(UIControlContentVerticalAlignmentCenter)];
    userBtn.titleLabel.textAlignment = NSTextAlignmentCenter;//设置title的字体居中
    [userBtn setTitleEdgeInsets:UIEdgeInsetsMake(22, - userBtn.titleLabel.bounds.size.width - 14, 5, 0)];
    
    userBtn.layer.borderWidth = 0.5;
    
    return userBtn;
}
-(void)topImageConfig{
    [self setImageEdgeInsets:UIEdgeInsetsMake(4, 10, 18, 0)];
    
    [self setContentVerticalAlignment:(UIControlContentVerticalAlignmentCenter)];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;//设置title的字体居中
    [self setTitleEdgeInsets:UIEdgeInsetsMake(22, - 14, 5, 0)];
    
    [self setBackgroundImage:[UIColor imageWithColor:c255255255] forState:(UIControlStateNormal)];
    
//    self.layer.borderColor = cGrayBorder.CGColor;
    self.layer.borderWidth = 0.5;
    self.layer.cornerRadius = px(6);
    self.layer.masksToBounds = YES;
}
-(void)imageCenterConfig{
    [self setImageEdgeInsets:UIEdgeInsetsZero];
    
    [self setContentVerticalAlignment:(UIControlContentVerticalAlignmentCenter)];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;//设置title的字体居中
    [self setTitleEdgeInsets:UIEdgeInsetsZero];
    
    [self setBackgroundImage:[UIColor imageWithColor:[UIColor clearColor]] forState:(UIControlStateNormal)];
    
    self.layer.borderColor = [UIColor clearColor].CGColor;
    self.layer.borderWidth = 0.5;
    self.layer.cornerRadius = 0;
    self.layer.masksToBounds = YES;
}
- (void)verticalImageAndTitle:(CGFloat)spacing
{
    self.titleLabel.backgroundColor = [UIColor greenColor];
    CGSize imageSize = self.imageView.frame.size;
    CGSize titleSize = self.titleLabel.frame.size;
    CGSize textSize = [self.titleLabel.text sizeWithFont:self.titleLabel.font];
    CGSize frameSize = CGSizeMake(ceilf(textSize.width), ceilf(textSize.height));
    if (titleSize.width + 0.5 < frameSize.width) {
        titleSize.width = frameSize.width;
    }
    CGFloat totalHeight = (imageSize.height + titleSize.height + spacing);
    self.imageEdgeInsets = UIEdgeInsetsMake(- (totalHeight - imageSize.height), 0.0, 0.0, - titleSize.width);
    self.titleEdgeInsets = UIEdgeInsetsMake(0, - imageSize.width, - (totalHeight - titleSize.height), 0);
    
}

+ (UIButton *)leftWordBtn:(NSString *)title image:(UIImage *)image font:(UIFont *)font spacing:(CGFloat)spacing{
    UIButton *btn = [[UIButton alloc]init];
    [btn setTitle:title forState:(UIControlStateNormal)];
    [btn setImage:image forState:(UIControlStateNormal)];
    
    btn.titleLabel.font = font;
    CGSize size = [title sizeWithFont:font];
    CGFloat titleW = size.width;
    
    btn.titleEdgeInsets = UIEdgeInsetsMake(0, -(image.size.width + spacing * 0.5), 0, image.size.width + spacing * 0.5);
    btn.imageEdgeInsets = UIEdgeInsetsMake(0, titleW + spacing * 0.5, 0, -(titleW + spacing * 0.5));
    return btn;
}

@end
