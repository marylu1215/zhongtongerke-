//
//  RealNameTableViewCell.m
//  ZhongTongErKe
//
//  Created by khj on 2017/6/1.
//  Copyright © 2017年 Claf. All rights reserved.
//

#define RealNameCellIdentifier @"RealNameCellIdentifier"
#import "RealNameTableViewCell.h"

@interface RealNameTableViewCell () <UITextFieldDelegate,UIActionSheetDelegate,UIAlertViewDelegate>

@property (nonatomic ,strong) UILabel *nameLabel;
@property (nonatomic ,strong) UILabel *sexLabel;
@property (nonatomic ,strong) UILabel *telLabel;

@end
@implementation RealNameTableViewCell

+(instancetype)cellWithTableView:(UITableView *)tableView{
    
     RealNameTableViewCell  *cell = [tableView dequeueReusableCellWithIdentifier:RealNameCellIdentifier];
    if (!cell) {
        cell = [[RealNameTableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:RealNameCellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}


-(void)configUI{
    
    self.nameLabel = [UILabel addLabelWithText:@"姓名" AndFont:12 AndAlpha:1.0 AndColor:TITLE_COLOR];
    [self.contentView addSubview: self.nameLabel];
    
    self.nameTextField = [UITextField addTextFieldWithPlaceholder:@"请输入姓名" Font:12 TextColor: TITLE_COLOR  TextAlignment:NSTextAlignmentRight];
    self.nameTextField.tag = 0;
    [self.contentView addSubview: self.nameTextField];
    [ self.nameTextField setValue:cGrayWord forKeyPath:@"_placeholderLabel.textColor"];
    
    self.sexLabel = [UILabel addLabelWithText:@"性别" AndFont:12 AndAlpha:1.0 AndColor:TITLE_COLOR];
    [self.contentView addSubview:self.sexLabel];
    
    self.sexBtn = [UIButton addBtnWithTitle:@"请选择性别"WithBGImg:nil WithFont:Font13 WithTitleColor:TITLE_COLOR Target:self Action:@selector(chooseAction)];
    [self.contentView addSubview: self.sexBtn];
    
    self.telLabel = [UILabel addLabelWithText:@"手机号" AndFont:12 AndAlpha:1.0 AndColor:TITLE_COLOR];
    [self.contentView addSubview: self.telLabel];
    
   
    self.telTextField = [UITextField addTextFieldWithPlaceholder:@"医生可以通过手机号联系到您" Font:12 TextColor: TITLE_COLOR TextAlignment:NSTextAlignmentRight];
    [self.contentView addSubview:self.telTextField];
     self.telTextField.tag = 1;
    [ self.telTextField setValue:cGrayWord forKeyPath:@"_placeholderLabel.textColor"];
    
    // 监听文本框文字的改变
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFiledEditDidChanged:) name:UITextFieldTextDidChangeNotification object:self.nameTextField];
    [self.nameTextField  addTarget:self action:@selector(beginCellTFEdit:) forControlEvents:(UIControlEventAllEvents)];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFiledEditDidChanged:) name:UITextFieldTextDidChangeNotification object:self.telTextField];
    [self.telTextField  addTarget:self action:@selector(beginCellTFEdit:) forControlEvents:(UIControlEventAllEvents)];
}
-(void)configFrame
{
    self.nameLabel.sd_layout.widthIs([NSString backSizeWithText: self.nameLabel.text andFont:font(12)].width).heightIs(12).topSpaceToView(self.contentView,0).leftSpaceToView(self.contentView,px(20));
    
    self.nameTextField.sd_layout.rightSpaceToView(self.contentView,px(30)).leftSpaceToView( self.nameLabel,0).heightIs(px(70)).centerYEqualToView(self.nameLabel);

    
      self.sexLabel.sd_layout.widthIs([NSString backSizeWithText:self.sexLabel.text andFont:font(12)].width).heightIs(12).topSpaceToView( self.nameLabel,px(50)).leftSpaceToView(self.contentView,px(20));
    
     self.sexBtn.sd_layout.rightSpaceToView(self.contentView,px(20)).widthIs(px(150)).heightIs(px(70)).centerYEqualToView(self.sexLabel);
    self.sexBtn.titleLabel.textAlignment = NSTextAlignmentLeft;
    
    
    self.telLabel.sd_layout.widthIs([NSString backSizeWithText:self.telLabel.text andFont:font(12)].width).heightIs(12).topSpaceToView(self.sexLabel,px(50)).leftSpaceToView(self.contentView,px(20));
    
    self.telTextField .sd_layout.rightSpaceToView(self.contentView,px(30)).leftSpaceToView(self.telLabel,0).heightIs(px(70)).centerYEqualToView(self.telLabel);
}


-(void)beginCellTFEdit:(UITextField *)textField{
    textField.keyboardType = UIKeyboardTypeDefault;
    switch (textField.tag) {
            
        case 1:
            textField.keyboardType = UIKeyboardTypeNumberPad;
            break;
        default:
            break;
    }
}

-(void)textFiledEditDidChanged:(NSNotification *)obj{
    UITextField *textField = (UITextField *)obj.object;
    if (textField.tag ==  0) {//限制字数
        [textField textField:textField maxZhHansStrLength:nameMaxLength];
        
    }
    if (textField.tag == 1) {//限制字数
        [textField textField:textField maxStrLength:telMaxLength];
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

-(void)chooseAction
{
    // 弹出UIActionSheet
    [self endEditing:YES];
    UIActionSheet *action = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"男" otherButtonTitles:@"女",nil] ;
    [action showInView:self];
}

#pragma mark - UIActionSheet代理方法
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *btnTitle = [actionSheet buttonTitleAtIndex:buttonIndex];

    [self.sexBtn setTitle:btnTitle forState:(UIControlStateNormal)];
   
}

@end
