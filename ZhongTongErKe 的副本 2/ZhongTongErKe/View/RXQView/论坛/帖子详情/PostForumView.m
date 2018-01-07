//
//  PostForumView.m
//  ZhongTongErKe
//
//  Created by khj on 2017/6/6.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "PostForumView.h"

@interface PostForumView ()<UITextFieldDelegate>

@property (nonatomic ,strong) UIButton *sendBtn;


@end
@implementation PostForumView

-(id)init
{
    if (self = [super init]) {
     
    self.backgroundColor = c240240240;
    self.sendBtn = [UIButton addBtnWithTitle:@"发送" WithBGImg:nil WithFont:Font15 WithTitleColor:c255255255 Target:self Action:@selector(sendAction)];
    self.sendBtn.backgroundColor = cHBColor;
    self.sendBtn.layer.cornerRadius = 6;
    self.sendBtn.clipsToBounds = YES;
    [self addSubview:self.sendBtn];
    self.sendBtn.sd_layout.widthIs(px(100)).heightIs(px(50)).rightSpaceToView(self,px(20)).centerYEqualToView(self);
      
       
    self.repTextField  = [[UITextField alloc]init];
    self.repTextField.textColor = TITLE_COLOR;
    self.repTextField.backgroundColor = c255255255;
    self.repTextField.font = font(Font13) ;
    self.repTextField.layer.borderColor = sepBgColor.CGColor;
    self.repTextField.layer.borderWidth = px(2);
    self.repTextField.layer.cornerRadius = 6;
    self.repTextField.clipsToBounds = YES;
    self.repTextField.delegate = self;
    // 监听文本框文字的改变
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFiledEditDidChanged:) name:UITextFieldTextDidChangeNotification object: self.repTextField];
    [self  addSubview:self.repTextField];
    self.repTextField.sd_layout.topSpaceToView(self,px(20)).bottomSpaceToView(self,px(20)).leftSpaceToView(self,px(20)).rightSpaceToView(self.sendBtn,px(30));

    }
    
    return self;
}

-(void)textFiledEditDidChanged:(NSNotification *)obj{
    UITextField *textField = (UITextField *)obj.object;
    [textField textField:textField maxZhHansStrLength:500];
    
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

-(void)sendAction
{
    if (self.sendBlock) {
        
        self.sendBlock();
    }
    

    [self endEditing:YES];
}

-(void)setForum:(Forum *)forum
{
   
    self.repTextField.placeholder = [NSString stringWithFormat:@"回个帖帮楼主上推荐    %@", [NSString stringWithFormat:@"已有%@回帖",forum.reply]];
}

@end
