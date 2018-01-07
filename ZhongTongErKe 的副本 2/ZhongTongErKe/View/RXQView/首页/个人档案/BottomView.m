//
//  BottomView.m
//  ZhongTongErKe
//
//  Created by khj on 2017/7/4.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "BottomView.h"

@interface BottomView ()<UITextFieldDelegate>

@property (nonatomic ,strong) UIImageView *topLine;

@property (nonatomic ,strong) UIView *contentView;
@property (nonatomic ,strong) UILabel *headLabel;

@end
@implementation BottomView

-(id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.topLine = [UIImageView createImageViewWithImageName:nil color:sepBgColor];
        [self addSubview:self.topLine];
        self.topLine.sd_layout.widthIs(kScreenWidth).heightIs(px(2)).topSpaceToView(self,0);
        
        self.contentView = [[UIView alloc]init];
        [self addSubview:self.contentView];
        self.contentView.sd_layout.widthIs(kScreenWidth).heightIs(px(116)).topSpaceToView(self.topLine,0);
        
        self.headLabel =[UILabel addLabelWithText:@"其他疾病" AndFont:Font13 AndAlpha:1.0 AndColor:TITLE_COLOR];
        [self.contentView addSubview:self.headLabel];
        
        self.headLabel.sd_layout.widthIs([NSString backSizeWithText:self.headLabel.text andFont:font(Font13)].width).heightIs(Font13).leftSpaceToView(self.contentView,px(78)).topSpaceToView(self.contentView,px(20));
        
        UIImageView *bottomImageView = [UIImageView createImageViewWithImageName:nil color:[UIColor colorWithHexString:@"aaaaaa"]];
        [self.contentView addSubview:bottomImageView];
        bottomImageView.sd_layout.widthIs(px(184)).heightIs(px(2)).topSpaceToView(self.contentView,px(38)).leftSpaceToView(self.headLabel,px(4));
        
        self.contentTextField = [UITextField addTextFieldWithPlaceholder:@"" Font:Font13 TextColor:REMARK_COLOR TextAlignment:NSTextAlignmentLeft];
        [self.contentView addSubview:self.contentTextField];
        self.contentTextField.sd_layout.widthIs(px(184)).heightIs(Font13).centerYEqualToView(self.headLabel).leftSpaceToView(self.headLabel,px(4));
        
        [self.contentTextField setValue:[UIColor redColor] forKeyPath:@"_placeholderLabel.textColor"];
         self.contentTextField.delegate = self;
        // 监听文本框文字的改变
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFiledEditDidChanged:) name:UITextFieldTextDidChangeNotification object:self.contentTextField];
       
        
    }
    return self;
}

-(void)textFiledEditDidChanged:(NSNotification *)obj{
    UITextField *textField = (UITextField *)obj.object;
  
    [textField textField:textField maxZhHansStrLength:nameMaxLength];
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    textField.text = @"";
    return YES;
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if ([string isEqualToString:@""]) {
        return YES;
    }
    
    if (![NSString stringContainsEmoji:string]) {
        return NO;
    }
    return YES;
}


-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

@end
