//
//  SSTaskDetailController.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/4.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSTaskDetailController.h"
#import "SSTaskDetailView.h"
#import "SSHealthPlanController.h"
#import "SSPersonFileListController.h"

@interface SSTaskDetailController ()

@property (nonatomic,strong)SSTaskDetailView *myView;

@end

@implementation SSTaskDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.myView];
    // Do any additional setup after loading the view.
    
}


#pragma mark --private action

- (void)goToTaskButtonTaped:(UIButton *)sender{
    
    if ([self.healthTask.tag isEqualToString:@"签到"]) {
        
        [self.navigationController popToRootViewControllerAnimated:YES];
        
    }
    else
    {
        
        [self.navigationController pushViewController:[SSPersonFileListController new] animated:YES];
    }
}


- (SSTaskDetailView *)myView{
    if (!_myView) {
        _myView = [[SSTaskDetailView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
        _myView.bgImageView.image = [UIImage imageNamed:taskDetail_bg];
        __weak typeof (self) weakSelf = self;
        _myView.bgImageView.backBlock =^()
        {
            [weakSelf.navigationController popViewControllerAnimated:YES];
            
        };
        _myView.middleImageView.image = [UIImage imageNamed:taskDetail_midBox];
        _myView.midDataImageView.image = [UIImage imageNamed:healthTask_file];
        _myView.midPersonImageView.image = [UIImage imageNamed:taskDetail_midMan];
        _myView.midDataLabel.text = @"完善健康档案";
        _myView.midPeopleLabel.text = @"2568人已完成";
        _myView.taskTaget.text = @"任务mubiao";
        _myView.taskPecent.text = @"档案完成度30%";
        _myView.taskDescription.text = @"任务描述";
        _myView.taskDetail.text = @"小童对您还不够了解哦，为了能够给您提供更好的保健计划，提高准确性，请将健康档案进一步完善哦";
        _myView.taskPrice.text = @"任务奖励：30积分";
        [_myView.goToTaskButton setImage:[UIImage imageNamed:taskDetail_goTask] forState:UIControlStateNormal];
        [_myView.goToTaskButton addTarget:self action:@selector(goToTaskButtonTaped:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _myView;
}

@end
