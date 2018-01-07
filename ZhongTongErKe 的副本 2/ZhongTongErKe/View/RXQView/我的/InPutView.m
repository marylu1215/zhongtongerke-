//
//  InPutView.m
//  ZhongTongErKe
//
//  Created by khj on 2017/6/8.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "InPutView.h"

@implementation InPutView

-(id)initWithFrame:(CGRect)frame headImageStr:(NSString *)headImageStr placeHolder:(NSString *)placeHolder
{
    if (self = [super initWithFrame:frame]) {
        
        UIImage *image = [UIImage imageNamed:headImageStr];
        UIImageView *headImageView = [[UIImageView alloc]initWithImage:image ];
        [self addSubview:headImageView];
      
        headImageView.sd_layout.widthIs(image.size.width).heightIs(image.size.height).leftSpaceToView(self,px(140)*kScreenWidthScale).centerYEqualToView(self);
        
        UIView *bottomView = [[UIView alloc]init];
        bottomView.backgroundColor = c255255255;
        [self addSubview:bottomView];
        bottomView.sd_layout.leftSpaceToView(headImageView,px(2)).bottomSpaceToView(self,0).heightIs(px(2)).rightSpaceToView(self,px(140));
        
       self.inputTextField =[UITextField addTextFieldWithPlaceholder:placeHolder Font:Font15 TextColor:c255255255 TextAlignment:NSTextAlignmentLeft];
         [ self.inputTextField setValue:c255255255 forKeyPath:@"_placeholderLabel.textColor"];
       self.inputTextField.delegate = self;
        [self addSubview: self.inputTextField];
        self.inputTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
        self.inputTextField.sd_layout.topSpaceToView(self,0).bottomSpaceToView(self,0).leftSpaceToView(headImageView,px(20)).rightSpaceToView(self,px(140));
       [self.inputTextField addTarget:self action:@selector(beginCellTFEdit:) forControlEvents:(UIControlEventAllEvents)];
        // 监听文本框文字的改变
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange:) name:UITextFieldTextDidChangeNotification object: self.inputTextField];
    }
    return self;
}
-(void)beginCellTFEdit:(UITextField *)textField{
    textField.keyboardType = UIKeyboardTypeDefault;
    switch (textField.tag) {
        case 200 + 0:
               textField.keyboardType = UIKeyboardTypeNumberPad;
            break;
        default:
            break;
    }
}
#pragma mark - 监听文字的改变
- (void)textChange:(NSNotification *)obj
{
    UITextField *textField = (UITextField *)obj.object;
    if (textField.tag == 200) {
        
        [textField textField:textField maxStrLength:telMaxLength];
    }
    
    else
    {
          [textField textField:textField maxStrLength:pwdMaxLength];
    }
    
   
}
#pragma mark - textField Delegate
//限制表情
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if ([text isEqualToString:@""]) {
        return YES;
    }
    
    if (![NSString  stringContainsEmoji:text]) {
        return NO;
    }
    return YES;
}

#pragma mark - <UITextFieldDelegate>
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    
    if (textField.tag == 200 ) {
        NSCharacterSet *cs;
        cs = [[NSCharacterSet characterSetWithCharactersInString:NUMBERS] invertedSet];
        
        NSString*filtered = [[string componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
        BOOL basicTest = [string isEqualToString:filtered];
        if(!basicTest) {
            
            return NO;
            
        }
        return YES;
    }else
    {
        return YES;
    }

        
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self endEditing:YES];
    return YES;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
