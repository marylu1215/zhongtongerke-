//
//  SSVoiceQuestionController.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/18.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSVoiceQuestionController.h"
#import "SSVoiceQuestionView.h"
#import "UserTool.h"

@interface SSVoiceQuestionController ()

@property (nonatomic,strong) SSVoiceQuestionView *mainView;

@end

@implementation SSVoiceQuestionController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.title = @"问题详情";
    _mainView = [[SSVoiceQuestionView alloc]init];
    _mainView.doctor = self.doctor;
    _mainView.frame = CGRectMake(0, 0, kScreenWidth, _mainView.bounds.size.height);
    [self.view addSubview:self.mainView];
    
    [self creatBottomView];
    
}

-(void)creatBottomView
{
    UIButton *bottomBtn = [UIButton addBtnWithTitle:@"确认提问" WithBGImg:nil WithFont:Font13 WithTitleColor:c255255255 Target:self Action:@selector(submitAction)];
    bottomBtn.backgroundColor = cHBColor;
    [self.view addSubview:bottomBtn];
    bottomBtn.sd_layout.widthIs(kScreenWidth).heightIs(px(100)).bottomSpaceToView(self.view ,0);
}

-(void)submitAction
{
    
    if (!self.mainView.descView.descriptionTV.text.length) {
        
        [MBProgressHUD showError:@"请输入问题!"];
        return;
    }
    
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"userid"] = [UserTool user].userid;
     params[@"doctorid"] = self.doctor.cid;
     params[@"content"] = self.mainView.descView.descriptionTV.text;
    [MBProgressHUD showMessage:@"数据加载中..."];
    
    [HttpTool postWithURL:getVoiceParty params:params success:^(id json) {
        ICLog(@"json menu:%@",json);
        
        if (jsonMsg(json)) {
            
            [MBProgressHUD showSuccess:@"提交问题成功!"];
            [self.navigationController popToRootViewControllerAnimated:YES];
            
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

- (void)viewWillAppear:(BOOL)animated{
  
    self.tabBarController.tabBar.hidden = YES;
}
- (void)viewWillDisappear:(BOOL)animated{
  
    self.tabBarController.tabBar.hidden = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
