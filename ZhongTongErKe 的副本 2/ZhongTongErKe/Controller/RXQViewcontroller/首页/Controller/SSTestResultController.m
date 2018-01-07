//
//  SSTestResultController.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/4.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSTestResultController.h"
#import "SSTestResultViewOne.h"
#import "SSTextResultViewTwo.h"
#import "SSSubjectListController.h"
#import "Subject.h"
@interface SSTestResultController ()
@property (nonatomic ,weak)  SSTestResultViewOne *view1;

@end
@implementation SSTestResultController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    self.title = @"测试结果";
    
    SSTestResultViewOne *view1 = [[SSTestResultViewOne alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 250*kScreenHeightScale)];
    view1.backgroundColor = [UIColor whiteColor];
    view1.reportLabel.text = @"测评评估报告";
    [view1.againButton setImage:[UIImage imageNamed:testResult_againImageName] forState:UIControlStateNormal];
    [view1.againButton addTarget:self action:@selector(againButtonTaped:) forControlEvents:UIControlEventTouchUpInside];
    self.view1 = view1;
    
    SSTextResultViewTwo *view2 = [[SSTextResultViewTwo alloc]initWithFrame:CGRectMake(0, 250*kScreenHeightScale, kScreenWidth, 67*kScreenHeightScale)];
    view2.headImageView.image = [UIImage imageNamed:testResult_bgImageName];
    view2.headLabel.text = @"您还有更多疑问？";
    view2.tagLabel.text = @"咨询专业医生";
   
    [view2.onlineButton setImage:[UIImage imageNamed:testResult_onlineImageName] forState:UIControlStateNormal];
    [view2.onlineButton addTarget:self action:@selector(onlineButtonTaped:) forControlEvents:UIControlEventTouchUpInside];
    
    [view2.hotLineButton setImage:[UIImage imageNamed:testResult_proHotImageName] forState:UIControlStateNormal];
    [view2.hotLineButton addTarget:self action:@selector(phoneAction) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:view1];
    [self.view addSubview:view2];
    
    
    
    
    
}

-(void)loadData
{
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"id"] = self.assessment.cid;
    
    long score = 0;
    
    for (Subject *subject in self.subjectArray) {
        
        score += [subject.mark integerValue];
    }
    
    params[@"fenshu"] = [NSString stringWithFormat:@"%ld",score];
    [MBProgressHUD showMessage:@"数据加载中..."];
    
    [HttpTool postWithURL:getPingguHomePage params:params success:^(id json) {
        ICLog(@"json menu:%@",json);
        
        if (jsonMsg(json))
        {
            
            self.view1.contentLabel.text = json[@"data"];
            
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

#pragma mark --action

- (void)againButtonTaped:(UIButton *)sender{
    
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)onlineButtonTaped:(UIButton *)sender{
    
   
    
}

-(void)phoneAction
{
    NSString *path=[NSString stringWithFormat:@"tel://%@",@""];
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:path]];

}

@end
