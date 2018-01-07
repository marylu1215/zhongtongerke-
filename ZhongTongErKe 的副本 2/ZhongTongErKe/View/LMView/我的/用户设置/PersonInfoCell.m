//
//  PersonInfoCell.m
//  MagicFinger
//
//  Created by xufeng on 16/5/18.
//  Copyright © 2016年 zeenc. All rights reserved.
//
#define PersonInfoTableIdentifier @"PersonInfoTVIdentifier"
#import "PersonInfoCell.h"

@implementation PersonInfoCell
+(instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *ID = PersonInfoTableIdentifier;
    PersonInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[PersonInfoCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:ID];
    }
    return cell;
}
-(void)configUI{
    [super configUI];
    _titleLabel = [UILabel labelWithFrame:CGRectZero Text:@"" Font:12 Color:TITLE_COLOR Alignment:(NSTextAlignmentLeft)];
    [self.contentView addSubview:_titleLabel];
    
    _detailBtn = [UIButton addBtnWithTitle:@"" WithFont:12 WithTitleColor:TITLE_COLOR];
    [_detailBtn setContentHorizontalAlignment:UIControlContentHorizontalAlignmentRight];
    [self.contentView addSubview:_detailBtn];
    
    _detailTF = [UITextField addTextFieldWithPlaceholder:@"" Font:12 TextColor:TITLE_COLOR TextAlignment:NSTextAlignmentRight];
    [_detailTF setValue:[UIColor redColor] forKeyPath:@"_placeholderLabel.textColor"];
    _detailTF.delegate = self;
    // 监听文本框文字的改变
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFiledEditDidChanged:) name:UITextFieldTextDidChangeNotification object:_detailTF];
    
    
    [_detailTF addTarget:self action:@selector(beginCellTFEdit:) forControlEvents:(UIControlEventAllEvents)];
    
    [self.contentView addSubview:_detailTF];
}
-(void)configFrame{
    [super configFrame];
    self.contentView.height = px(90);
    
    _titleLabel.sd_layout.leftSpaceToView(self.contentView,15).widthIs(15 * 6).centerYEqualToView(self.contentView).heightIs(20);//原height ： 15;
    
    _detailTF.sd_layout.leftSpaceToView(_titleLabel,15).rightSpaceToView(self.contentView,15).topSpaceToView(self.contentView,1).bottomSpaceToView(self.contentView,1);

    _detailBtn.sd_layout.leftSpaceToView(_titleLabel,15).rightSpaceToView(self.contentView,15).topSpaceToView(self.contentView,1).bottomSpaceToView(self.contentView,1);
    [self setupAutoHeightWithBottomView:self.contentView bottomMargin:0];
}
-(void)beginCellTFEdit:(UITextField *)textField{
    textField.keyboardType = UIKeyboardTypeDefault;
    switch (textField.tag) {
     
        case 2:
            textField.keyboardType = UIKeyboardTypeNumberPad;
            break;
        case 11:
            textField.keyboardType = UIKeyboardTypeNumberPad;
            break;
        default:
            break;
    }
}
-(void)textFiledEditDidChanged:(NSNotification *)obj{
    UITextField *textField = (UITextField *)obj.object;
    if (textField.tag ==  1) {//限制字数
        [textField textField:textField maxZhHansStrLength:nameMaxLength];
        
    }
    if (textField.tag == 2) {//限制字数
        [textField textField:textField maxStrLength:telMaxLength];
    }
    
    if (textField.tag == 10) {//限制字数
        [textField textField:textField maxStrLength:QQMaxLength];
    }
    if (textField.tag == 11) {//限制字数
        [textField textField:textField maxStrLength:QQMaxLength];
    }
    if (textField.tag == 12) {//限制字数
        [textField textField:textField maxStrLength:IDCardMaxLength];
    }
    if (textField.tag == 13) {//限制字数
        [textField textField:textField maxStrLength:QQMaxLength];
    }
    
    
    if (textField.tag == 20||textField.tag == 21||textField.tag == 22) {//限制字数
        [textField textField:textField maxStrLength:bankMaxLength];
    }
    
    
    if (textField.tag == 23) {//限制字数
        [textField textField:textField maxStrLength:bankcardMaxLength];
    }
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
