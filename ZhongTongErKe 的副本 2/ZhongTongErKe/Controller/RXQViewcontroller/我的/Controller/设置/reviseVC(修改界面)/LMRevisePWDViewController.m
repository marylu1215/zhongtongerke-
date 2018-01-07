//
//  LMRevisePWDViewController.m
//  MagicFinger
//
//  Created by lm on 18/5/16.
//  Copyright © 2016年 zeenc. All rights reserved.
//

#import "LMRevisePWDViewController.h"
#import "UITextField+LimitLength.h"
#import "LMBorderView.h"
#import "CornerButton.h"
#import "UserTool.h"
#import "LoginViewController.h"
@interface LMRevisePWDViewController ()<UITextFieldDelegate>

{
    UITextField  *pwd;
    UITextField  *newPwd;
    UITextField  *repPwd;

}
@end

@implementation LMRevisePWDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
-(void)configUI;
{
    [super configUI];
    self.title = @"修改密码";
    
}
#pragma mark 界面
-(void)setUP
{
    [super setUP];
    
    LMBorderView *userView = [LMBorderView new];
    [self.view addSubview:userView];
    userView.sd_layout.leftSpaceToView(self.view,0).rightSpaceToView(self.view,px(30)).heightIs(px(74)).topSpaceToView(self.view,0);
    
    UILabel *pwdLabel = [UILabel addLabelWithText:@"旧密码:" AndFont:12 AndAlpha:1.0 AndColor:TITLE_COLOR];
    [userView addSubview:pwdLabel];
 
    pwdLabel.sd_layout.leftSpaceToView(userView,px(20)).centerYEqualToView(userView).widthIs([NSString backSizeWithText:pwdLabel.text andFont:font(Font13)].width).heightIs(13);
  
    pwd = [UITextField addTextFieldWithPlaceholder:@"请输入你的当前密码" Font:Font13 TextColor:TITLE_COLOR TextAlignment:NSTextAlignmentLeft];
    pwd.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [pwd setValue:c170170170 forKeyPath:@"_placeholderLabel.textColor"];
    pwd.clearButtonMode = UITextFieldViewModeWhileEditing;
    pwd.secureTextEntry = YES;
    pwd.delegate = self;
    [userView addSubview:pwd];
    pwd.sd_layout.leftSpaceToView(userView,px(200)).heightIs(px(36)).centerYEqualToView(userView).rightSpaceToView(userView,0);
    
    
    LMBorderView *newPwdView = [LMBorderView new];
    [self.view addSubview:newPwdView];
   newPwdView.sd_layout.leftSpaceToView(self.view,0).rightSpaceToView(self.view,0).heightIs(px(74)).topSpaceToView(userView,0);
    
    UILabel   *newPwdLabel = [UILabel addLabelWithText:@"新密码:" AndFont:Font13 AndAlpha:1.0 AndColor:TITLE_COLOR];
  
     [newPwdView addSubview:newPwdLabel];
    newPwdLabel.sd_layout.widthIs([NSString backSizeWithText:newPwdLabel.text andFont:font(Font13)].width).heightIs(Font13).leftSpaceToView(newPwdView,px(20)).centerYEqualToView(newPwdView);
    
    newPwd = [UITextField addTextFieldWithPlaceholder:@"请输入你的新密码" Font:  Font13 TextColor:TITLE_COLOR TextAlignment:NSTextAlignmentLeft];
    newPwd.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [newPwd setValue:c170170170 forKeyPath:@"_placeholderLabel.textColor"];
    newPwd.clearButtonMode = UITextFieldViewModeWhileEditing;
    newPwd.secureTextEntry=YES;
    newPwd.delegate = self;
    [newPwdView addSubview:newPwd];
    newPwd.sd_layout.leftSpaceToView(newPwdView,px(200)).heightIs(px(36)).centerYEqualToView(newPwdLabel).rightSpaceToView(newPwdView,0);
    
    
    LMBorderView *repPwdView = [LMBorderView new];
    [self.view addSubview:repPwdView];
    repPwdView.sd_layout.leftSpaceToView(self.view,0).rightSpaceToView(self.view,0).heightIs(px(70)).topSpaceToView(newPwdView,0);
    
    UILabel   *repPwdLabel=[UILabel addLabelWithText:@"确认密码:" AndFont:Font13 AndAlpha:1.0 AndColor:TITLE_COLOR];
    [repPwdView addSubview:repPwdLabel];
   
    repPwdLabel.sd_layout.centerYEqualToView(repPwdView).leftSpaceToView(repPwdView,px(30)).widthIs([NSString backSizeWithText:repPwdLabel.text andFont:font(Font13)].width).heightIs(Font13);
    
   
    repPwd = [UITextField addTextFieldWithPlaceholder:@"请再一次输入新密码" Font:Font13 TextColor: TITLE_COLOR TextAlignment:NSTextAlignmentLeft];
    repPwd.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [repPwd setValue:c170170170 forKeyPath:@"_placeholderLabel.textColor"];
    repPwd.secureTextEntry=YES;
    repPwd.clearButtonMode = UITextFieldViewModeWhileEditing;
    repPwd.delegate = self;
    [repPwdView addSubview:repPwd];
    repPwd.sd_layout.leftSpaceToView(repPwdView,px(200)).heightIs(px(36)).centerYEqualToView(repPwdLabel).rightSpaceToView(repPwdView,0);
    
    
    // 监听文本框文字的改变
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFiledEditDidChanged:) name:UITextFieldTextDidChangeNotification object:pwd];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFiledEditDidChanged:) name:UITextFieldTextDidChangeNotification object:newPwd];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFiledEditDidChanged:) name:UITextFieldTextDidChangeNotification object:repPwd];
    
    pwd.keyboardType = UIKeyboardTypeASCIICapable;
    newPwd.keyboardType = UIKeyboardTypeASCIICapable;
    repPwd.keyboardType = UIKeyboardTypeASCIICapable;
    
   UIButton *sureBtn = [[UIButton alloc]init];
    [sureBtn  setTitle:@"确认修改" forState:UIControlStateNormal];
    [sureBtn  addTarget:self action:@selector(sureAction) forControlEvents:UIControlEventTouchUpInside];
    sureBtn.backgroundColor = MAIN_COLOR;
    sureBtn.layer.cornerRadius =6;
    [self.view addSubview:sureBtn];
    [sureBtn  setTitleColor:c255255255 forState:UIControlStateNormal];
    sureBtn.sd_layout.leftSpaceToView(self.view,px(170)).rightSpaceToView(self.view,px(170)).topSpaceToView(repPwdView,px(30)).heightIs(px(48));

}
-(void)touchesEnded:(nonnull NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event
{
    
    [pwd resignFirstResponder];
    [newPwd resignFirstResponder];
    [repPwd resignFirstResponder];
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    [pwd resignFirstResponder];
    [newPwd resignFirstResponder];
    [repPwd resignFirstResponder];
}


-(void)sureAction

{
    [self.view endEditing:YES];
    
    if ([ pwd.text isEqualToString:@""]) {
        [MBProgressHUD showError:@"请输入你的旧密码"];
        return;
    }
    //在这里直接进行旧密码验证
    else if (![pwd.text isEqualToString:[UserTool user].pwd])
    {
        [MBProgressHUD showError:@"你输入的旧密码不正确"];
        return;
    }
    else if ([ newPwd.text isEqualToString:@""]) {
        [MBProgressHUD showError:@"请输入新密码"];
        
        return;
    }
    
    else  if (!(newPwd.text.length >=6 && newPwd.text.length <= 20)) {
        [MBProgressHUD showError:@"密码长度必须在6-20位"];
        
        return;
    }
    else if (![NSString validatePwdNumber:newPwd.text]){
        
        [MBProgressHUD showError:@"请输入包含字母或数字组成的密码"];
        return;
    }
    else if ([ pwd.text isEqualToString:newPwd.text])
    {
        
        [MBProgressHUD showError:@"旧密码与新密码一致，请重新输入"];
        
        return;
        
    }
    else  if ([ repPwd.text isEqualToString:@""]) {
        [MBProgressHUD showError:@"请输入重置密码"];
        
        return;
    }
    
    else if (![newPwd.text isEqualToString:repPwd.text])
    {
        [MBProgressHUD showError:@"新密码与确认密码不一致"];
        return;
    }
    [self  getSurePwd];
}

#pragma mark - textField
-(void)textFiledEditDidChanged:(NSNotification *)obj{
    
    UITextField *textField = (UITextField *)obj.object;
//    //限制字数
    [textField textField:textField maxStrLength:20];
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

//#pragma mark 网络请求
-(void)getSurePwd
{

    NSMutableDictionary *params=[NSMutableDictionary dictionary];
    params[@"password"]=pwd.text;
    
    params[@"newpassword"]=newPwd.text;

    kshowMessage(@"密码修改中");
    
    [HttpTool postWithURL:updatePwdUrl params:params success:^(id json) {
        
        
        if (jsonMsg(json)) {
            [MBProgressHUD showSuccess:@"修改密码成功"];
            [self.navigationController pushViewController:[LoginViewController new] animated:YES];
            
        }
        else
        {
            [MBProgressHUD showError:json[@"msg"]];
        }
       
        kHideHUDAll;

    } failure:^(NSError *error) {
        
        netWorkError;
        kHideHUDAll;
    }];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
