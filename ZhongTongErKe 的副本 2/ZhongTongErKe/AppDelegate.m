//
//  AppDelegate.m
//  ZhongTongErKe
//
//  Created by Claf on 17/4/28.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "AppDelegate.h"
#import "IQKeyboardManager.h"
#import "SwitchChooseTool.h"
//#import "RCDLoginViewController.h"
//#import "RCWKNotifier.h"
//#import "RCWKRequestHandler.h"
//#import "UIColor+RCColor.h"
#import "UIImageView+WebCache.h"
#import <AudioToolbox/AudioToolbox.h>
#import "LoginViewController.h"
#import "ICNavigationController.h"
#import "GuideView.h"
#import <UMSocialCore/UMSocialCore.h>
#import "SSTabBarController.h"
#import "WXApi.h"
// 引入JPush功能所需头文件
#import "JPUSHService.h"
#import "NSObject+Netwoking.h"
// iOS10注册APNs所需头文件
#ifdef NSFoundationVersionNumber_iOS_9_x_Max
#import <UserNotifications/UserNotifications.h>
#endif
// 如果需要使用idfa功能所需要引入的头文件（可选）
#import <AdSupport/AdSupport.h>
#import "EBForeNotification.h"
#define RONGCLOUD_IM_APPKEY @"n19jmcy59f1q9" //online key
//#define RONGCLOUD_IM_APPKEY @"c9kqb3rdkbb8j" // pre key
//#define RONGCLOUD_IM_APPKEY @"e0x9wycfx7flq" // offline key
#define kTencentAppId   @"1106292856"
#define kTencentAPPKey @"BRXUjdvZ06QQs1WR"
#define kWeixinAppId    @"wx15cb0ffdd0c23517"
#define kWeixinAppSecret @"e81686cbd978e581e8aca5d56dccc991"
#define RyunAppkey @"p5tvi9dspm5b4";
static BOOL isProduction = FALSE;
#import "ICMapHelper.h"
#import <RongIMKit/RongIMKit.h>
@interface AppDelegate ()<JPUSHRegisterDelegate,WXApiDelegate>
//b6kqgQRR9nxAVS3mNVZqyYCm7Bcnf+hKZgKfyHZhZ9MUpF+9STX6dHhSG7ZYe3Sof6WSor75dUI=
@end
@implementation AppDelegate
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    SSTabBarController *tbc = [[SSTabBarController alloc]init];
    //    tbc.delegate = self;
    self.window.rootViewController = tbc;
    [self.window makeKeyAndVisible];
    [[UINavigationBar appearance] setTranslucent:false];
    
    //初始化消息设置中的switch数组
    [SwitchChooseTool fristInitializeSwitch];
    
    /****************第三方初始化**************************/
    [self setUpIQKeyboard];
    
    // 注册极光推送
    [self registerJpushWithLaunchOptions:launchOptions];
    
    // 高德地图
    [ICMapHelper registerMapSDK];
    // 使用友盟
    [self useUMengSocialData];
    //** 微信注册 */
    [WXApi registerApp:kWeixinAppId];
   
    //融云
    [[RCIM sharedRCIM]initWithAppKey:@"p5tvi9dspm5b4"];
    
    // 引导页
    NSArray *array = @[@"guid1", @"guid2", @"guid3",@"guid4"];
    [GuideView showGudieView:array];
    
    
    NSUserDefaults *obr = [NSUserDefaults standardUserDefaults];
    NSString *tokenstr = [obr objectForKey:@"Rtoken"];
    NSLog(@"输出tokenstr:%@",tokenstr);
    [RCIM sharedRCIM];
    //从本地获取token
    
    NSString *token = [[NSUserDefaults standardUserDefaults] objectForKey:@"Rtoken"];
      //判断是否存在token连接融云
    if (token) {
        
        [[RCIM sharedRCIM] connectWithToken:token success:^(NSString *userId) {
            
            //                [[RCIM sharedRCIM] setUserInfoDataSource:self];
            
        } error:^(RCConnectErrorCode status) {
            
            NSLog(@"login error status: %ld.", (long)status);
        } tokenIncorrect:^{
            
            NSLog(@"token 无效 ，请确保生成token 使用的appkey 和初始化时的appkey 一致");
        }];
    }else{
        [MBProgressHUD showError:@"请重新登录"];
    }
    
    
    
    
    if ([application
         
         respondsToSelector:@selector(registerUserNotificationSettings:)]) {
        
        //注册推送, iOS 8
        
        UIUserNotificationSettings *settings = [UIUserNotificationSettings
                                                
                                                settingsForTypes:(UIUserNotificationTypeBadge |
                                                                  
                                                                  UIUserNotificationTypeSound |
                                                                  
                                                                  UIUserNotificationTypeAlert)
                                                
                                                categories:nil];
        
        [application registerUserNotificationSettings:settings];
        
    } else {
        
        UIRemoteNotificationType myTypes = UIRemoteNotificationTypeBadge |
        
        UIRemoteNotificationTypeAlert |
        
        UIRemoteNotificationTypeSound;
        
        [application registerForRemoteNotificationTypes:myTypes];
        
    }
    
    
    
    //融云即时通讯
    
    [[NSNotificationCenter defaultCenter]
     
     addObserver:self
     
     selector:@selector(didReceiveMessageNotification:)
     
     name:RCKitDispatchMessageNotification
     
     object:nil];
    
    [[RCIM sharedRCIM] setConnectionStatusDelegate:self];
    

    
    

    return YES;
}
-(void)onRCIMConnectionStatusChanged:(RCConnectionStatus)status{
    if (status == ConnectionStatus_KICKED_OFFLINE_BY_OTHER_CLIENT) {
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

-(void)application:(UIApplication *)application didRegisterUserNotificationSettings:(nonnull UIUserNotificationSettings *)notificationSettings{
    
   // NSString *token = @"";
    
    NSUserDefaults *obr = [NSUserDefaults standardUserDefaults];
    NSString *tokenstr = [obr objectForKey:@"Rtoken"];
    NSLog(@"输出tokenstr:%@",tokenstr);
    [[RCIMClient sharedRCIMClient]setDeviceToken:tokenstr];
    
    
    
}
- (void)didReceiveMessageNotification:(NSNotification *)notification {
    
    [UIApplication sharedApplication].applicationIconBadgeNumber =
    
    [UIApplication sharedApplication].applicationIconBadgeNumber + 1;
    
    NSLog(@"输出uiapplicationbadgeNumber:%ld",(long)[UIApplication sharedApplication].applicationIconBadgeNumber);
    
}



- (void)useUMengSocialData {
    
    /* 打开日志 */
    [[UMSocialManager defaultManager] openLog:YES];
 
    /* 设置友盟appkey */
    [[UMSocialManager defaultManager] setUmSocialAppkey:@"596d9eb045297d42ee000899"];
    
    [self configUSharePlatforms];
}
- (void)configUSharePlatforms
{
    /*
     设置微信的appKey和appSecret
     [微信平台从U-Share 4/5升级说明]http://dev.umeng.com/social/ios/%E8%BF%9B%E9%98%B6%E6%96%87%E6%A1%A3#1_1
     */
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_WechatSession appKey: kWeixinAppId  appSecret:kWeixinAppSecret redirectURL:nil];
    
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_QQ appKey:kTencentAppId /*设置QQ平台的appID*/  appSecret:nil redirectURL:nil];
    
    /*
     设置新浪的appKey和appSecret
     [新浪微博集成说明]http://dev.umeng.com/social/ios/%E8%BF%9B%E9%98%B6%E6%96%87%E6%A1%A3#1_2
     */
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_Sina appKey:@"3921700954"  appSecret:@"04b48b094faeb16683c32669824ebdad" redirectURL:@"https://sns.whalecloud.com/sina2/callback"];
}
//#define __IPHONE_10_0    100000
#if __IPHONE_OS_VERSION_MAX_ALLOWED > 100000
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey, id> *)options
{
    //6.3的新的API调用，是为了兼容国外平台(例如:新版facebookSDK,VK等)的调用[如果用6.2的api调用会没有回调],对国内平台没有影响。
    BOOL result = [[UMSocialManager defaultManager]  handleOpenURL:url options:options];
    if (!result) {
        NSString *urlStr = url.absoluteString;
        if ([urlStr hasPrefix:@"wx"]) {
            return [WXApi handleOpenURL:url delegate:self];
        }

    }
    return result;
}

//微信SDK自带的方法，处理从微信客户端完成操作后返回程序之后的回调方法,显示支付结果的
-(void) onResp:(BaseResp*)resp
{
    if ([resp isKindOfClass:[PayResp class]]){
        PayResp*response=(PayResp*)resp;
        NSLog(@"微信支付状态response.errCode：%d",response.errCode);
        switch (resp.errCode) {
                case WXSuccess:
            {
                NSNotification *notification = [NSNotification notificationWithName:@"wx_pay" object:@"success"];
                [[NSNotificationCenter defaultCenter] postNotification:notification];
                
            }
                break;
            default:
            {
                NSNotification *notification = [NSNotification notificationWithName:@"wx_pay" object:@"fail"];
                [[NSNotificationCenter defaultCenter] postNotification:notification];
            }
                break;
        }
    }}
#endif

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    //6.3的新的API调用，是为了兼容国外平台(例如:新版facebookSDK,VK等)的调用[如果用6.2的api调用会没有回调],对国内平台没有影响
    BOOL result = [[UMSocialManager defaultManager] handleOpenURL:url sourceApplication:sourceApplication annotation:annotation];
    if (!result) {
        NSString *urlStr = url.absoluteString;
        if ([urlStr hasPrefix:@"wx"]) {
            return [WXApi handleOpenURL:url delegate:self];
        }

    }
    return result;
}

//前面的两个方法被iOS9弃用了，如果是Xcode7.2网上的话会出现无法进入进入微信的onResp回调方法，就是这个原因。本来我是不想写着两个旧方法的，但是一看官方的demo上写的这两个，我就也写了。。。。

//9.0前的方法，为了适配低版本 保留
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    BOOL result = [[UMSocialManager defaultManager] handleOpenURL:url];
   
    if (!result) {
        
        NSString *urlStr = url.absoluteString;
        if ([urlStr hasPrefix:@"wx"]) {
            return [WXApi handleOpenURL:url delegate:self];
        }
    }
    return result;
}

#pragma mark - 极光推送
- (void)registerJpushWithLaunchOptions:(NSDictionary *)launchOptions
{
    if (isIOS10) {
        JPUSHRegisterEntity * entity = [[JPUSHRegisterEntity alloc] init];
        entity.types = UNAuthorizationOptionAlert|UNAuthorizationOptionBadge|UNAuthorizationOptionSound;
        [JPUSHService registerForRemoteNotificationConfig:entity delegate:self];
    }
    else if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0) {
        //可以添加自定义categories
        [JPUSHService registerForRemoteNotificationTypes:(UIUserNotificationTypeBadge |
                                                          UIUserNotificationTypeSound |
                                                          UIUserNotificationTypeAlert)
                                              categories:nil];
    }
    
    //Required
    [JPUSHService setupWithOption:launchOptions appKey:kJPUSHAppKey
                          channel:kChannel
                 apsForProduction:isProduction
            advertisingIdentifier:nil];
    //2.1.9版本新增获取registration id block接口。
    [JPUSHService registrationIDCompletionHandler:^(int resCode, NSString *registrationID) {
        if(resCode == 0){
         
            
        }
         else{
     
        }
    }];
    //    [JPUSHService clearAllLocalNotifications];
}

#pragma mark 注册推送通知之后
//在此接收设备令牌
- (void)application:(UIApplication *)application
didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    // 注册 DeviceToken
  
    [JPUSHService registerDeviceToken:deviceToken];
    
    NSUserDefaults *obr = [NSUserDefaults standardUserDefaults];
    NSString *tokenstr = [obr objectForKey:@"Rtoken"];
    NSLog(@"输出tokenstr:%@",tokenstr);
    [[RCIMClient sharedRCIMClient]setDeviceToken:tokenstr];

    
}
#pragma mark 获取device token失败后
- (void)application:(UIApplication *)application
didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    
}
#pragma mark 程序失去焦点的时候调用（不能跟用户进行交互了）
- (void)applicationWillResignActive:(UIApplication *)application {
    
}
#pragma mark 当应用程序进入后台的时候调用（点击HOME键）
- (void)applicationDidEnterBackground:(UIApplication *)application {
   
    //    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:0];
    //开启一个后台标示任务
    UIApplication*   app = [UIApplication sharedApplication];
    __block UIBackgroundTaskIdentifier bgTask;
    bgTask = [app beginBackgroundTaskWithExpirationHandler:^{
        dispatch_async(dispatch_get_main_queue(), ^{
            if (bgTask != UIBackgroundTaskInvalid)
            {
                //标示一个后台任务请求
                bgTask = UIBackgroundTaskInvalid;
            }
        });
    }];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            if (bgTask != UIBackgroundTaskInvalid)
            {
                bgTask = UIBackgroundTaskInvalid;
            }
        });
    });
}
#pragma mark 当应用程序进入前台的时候调用
- (void)applicationWillEnterForeground:(UIApplication *)application {
   
    if (application.applicationIconBadgeNumber > 0) {
        
        [application setApplicationIconBadgeNumber:0];
        [application cancelAllLocalNotifications];
    }
    
}
#pragma mark 当应用程序获取焦点的时候调用
- (void)applicationDidBecomeActive:(UIApplication *)application {
  
    
    if (application.applicationIconBadgeNumber>0) {  //badge number 不为0，说明程序有通知
                ICLog(@"badgeNumber:%ld",application.applicationIconBadgeNumber);
        //这里进行有关处理
        //        [self.tabBarVC addNotificationCount];
        //        [application setApplicationIconBadgeNumber:0];   //将图标清零。
    }
}
#pragma mark 程序在某些情况下被终结时会调用这个方法
- (void)applicationWillTerminate:(UIApplication *)application {
   }


#pragma mark- JPUSHRegisterDelegate

// iOS 10 Support
- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(NSInteger))completionHandler {
    // Required
    NSDictionary * userInfo = notification.request.content.userInfo;
    if([notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        [JPUSHService handleRemoteNotification:userInfo];
    }
    completionHandler(UNNotificationPresentationOptionAlert); // 需要执行这个方法，选择是否提醒用户，有Badge、Sound、Alert三种类型可以选择设置
}

// iOS 10 Support
- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)())completionHandler {
    // Required
    NSDictionary * userInfo = response.notification.request.content.userInfo;
    if([response.notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        [JPUSHService handleRemoteNotification:userInfo];
    }
    completionHandler();  // 系统要求执行这个方法
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
   
    // IOS 7 Support Required
    [JPUSHService handleRemoteNotification:userInfo];
 
    if (application.applicationState == UIApplicationStateActive && !isIOS10) {
        
        [EBForeNotification handleRemoteNotification:userInfo soundID:1312 isIos10:NO];
        // 发出通知
        [[NSNotificationCenter defaultCenter] postNotificationName:@"noti" object:nil userInfo:userInfo];
    }else if (application.applicationState == UIApplicationStateInactive)
    {
 
    }
    
    completionHandler(UIBackgroundFetchResultNewData);
    
}


- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    
//    // Required,For systems with less than or equal to iOS6
    [JPUSHService handleRemoteNotification:userInfo];
}

#pragma mark - IQKeyboardManager
- (void)setUpIQKeyboard
{
    IQKeyboardManager *keyboardManager = [IQKeyboardManager sharedManager];
    keyboardManager.enable = YES;//控制整个功能是否启用
    keyboardManager.shouldResignOnTouchOutside = YES;//控制点击背景是否收起键盘
}


@end
