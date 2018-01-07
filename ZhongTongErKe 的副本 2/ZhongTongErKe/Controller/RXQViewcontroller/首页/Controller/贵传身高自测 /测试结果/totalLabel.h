//
//  totalLabel.h
//  ZhongTongErKe
//
//  Created by 研发部 on 2017/9/14.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface totalLabel : UILabel
+ (UILabel*)createLableFrame:(CGRect)frame  backgroundColor:(UIColor *)color  text:(NSString *)str  textColor:(UIColor *)textColor font:(UIFont *)font  numberOfLines:(int)numberOfLines   adjustsFontSizeToFitWidth:(BOOL)adjustsFontSizeToFitWidth;
@end
