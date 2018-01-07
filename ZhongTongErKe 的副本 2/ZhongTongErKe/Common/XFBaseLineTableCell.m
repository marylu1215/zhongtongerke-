//
//  XFBaseLineTableCell.m
//  MagicFinger
//
//  Created by xufeng on 16/6/7.
//  Copyright © 2016年 zeenc. All rights reserved.
//

#import "XFBaseLineTableCell.h"

@implementation XFBaseLineTableCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = c255255255;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        //界面
        [self configUI];
        [self configFrame];
    }
    return self;
}
-(void)configUI{
   
}

-(void)configFrame{
   
}

- (void)setLineMargin:(CGFloat)lineMargin{
   
}

-(UITextField *)textField{
    UITextField *tf = [UITextField addTextFieldWithPlaceholder:@"" Font:15 TextColor:TITLE_COLOR TextAlignment:(NSTextAlignmentRight)];
    [self.contentView addSubview:tf];
    return tf;
}
-(UILabel *)label{
    UILabel *label = [UILabel labelWithText:@"" Font:15 Color:cGrayWord Alignment:(NSTextAlignmentLeft)];
    [self.contentView addSubview:label];
    return label;
}
@end
