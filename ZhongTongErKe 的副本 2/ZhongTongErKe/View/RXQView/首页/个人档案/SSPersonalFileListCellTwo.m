//
//  SSPersonalFileListCellTwo.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/5.
//  Copyright © 2017年 Claf. All rights reserved.
//
#define ListCellTwoIdentifier @"ListCellTwoIdentifier"
#import "SSPersonalFileListCellTwo.h"

@interface SSPersonalFileListCellTwo ()

@property(nonatomic,strong)UIView *bottomLineView;

@end

@implementation SSPersonalFileListCellTwo


+(instancetype)cellWithTableView:(UITableView *)tableView{

    SSPersonalFileListCellTwo *cell = [tableView dequeueReusableCellWithIdentifier:ListCellTwoIdentifier ];
    if (!cell) {
        cell = [[SSPersonalFileListCellTwo alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:ListCellTwoIdentifier];
    }
    return cell;
}

-(void)configUI{
    [super configUI];
    
    _headLabel = [UILabel labelWithFrame:CGRectZero Text:@"" Font:Font13 Color:TITLE_COLOR Alignment:(NSTextAlignmentLeft)];
    [self.contentView addSubview:_headLabel];
    
    _contentTextField = [UITextField addTextFieldWithPlaceholder:@"" Font:Font13 TextColor:TITLE_COLOR TextAlignment:NSTextAlignmentRight];
    
    [_contentTextField setValue:REMARK_COLOR forKeyPath:@"_placeholderLabel.textColor"];
    _contentTextField.delegate = self;
    // 监听文本框文字的改变
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFiledEditDidChanged:) name:UITextFieldTextDidChangeNotification object:_contentTextField];
    [self.contentView addSubview:_contentTextField];
    
    _bottomLineView = [[UIView alloc]init];
    _bottomLineView.backgroundColor = BACKGROUND_COLOR;
    [self.contentView addSubview:_bottomLineView];
}
-(void)configFrame{
    
    
    [super configFrame];
    
    _headLabel.sd_layout.leftSpaceToView(self.contentView,px(30)).widthIs(px(30) * 6).centerYEqualToView(self.contentView).heightIs(20);

    _contentTextField.sd_layout.leftSpaceToView(_headLabel,px(30)).rightSpaceToView(self.contentView,px(30)).topSpaceToView(self.contentView,1).bottomSpaceToView(self.contentView,1);
    
    _bottomLineView.sd_layout.widthIs(kScreenWidth).heightIs(px(2)).bottomSpaceToView(self.contentView,0);
}

-(void)textFiledEditDidChanged:(NSNotification *)obj{
    UITextField *textField = (UITextField *)obj.object;

    [textField textField:textField maxZhHansStrLength:nameMaxLength];
        

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
