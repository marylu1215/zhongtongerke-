//
//  SSAccountController.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/24.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSAccountController.h"
#import "SSCouponViewController.h"
#import "SSAccountHeader.h"
#import "SSMineCell.h"
#import "SSWithdrawCashController.h"
#import "SSRealWithdrawCashController.h"

static NSString* cellIdentifier = @"cell";

@interface SSAccountController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,copy)NSMutableArray *dataArray;

@end

@implementation SSAccountController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   
    [self.view addSubview:self.tableView];
    SSAccountHeader *header = [[SSAccountHeader alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth,px(426)*kScreenHeightScale)];
    __weak typeof (self) weakSelf = self;
    header.backAction = ^
    {
        [weakSelf.navigationController popViewControllerAnimated:YES];
    };
    header.headLabel.text = @"账户余额（元）";
    header.contentLabel.text = self.accountStr;
    self.tableView.tableHeaderView = header;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 2;
    }else if(section == 1){
        return 1;
    }else{
        return 0;
    }
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SSMineCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    cell.headImageView.image = [UIImage imageNamed:self.dataArray[indexPath.section][indexPath.row][0]];
    cell.headLabel.text = self.dataArray[indexPath.section][indexPath.row][1];
    cell.arrowImageView.image = [UIImage imageNamed:@"go"];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 41*kScreenHeightScale;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 6*kScreenHeightScale;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.1;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0 && indexPath.row == 0) {
        SSWithdrawCashController *vc = [[SSWithdrawCashController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    if (indexPath.section == 0 && indexPath.row == 1) {
        SSRealWithdrawCashController *vc = [[SSRealWithdrawCashController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else
    {
        [self.navigationController pushViewController:[SSCouponViewController new] animated:YES];
    }

}
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView= [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[SSMineCell class] forCellReuseIdentifier:cellIdentifier];
    }
    return _tableView;
}
- (NSMutableArray *)dataArray{
    if (!_dataArray) {
        NSArray *array = @[@[@[@"wd-healthrecord",@"充值"],@[@"discount-coupon",@"提现"]],@[@[@"withdraw-deposit",@"优惠券"]]];
        _dataArray = [NSMutableArray arrayWithArray:array];
    }
    return _dataArray;
}



@end
