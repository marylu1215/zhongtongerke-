//
//  SSPersonalFileListTableCell.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/5.
//  Copyright © 2017年 Claf. All rights reserved.
//
#define PersonalFileCellIdentifier @"PersonalFileCellIdentifier"

#import "SSPersonalFileListTableCell.h"

@interface SSPersonalFileListTableCell ()

@property (nonatomic,strong)UIView *bottomLineView;

@end

@implementation SSPersonalFileListTableCell


+(instancetype)cellWithTableView:(UITableView *)tableView{
    
   SSPersonalFileListTableCell *cell = [tableView dequeueReusableCellWithIdentifier:PersonalFileCellIdentifier];
    if (!cell) {
        cell = [[SSPersonalFileListTableCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:PersonalFileCellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

-(void)configUI{
    [super configUI];
    
    _titleLabel = [UILabel labelWithFrame:CGRectZero Text:@"" Font:Font13 Color:TITLE_COLOR Alignment:(NSTextAlignmentLeft)];
    [self.contentView addSubview:_titleLabel];
    
    _detailBtn = [UIButton addBtnWithTitle:@"" WithFont:Font13 WithTitleColor:TITLE_COLOR];
    [_detailBtn setContentHorizontalAlignment:UIControlContentHorizontalAlignmentRight];
    [self.contentView addSubview:_detailBtn];
    
    _detailTF = [UITextField addTextFieldWithPlaceholder:@"" Font:Font13 TextColor:TITLE_COLOR TextAlignment:NSTextAlignmentRight];

    [_detailTF setValue:REMARK_COLOR forKeyPath:@"_placeholderLabel.textColor"];
    _detailTF.delegate = self;
    // 监听文本框文字的改变
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFiledEditDidChanged:) name:UITextFieldTextDidChangeNotification object:_detailTF];
    [_detailTF addTarget:self action:@selector(beginCellTFEdit:) forControlEvents:(UIControlEventAllEvents)];
    [self.contentView addSubview:_detailTF];
    
    _arrowImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:goImageName]];
    [self.contentView addSubview:_arrowImageView];
    
    _bottomLineView = [[UIView alloc]init];
    _bottomLineView.backgroundColor = BACKGROUND_COLOR;
    [self.contentView addSubview:_bottomLineView];
}
-(void)configFrame{
    
    
    [super configFrame];
 
    _titleLabel.sd_layout.leftSpaceToView(self.contentView,px(30)).widthIs(px(30) * 6).centerYEqualToView(self.contentView).heightIs(20);
    
    _arrowImageView.sd_layout.widthIs(_arrowImageView.image.size.width).heightIs(_arrowImageView.image.size.height).centerYEqualToView(self.contentView).rightSpaceToView(self.contentView,px(30));
    
    _detailTF.sd_layout.leftSpaceToView(_titleLabel,px(30)).rightSpaceToView(_arrowImageView,px(10)).topSpaceToView(self.contentView,1).bottomSpaceToView(self.contentView,1);
    
    _detailBtn.sd_layout.leftSpaceToView(_titleLabel,px(30)).rightSpaceToView(_arrowImageView,px(10)).topSpaceToView(self.contentView,1).bottomSpaceToView(self.contentView,1);
    _bottomLineView.sd_layout.widthIs(kScreenWidth).heightIs(px(2)).bottomSpaceToView(self.contentView,0);
}
-(void)beginCellTFEdit:(UITextField *)textField{
    textField.keyboardType = UIKeyboardTypeDefault;
    switch (textField.tag) {
       
        case 10:
             textField.keyboardType = UIKeyboardTypeNumberPad;
            break;
        case 11:
            textField.keyboardType = UIKeyboardTypeNumberPad;
            break;
        case 21:
            textField.keyboardType = UIKeyboardTypeNumberPad;
            break;
        default:
            break;
    }
}
-(void)textFiledEditDidChanged:(NSNotification *)obj{
    UITextField *textField = (UITextField *)obj.object;
    if (textField.tag == 200 + 0) {//限制字数
        [textField textField:textField maxZhHansStrLength:nameMaxLength];
        
    }
    if (textField.tag == 200 + 3) {//限制字数
        [textField textField:textField maxStrLength:telMaxLength];
    }
    if (textField.tag == 200 + 4) {//限制字数
        [textField textField:textField maxStrLength:QQMaxLength];
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
