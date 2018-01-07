//
//  ForgetPwdViewController.m
//  ZhongTongErKe
//
//  Created by khj on 2017/6/25.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "ForgetPwdViewController.h"
#import "UITextField+expanded.h"
#import "CodeTimerButton.h"
#import "AppDelegate.h"
#import "LMBorderView.h"
#import "CornerButton.h"

@interface ForgetPwdViewController ()<UITextFieldDelegate>
/**
 *  手机号码
 */
@property (strong, nonatomic) UITextField *telTextField;
/**
 *  验证码
 */
@property (strong, nonatomic) UITextField *codeTextField;
/**
 *  密码
 */
@property (strong, nonatomic)  UITextField *pwdTextField;
/**
 *  验证码按钮
 */
@property (strong, nonatomic)  CodeTimerButton *validateCodeButton;
@property (strong, nonatomic) UIActivityIndicatorView *activityIndicator;
@end

@implementation ForgetPwdViewController

- (UIActivityIndicatorView *)activityIndicator
{
    if (_activityIndicator == nil) {
        
        _activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        _activityIndicator.center = self.view.center;
    }
    
    return _activityIndicator;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithHexString:@"f1f0f0"];
    self.title = @"忘记密码";
    self.activityIndicator.hidden = YES;
    [self prepareUI];
    
}
- (void)viewWillAppear:(BOOL)animated{
    
    self.tabBarController.tabBar.hidden = YES;
}
- (void)viewWillDisappear:(BOOL)animated{
    
    self.tabBarController.tabBar.hidden = NO;
}
- (void) prepareUI
{
    
    LMBorderView *accountView = [LMBorderView new];
    [self.view addSubview:accountView ];
    accountView.sd_layout.leftSpaceToView(self.view,0).rightSpaceToView(self.view,0).heightIs(px(80)).topSpaceToView(self.view,0);
    
    UIImageView *userImageView =[[UIImageView alloc]initWithImage:[UIImage imageNamed:zcPhoneImageName]];
    [accountView addSubview:userImageView];
    userImageView.sd_layout.widthIs(userImageView.image.size.width).heightIs(userImageView.image.size.height).leftSpaceToView(accountView,px(30)).centerYEqualToView(accountView);
    
    self.telTextField =[UITextField addTextFieldWithPlaceholder:@"请输入手机号码" Font:12 TextColor:TITLE_COLOR TextAlignment:NSTextAlignmentLeft];
    [self.telTextField setValue:cGrayWord forKeyPath:@"_placeholderLabel.textColor"];
    [accountView addSubview:self.telTextField];
    self.telTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.telTextField.keyboardType=UIKeyboardTypeNumberPad;
    self.telTextField.delegate = self;
    self.telTextField.sd_layout.leftSpaceToView(userImageView,px(30)).bottomSpaceToView(accountView,0).rightSpaceToView(accountView,0).rightSpaceToView(accountView,0);
    
    
    LMBorderView *pwdView = [LMBorderView new];
    [self.view addSubview:pwdView ];
    
    
    pwdView.sd_layout.leftSpaceToView(self.view,0).rightSpaceToView(self.view,0).heightIs(px(80)).topSpaceToView(accountView,0);
    
    UIImageView *pwdImageView =[[UIImageView alloc]initWithImage:[UIImage imageNamed:zcKeywordImageName]];
    [pwdView addSubview:pwdImageView];
    pwdImageView.sd_layout.widthIs(pwdImageView.image.size.width).heightIs(pwdImageView.image.size.height).leftSpaceToView(pwdView,px(30)).centerYEqualToView(pwdView);
    
    self.pwdTextField =[UITextField addTextFieldWithPlaceholder:@"请输入密码" Font:12 TextColor: TITLE_COLOR TextAlignment:NSTextAlignmentLeft];
    [self.pwdTextField setValue:cGrayWord forKeyPath:@"_placeholderLabel.textColor"];
    [pwdView addSubview:self.pwdTextField];
    self.pwdTextField.delegate  = self;
    self.pwdTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.pwdTextField.secureTextEntry=YES;
    self.pwdTextField.sd_layout.leftSpaceToView(pwdImageView,px(30)).topSpaceToView(pwdView,0).bottomSpaceToView(pwdView,0).rightSpaceToView(pwdView,0);
    
    
    LMBorderView  *bottomView = [[LMBorderView alloc]init];
    [self.view addSubview:bottomView];
    bottomView.sd_layout.leftSpaceToView(self.view,0).rightSpaceToView(self.view,0).heightIs(px(80)).topSpaceToView(pwdView,px(12));
    
    UIImageView *codeImageView =[[UIImageView alloc]initWithImage:[UIImage imageNamed:zcVerCodeImageName]];
    [ bottomView addSubview:codeImageView];
    codeImageView.sd_layout.widthIs(codeImageView.image.size.width).heightIs(codeImageView.image.size.height).leftSpaceToView( bottomView,px(30)).centerYEqualToView(bottomView);
    
    self.validateCodeButton = [[CodeTimerButton alloc]init];
    [self.validateCodeButton setTitle:@"获取验证码" forState:  UIControlStateNormal];
    self.validateCodeButton.titleLabel.font = font(Font13);
    [self.validateCodeButton setTitleColor:cHBColor forState:UIControlStateNormal];
    self.validateCodeButton.layer.cornerRadius =6;
    self.validateCodeButton.clipsToBounds = YES;
    self.validateCodeButton.layer.borderColor = cHBColor.CGColor;
    self.validateCodeButton.layer.borderWidth = px(2);
    [self.validateCodeButton addTarget:self action:@selector(showCodeTime:) forControlEvents:UIControlEventTouchUpInside];
    [bottomView addSubview:self.validateCodeButton];
    self.validateCodeButton.sd_layout.widthIs(px(210)).heightIs(px(62)).rightSpaceToView(bottomView,px(30)).centerYEqualToView(bottomView);
    
    self.codeTextField = [UITextField addTextFieldWithPlaceholder:@"请输入验证码" Font:12 TextColor:TITLE_COLOR TextAlignment:NSTextAlignmentLeft];
    [ self.codeTextField setValue:cGrayWord forKeyPath:@"_placeholderLabel.textColor"];
    [bottomView addSubview:self.codeTextField];
    self.codeTextField.delegate = self;
    self.codeTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.codeTextField.keyboardType=UIKeyboardTypeNumberPad;
    self.codeTextField.sd_layout.leftSpaceToView(codeImageView,px(30)).centerYEqualToView(codeImageView).heightIs(30).rightSpaceToView( self.validateCodeButton,0);
    
    UIButton *sureBtn = [[UIButton  alloc]init];
    [sureBtn setTitle:@"完成" forState:UIControlStateNormal];
    sureBtn.titleLabel.font = font(Font13);
    [sureBtn setTitleColor:c255255255 forState:UIControlStateNormal];
    [sureBtn addTarget:self action:@selector(sureAction) forControlEvents:UIControlEventTouchUpInside];
    sureBtn.backgroundColor = MAIN_COLOR;
    sureBtn.layer.cornerRadius = 6;
    sureBtn.clipsToBounds = YES;
    [self.view addSubview:sureBtn];
    sureBtn.sd_layout.leftSpaceToView(self.view,px(170)).rightSpaceToView(self.view,px(170)).topSpaceToView(bottomView,px(40)).heightIs(px(70));
    // 监听文本框文字的改变
    [self listenTextFieldChange];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark - 监听文本框文字的改变
- (void)listenTextFieldChange
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange:) name:UITextFieldTextDidChangeNotification object:self.telTextField];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange:) name:UITextFieldTextDidChangeNotification object:self.codeTextField];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange:) name:UITextFieldTextDidChangeNotification object:self.pwdTextField];
    
}

- (void)textChange:(NSNotification *)obj
{
    
        UITextField *textField = (UITextField *)obj.object;
    
        if (textField == self.telTextField) {
    
            [textField textField:textField maxStrLength:telMaxLength];
    
        }else if (textField == self.codeTextField)
        {
            [textField textField:textField maxStrLength:codeMaxLength];
    
        }else if (textField == self.pwdTextField)
        {
            [textField textField:textField maxStrLength:pwdMaxLength];
        }
    
}
-(void)sureAction

{
    [self forgetBtnClick];
    [self.view endEditing:YES];
}



- (void)forgetBtnClick
{
    
    
    [self validateStrIsTure];
    
}

#pragma mark - UITextFieldDelegate代理
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
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (textField == self.telTextField || textField == self.codeTextField) {
        NSCharacterSet *cs;
                cs = [[NSCharacterSet characterSetWithCharactersInString:NUMBERS] invertedSet];
        
                NSString*filtered = [[string componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
                BOOL basicTest = [string isEqualToString:filtered];
                if(!basicTest) {
        
                    return NO;
        
                }
        return YES;
    }
    return YES;
}

- (void)dealloc
{
    // 移除通知
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - 判断输入的格式是否正确
- (void)validateStrIsTure
{
    
    if (self.telTextField.text.length==0) {
        [MBProgressHUD showError:@"请输入手机号码"];
        return;
    }
    // 判断输入的手机号
    if (self.telTextField.text.length < 11 || ![NSString validateMobile:self.telTextField.text]) {
        [MBProgressHUD showError:@"请输入正确的手机号码"];
        return;
    }
    if (self.codeTextField.text.length == 0) {
        [MBProgressHUD showError:@"请输入验证码"];
        return;
    }
    if (self.codeTextField.text.length != 4) {
        [MBProgressHUD showError:@"请输入正确的验证码"];
        return;
    }
    
    if (self.pwdTextField.text.length == 0) {
        [MBProgressHUD showError:@"请输入密码"];
        return;
    }
    
    // 判断输入的密码 6-20位
    NSString *pwdStr = self.pwdTextField.text;
    
    // 去掉字符串的空格
    pwdStr = [pwdStr stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    if (![NSString validatePwdNumber:self.pwdTextField.text]) {
        [MBProgressHUD showError:@"密码只能由字母或数字组成"];
        return;
    }
    
    self.pwdTextField.text = pwdStr;
    
    if (!(pwdStr.length >=6 && pwdStr.length <=20)) {
        [MBProgressHUD showError:@"密码长度必须在6-20位"];
        return;
    }
    
    // 发送注册请求
    [self sendRegistRequest];
    
}

#pragma mark - 注册请求
- (void)sendRegistRequest
{
    // 停止获取验证码倒计时
    [self.validateCodeButton stop];
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"phone"] = self.telTextField.text;
    params[@"password"] = self.pwdTextField.text;
    params[@"code"] = self.codeTextField.text;
    [MBProgressHUD showMessage:@"重置密码中..."];
    
   
    [HttpTool postWithURL:forget_psdLoginUrl params:params success:^(id json) {
        
        if (jsonMsg(json)) {
            
            [MBProgressHUD showSuccess:@"重置成功..."];
            
            [self.navigationController popViewControllerAnimated:YES];
            
        }
        
        kHideHUDAll;
    } failure:^(NSError *error) {
        
        netWorkError;
        kHideHUDAll;
    }];
    
    
    
    
}

#pragma mark - 获取验证码
- (void)showCodeTime:(CodeTimerButton *)button {
    
    // 判断手机号
    
    if (self.telTextField.text.length==0) {
        [MBProgressHUD showError:@"请输入手机号码"];
        return;
    }
    if (self.telTextField.text.length < 11 || ![NSString validateMobile:self.telTextField.text]) {
        [MBProgressHUD showError:@"请输入正确的手机号码"];
        return;
    }
    self.activityIndicator.hidden = NO;
    [self.activityIndicator startAnimating];
    
    // 获取验证码网络请求
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"tel"] = self.telTextField.text;
    
    [HttpTool postWithURL:getRegisterCodeUrl params:params success:^(id json) {
        
        ICLog(@"%@",json);
        
        if (jsonMsg(json))
        
        {
            
            [MBProgressHUD showSuccess:@"已发送,请注意查收"];
            button.enabled = NO;
            [button setTitleColor:cIndentifyCode forState:UIControlStateDisabled];
            button.layer.borderColor = cIndentifyCode.CGColor;
            [button startWithSecond:60];
            
            [button didChange:^NSString *(CodeTimerButton *codeTimerButton, NSInteger second) {
                
                [self.activityIndicator stopAnimating];
                self.activityIndicator.hidden = YES;
                NSString *title = [NSString stringWithFormat:@"剩余%02ld秒",second];
                return title;
            }];


        }

    } failure:^(NSError *error) {
        netWorkError;
        kHideHUD;
    }];
    
    
    [button  didFinished:^NSString *(CodeTimerButton *codeTimerButton, NSInteger second) {
      button.enabled = YES;
       button.layer.borderColor = cHBColor.CGColor;
        return @"获取验证码";
    }];

  
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.view endEditing:YES];
    return YES;
}

@end


