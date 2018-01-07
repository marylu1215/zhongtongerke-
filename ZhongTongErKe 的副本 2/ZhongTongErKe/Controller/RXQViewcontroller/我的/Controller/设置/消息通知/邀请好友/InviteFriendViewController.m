//
//  InviteFriendViewController.m
//  ZhongTongErKe
//
//  Created by khj on 2017/6/8.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "InviteFriendViewController.h"
#import "CodeView.h"

@interface InviteFriendViewController ()

@end

@implementation InviteFriendViewController

- (void)viewDidLoad {
  
    self.title = @"邀请好友";
    
    CodeView *codeView = [[CodeView alloc]initWithFrame:CGRectMake(0, px(200), kScreenWidth-2*px(150), px(200)) WithTitle:@"赶快让你的好朋友下载我们的APP把 时刻关注我们孩子的健康成长" tipStr:@"扫描后记得在浏览器中打开哦" codeImage:@"code"];
    [self.view addSubview:codeView ];
    codeView.centerX = self.view.centerX;
 
    self.view.backgroundColor = c255255255;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
