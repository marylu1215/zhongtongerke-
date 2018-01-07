//
//  fourLabel.m
//  ZhongTongErKe
//
//  Created by 研发部 on 2017/9/13.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "fourLabel.h"
#import <Masonry.h>
@implementation fourLabel
-(id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor redColor];
        
        _labelone = [[UILabel alloc]init];
        _labelone.backgroundColor = [UIColor purpleColor];
        _labelone.font = [UIFont systemFontOfSize:16];
        _labelone.textAlignment = NSTextAlignmentCenter;
        _labelone.text = @"123";
        [self addSubview:_labelone];
        [_labelone mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.top.mas_equalTo(0);
            make.right.mas_equalTo(0);
            make.height.mas_equalTo(16);
        }];
        
        _labeltwo = [[UILabel alloc]init];
        _labeltwo.backgroundColor = [UIColor orangeColor];
        _labeltwo.text = @"明天明天";
        _labeltwo.textAlignment = NSTextAlignmentCenter;
        _labeltwo.font = [UIFont systemFontOfSize:14];
        [self addSubview:_labeltwo];
        [_labeltwo mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_labelone.mas_bottom);
            make.bottom.mas_equalTo(0);
            make.right.mas_equalTo(0);
            make.left.mas_equalTo(0);
        }];
    }
    return self;
}
//+ (UILabel*)createLableFrame:(CGRect)frame  backgroundColor:(UIColor *)color  text:(NSString *)str  textColor:(UIColor *)textcolor font:(UIFont *)font  numberOfLines:(int)numberOfLines adjustsFontSizeToFitWidth:(BOOL)adjustsFontSizeToFitWidth{
//    
//    UILabel*lable = [[UILabel alloc]initWithFrame:frame];
//    lable.backgroundColor = [UIColor redColor];
//    lable.backgroundColor = TITLE_COLOR;
//    lable.text = @"宝贝当前身高";
//    lable.textColor =TITLE_COLOR;
//    lable.font = [UIFont systemFontOfSize:16];
//    lable.numberOfLines = numberOfLines;
//    lable.adjustsFontSizeToFitWidth = adjustsFontSizeToFitWidth;
//    return lable;
//}
@end
