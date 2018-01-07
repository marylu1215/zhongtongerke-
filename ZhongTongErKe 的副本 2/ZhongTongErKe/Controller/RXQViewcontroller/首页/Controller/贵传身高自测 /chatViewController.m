//
//  chatViewController.m
//  ZhongTongErKe
//
//  Created by 研发部 on 2017/9/20.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "chatViewController.h"
#import <RongIMKit/RongIMKit.h>
#import "UserTool.h"
#import <RongIMKit/RCIM.h>
@interface chatViewController ()<RCIMUserInfoDataSource>


@end
@implementation chatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    
//    [self getUserInfoWithUserId:@"134" completion:^(RCUserInfo *userInfo) {
//        userInfo.userId = @"134";
//        userInfo.name = @"789";
//    }];
    
    self.title = @"免费咨询";
    [[RCIM sharedRCIM] setUserInfoDataSource:self];
   
}
-(void)viewWillAppear:(BOOL)animated{
    self.tabBarController.tabBar.hidden = YES;
}
-(void)getUserInfoWithUserId:(NSString *)userId completion:(void (^)(RCUserInfo *))completion{
   //UserTool *user = [[UserTool alloc]init];
    //通知主线程刷新
//         NSLog(@"输出user的id:%@",[UserTool user].userid);
//   //NSString *str = [UserTool user].userid;
//    //int a = [str intValue];
//    RCUserInfo *user = [[RCUserInfo alloc]init];
//    user.userId =[UserTool user].userid;
//    
//    user.name = @"123";
//    
//   // UserTool *user = [UserTool user];
//    
//    user.portraitUri =@"http://jstx.xnetyy.com/logo.jpg";
    
//    NSUserDefaults *standarduser = [NSUserDefaults standardUserDefaults];
//    
//    NSString *str = [standarduser setObject:<#(nullable id)#> forKey:<#(nonnull NSString *)#>];
    
    NSLog(@"头像:%@",[UserTool user].head);
    NSString *portraitstr = [UserTool user].head;
    NSString *twostr = ImageBaseURL;
    NSString *laststr = [NSString stringWithFormat:@"%@%@",twostr,portraitstr];
    NSLog(@"输出laststr的值:%@",laststr);
    if ([userId isEqualToString:[UserTool user].userid]) {
    return completion([[RCUserInfo alloc] initWithUserId:userId name:@"当前登录用户的用户名" portrait:@"http://jstx.xnetyy.com/logo.jpg"]);
    }else{
        //根据存储联系人信息的模型，通过 userId 来取得对应的name和头像url，进行以下设置（此处因为项目接口尚未实现，所以就只能这样给大家说说，请见谅）
        return completion([[RCUserInfo alloc] initWithUserId:userId name:@"name" portrait:@"http://pic32.nipic.com/20130827/12906030_123121414000_2.png"]);
    }
}
@end
