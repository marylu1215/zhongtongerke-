//
//  SSAddBankCardController.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/25.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSAddBankCardController.h"
#import "UIBarButtonItem+Common.h"
#import "SSAddBankCardCell.h"

static NSString *cellIdentifier = @"cell";

@interface SSAddBankCardController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *tableView;

@end

@implementation SSAddBankCardController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"请添加银行卡";
 
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImage:@"add-card" hightImage:nil selectImage:nil target:self action:@selector(addAction)];
    
    [self.view addSubview:self.tableView];
    self.view.backgroundColor = BACKGROUND_COLOR;
}

-(void)addAction
{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark --delegate datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SSAddBankCardCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    cell.headImageView.image = [UIImage imageNamed:@"1"];
    cell.bankLabel.text = @"招商银行";
    cell.lastNumberLabel.text = @"尾号7814储蓄卡";
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 61*kScreenHeightScale;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 7*kScreenHeightScale;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 7*kScreenHeightScale)];
    view.backgroundColor = BACKGROUND_COLOR;
    return view;
}




- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 129*kScreenHeightScale) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[SSAddBankCardCell class] forCellReuseIdentifier:cellIdentifier];
    }
    return _tableView;
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
