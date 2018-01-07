//
//  SSHelpAndFeedbackController.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/29.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSHelpAndFeedbackController.h"
#import "SSHelpAndFeedbackCell.h"
#import "SSFeedbackInforController.h"
static NSString *cellIdentifier = @"cell";

@interface SSHelpAndFeedbackController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,copy)NSMutableArray *dataArray;

@end

@implementation SSHelpAndFeedbackController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"帮助与反馈";
    [self.view addSubview:self.tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark --uitableview datasource delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    SSHelpAndFeedbackCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    cell.headImageView.image = [UIImage imageNamed:self.dataArray[indexPath.row][0]];
    cell.headLabel.text = self.dataArray[indexPath.row][1];
    cell.arrowImageView.image = [UIImage imageNamed:@"go"];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 41*kScreenHeightScale;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.1;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 1) {
        SSFeedbackInforController *vc = [[SSFeedbackInforController alloc]init];
        [self.navigationController pushViewController:vc
                                             animated:YES];
    }
}

#pragma mark --lazyload
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[SSHelpAndFeedbackCell class] forCellReuseIdentifier:cellIdentifier];
    }
    return _tableView;
}
- (NSMutableArray *)dataArray{
    if (!_dataArray) {
        NSArray *array = @[@[@"loadrunner-icon",@"帮助手册"],@[@"Feedback-icon",@"反馈信息"]];
        _dataArray = [NSMutableArray arrayWithArray:array];
    }
    return _dataArray;
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
