//
//  SSHeadlthJudgeController.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/3.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSHeadlthJudgeController.h"
#import "SSHealthJudgeTableCell.h"
#import "SSSubjectListController.h"


@interface SSHeadlthJudgeController ()

@property (nonatomic,copy)NSMutableArray *dataArray;

@end

@implementation SSHeadlthJudgeController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    [self.tableView registerClass:[SSHealthJudgeTableCell class] forCellReuseIdentifier:@"cell"];
    
}


#pragma mark --datasource delegate

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 135*kScreenHeightScale;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 133*kScreenHeightScale;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{

    UIImageView *view = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 135*kScreenHeight)];
    view.image = [UIImage imageNamed:healthJudge_banner];
    return view;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SSHealthJudgeTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
  
    cell.backgroundImageView.image = [UIImage imageNamed:self.dataArray[indexPath.row][@"bgName"]];
    cell.writtingImageView.image = [UIImage imageNamed:self.dataArray[indexPath.row][@"writeName"]];
    [cell.startButton setImage:[UIImage imageNamed:@"Assessment"] forState:UIControlStateNormal];
    [cell.startButton addTarget:self action:@selector(startButtonTaped:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}

#pragma mark --private

- (void)startButtonTaped:(UIButton *)sender{

   SSSubjectListController *vc = [[SSSubjectListController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSMutableArray *)dataArray{
    if (!_dataArray) {
        //_dataArray = [NSMutableArray arrayWithCapacity:0];
        NSArray *array = @[@{@"bgName":healthJudge_IQ,@"writeName":@"IQ-words"},@{@"bgName":healthJudge_sleep,@"writeName":@"sleep-words"},@{@"bgName":healthJudge_nutrition,@"writeName":@"Nutrition-words"},@{@"bgName":healthJudge_development,@"writeName":@""}];
        _dataArray = [NSMutableArray arrayWithArray:array];
    }
    return _dataArray;
}




@end
