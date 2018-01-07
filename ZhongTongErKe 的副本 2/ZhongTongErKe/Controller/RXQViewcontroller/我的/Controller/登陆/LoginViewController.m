//
//  LoginViewController.m
//  ZhongTongErKe
//
//  Created by khj on 2017/6/7.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "LoginViewController.h"
 #import "InPutView.h"
#import "LandView.h"
#import "BottomUIView.h"
#import "ThirdLandViw.h"
#import "RegisterViewController.h"
#import "User.h"
#import "UserTool.h"
#import "ForgetPwdViewController.h"
#import "LoginHeadView.h"
#import <UMSocialCore/UMSocialCore.h>
#import <RongIMKit/RongIMKit.h>
#import "NSObject+Netwoking.h"
#import <RongIMLib/RongIMLib.h>
#import "AppDelegate.h"
@interface LoginViewController ()<RCIMConnectionStatusDelegate,UIApplicationDelegate>

@property (nonatomic ,strong)   InPutView *pwdInPutView;
@property (nonatomic ,strong)   InPutView *nameInPutView;
@property (nonatomic, assign) BOOL isShowMsg;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:loginBottomImageName]];
    
    [self prepareUI];
    
    
    
}

-(void)prepareUI
{
   
    UIButton *backBtn = [UIButton addBtnImage:index_backImageName WithTarget:self action:@selector(backAction)];
    backBtn.imageEdgeInsets =UIEdgeInsetsMake(15, 10, 15, 10);
    [self.view addSubview:backBtn];
    backBtn.sd_layout.widthIs(backBtn.imageView.image.size.width+20).heightIs(backBtn.imageView.image.size.height+30).leftSpaceToView(self.view,0).topSpaceToView(self.view,0);
 
    LoginHeadView *headView = [[LoginHeadView alloc]init];
    [self.view addSubview:headView];
    
    headView.frame =CGRectMake(0, px(134), kScreenWidth, headView.bounds.size.height);
    
    
    self.nameInPutView = [[InPutView alloc]initWithFrame:CGRectMake(0, (CGRectGetMaxY(headView.frame)+px(166))*kScreenHeightScale, kScreenWidth, px(40)) headImageStr:loginUsermageName placeHolder:@"输入用户名/手机号"];
      self.nameInPutView.inputTextField.tag = 200;
    [self.view addSubview: self.nameInPutView];
    
   self.pwdInPutView = [[InPutView alloc]initWithFrame:CGRectMake(0, (CGRectGetMaxY( self.nameInPutView.frame)+px(84)), kScreenWidth, px(40)) headImageStr:pwdIconImageName placeHolder:@"输入密码"];
    self.pwdInPutView  .inputTextField.tag = 200+1;
    self.pwdInPutView.inputTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
   self.pwdInPutView.inputTextField.keyboardType = UIKeyboardTypeASCIICapable;
    self.pwdInPutView.inputTextField.secureTextEntry = YES;
    [self.view addSubview:self.pwdInPutView ];
    
    LandView *landView = [[LandView alloc]initWithFrame:CGRectMake(0, (CGRectGetMaxY(self.pwdInPutView .frame)+px(76)), kScreenWidth, px(114)*kScreenHeightScale) landBtnTitle:@"立即登录" account:@"还没有账号?" registerStr:@"立即注册" forgetPwd:@"忘记密码"];
    __weak typeof (self) weakSelf = self;
    landView.landBlock = ^()
    {
        [weakSelf  cancelKeyboard];
        [weakSelf  validateStrIsTure];
    };
    
    landView.registerBlock = ^()
    {
          RegisterViewController *registVC = [[RegisterViewController alloc] init];
        // 注册成功的回调
        registVC.registerSucessBlock = ^(NSString *tel,NSString *pwd,BOOL isShowMsg){
            self.nameInPutView.inputTextField.text= tel;
            self.pwdInPutView.inputTextField.text = pwd;
            self.isShowMsg = isShowMsg;
            [self sendLoginRequest];
        };

         [weakSelf.navigationController pushViewController:registVC animated:YES];
    };
    
    landView.forgetBlock = ^()
    {
        [weakSelf.navigationController pushViewController:[ForgetPwdViewController new] animated:YES];
        
    };
    [self.view addSubview:landView];
    
    BottomUIView *bottomView = [[BottomUIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(landView.frame)+px(120), kScreenWidth, px(30))];
    [self.view addSubview:bottomView];
    
    
    
    ThirdLandViw *thirdlandView = [[ThirdLandViw alloc]initWithFrame:CGRectMake(px(205)*kScreenWidthScale, CGRectGetMaxY(bottomView.frame)+px(40), kScreenWidth-2*px(205)*kScreenWidthScale, px(84)) WithIconArr:@[wechatImageName,QQImageName]];
    
    thirdlandView.clickBtnBlock = ^(UIButton *btn)
    {
        switch (btn.tag) {
            case 0:
                
            [weakSelf getUserInfoForPlatform:UMSocialPlatformType_WechatSession];
                
                break;
            case 1:
                [weakSelf getUserInfoForPlatform:UMSocialPlatformType_QQ];

                break;
//            case 2:
//                [weakSelf getUserInfoForPlatform: UMSocialPlatformType_Sina];
//                break;
                
            default:
                break;
        }
    };
    
    
    [self.view addSubview:thirdlandView];
    
}
-(void)onRCIMConnectionStatusChanged:(RCConnectionStatus)status{
   
    if (status ==ConnectionStatus_KICKED_OFFLINE_BY_OTHER_CLIENT) {
        
        
        
        UIAlertView *alert = [[UIAlertView alloc]
                              
                              initWithTitle:@"提示"
                              
                              message:@"您"
                              
                              @"的帐号在别的设备上登录，您被迫下线！"
                              
                              delegate:nil
                              
                              cancelButtonTitle:@"知道了"
                              
                              otherButtonTitles:nil, nil];
        
        [alert show];
    }
    
    
    
}
- (void)getUserInfoForPlatform:(UMSocialPlatformType)platformType
{
    if (![[UMSocialManager defaultManager] isInstall:platformType])
    {
        [MBProgressHUD showError:@"授权失败.."];
    }
    else
    {
        [[UMSocialManager defaultManager] getUserInfoWithPlatform:platformType currentViewController:self completion:^(id result, NSError *error) {
            
            UMSocialUserInfoResponse *resp = result;
            if (error) {
                
            }
            else
            {
                
                NSMutableDictionary *params = [NSMutableDictionary dictionary];
                params[@"openid"] = resp.openid;
                params[@"name"] = resp.name;
                params[@"img"] = resp.iconurl;
                params[@"uid"] = resp.uid;
                params[@"sex"] = resp.unionGender;
                [MBProgressHUD showMessage:@"登录中..."];
                
                [HttpTool postWithURL:getPartyweixinUrl params:params success:^(id json) {
                    
                    ICLog(@"json menu:%@",json);
                    
                    User *user = [User mj_objectWithKeyValues:json[@"data"]];
                    
                    [UserTool saveUserInfo:user];
                    [self.navigationController popToRootViewControllerAnimated:YES];
                    
                    kHideHUDAll;
                } failure:^(NSError *error) {
                    
                    netWorkError;
                    kHideHUDAll;
                }];
                
                
            }
            
        }];

    }
    
}

-(void)backAction
{
    if (self.backUserBlock) {
        
        self.backUserBlock ([UserTool user]);
    }
    [self.navigationController popViewControllerAnimated:YES];
}
/**
 *  隐藏键盘
 */
- (void)cancelKeyboard
{
    [self.view endEditing:YES];
}
#pragma mark - 判断输入的格式是否正确
- (void)validateStrIsTure
{
    
    if (self.nameInPutView.inputTextField.text.length == 0) {
        
        [MBProgressHUD showError:@"请输入手机号码"];
        return;
    }
    // 判断输入的手机号
    if (self.nameInPutView.inputTextField.text.length < 11 || ![NSString validateMobile:self.nameInPutView.inputTextField.text]) {
        [MBProgressHUD showError:@"请输入正确的手机号码"];
        return;
    }
    
    // 判断输入的密码 6-20位
    NSString *pwdStr = self.pwdInPutView.inputTextField.text;
    
    // 去掉字符串的空格
    pwdStr = [pwdStr stringByReplacingOccurrencesOfString:@" " withString:@""];
   self.pwdInPutView.inputTextField.text = pwdStr;
    
    if(self.pwdInPutView.inputTextField.text.length ==0 ){
        [MBProgressHUD showError:@"请输入密码"];
        return;
    }
    if (!(pwdStr.length >=6 && pwdStr.length <=20)) {
        [MBProgressHUD showError:@"密码长度必须在6-20位"];
        return;
    }
    
    // 发送登录请求
    [self sendLoginRequest];
    
}

#pragma mark - 登录请求
- (void)sendLoginRequest
{
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"username"] = self.nameInPutView.inputTextField.text;
    params[@"password"] = self.pwdInPutView.inputTextField.text;
    
    self.isShowMsg ? [MBProgressHUD showMessage:@"登录中..."] : @"";
    
    
    [HttpTool postWithURL:loginUrl params:params success:^(id json) {
        
            ICLog(@"json menu:%@",json);
        
        if ([json[@"msg"] isEqualToString:@"ok"]) {
            
            NSString *accToken = json[@"data"][@"accToken"];
            
            User *user = [User mj_objectWithKeyValues:json[@"data"]];
            
            user.pwd = self.pwdInPutView.inputTextField.text;
            [UserTool saveUserInfo:user];
            
     //根据用户id获取token
            NSString *str = [UserTool user].userid;
            //NSString *pingstr = [NSString stringWithFormat:@"UserId=%@",str];
            NSString *urlstring = @"http://jstx.xnetyy.com/API/TokenApi.php?Action=Token&UserId=1";
            NSMutableDictionary *params = [NSMutableDictionary dictionary];
            params[@"UserId"]=str;
            [NSObject POST:urlstring parameters:params progress:^(NSProgress *downloadProgress) {
                
            } completionHandler:^(id responseObj, NSError *error) {
                NSLog(@"获取token:%@",responseObj);
                NSLog(@"获取token错误:%@",error);
                if ([responseObj[@"code"]integerValue]==200) {
                   //获取token成功
                    NSString *tokenstr = responseObj[@"token"];
                    NSUserDefaults *standard = [NSUserDefaults standardUserDefaults];
                    [standard setObject:tokenstr forKey:@"Rtoken"];
                    [standard synchronize];
                    
                    [[RCIMClient sharedRCIMClient]setDeviceToken:tokenstr];
                    // 登录融云平台平台
                    [[RCIM sharedRCIM]connectWithToken:tokenstr success:^(NSString *userId) {
                        NSLog(@"登陆成功。当前登录的用户ID：%@", userId);
                        dispatch_async(dispatch_get_main_queue(), ^{
                            [MBProgressHUD showMessage:@"登录成功"];
                            //所有执行UI更新的界面都必须放在主线程，block是在子线程中进行的
                            [self loginToHomeVCWithAccToken:accToken];
                        });
                        } error:^(RCConnectErrorCode status) {
                        NSLog(@"登陆的错误码为:%ld", (long)status);
                        
                    } tokenIncorrect:^{
                        //token过期或者不正确。
                        //如果设置了token有效期并且token过期，请重新请求您的服务器获取新的token
                        //如果没有设置token有效期却提示token错误，请检查您客户端和服务器的appkey是否匹配，还有检查您获取token的流程。
                        NSLog(@"token错误");
                        
                    }];
                }else{
                    //[MBProgressHUD showError:<#(NSString *)#>];
                    
                }
            }];
            
            
            
                       
        }
        
        else
        {
            kHideHUDAll;
            //显示返回的相应的状态信息
            
            
            [MBProgressHUD showError:json[@"msg"]];
            
        }

    } failure:^(NSError *error) {
        netWorkError;
        kHideHUD;
    }];
    
}

#pragma mark - 登录到主界面
- (void)loginToHomeVCWithAccToken:(NSString *)accToken
{
    
    if (self.backUserBlock) {
        
        self.backUserBlock([UserTool user]);
    }
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}



@end
