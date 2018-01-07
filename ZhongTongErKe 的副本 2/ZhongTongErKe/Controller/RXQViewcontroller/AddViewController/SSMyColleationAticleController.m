//
//  SSMyColleationAticleController.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/29.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSMyColleationAticleController.h"
#import "SSMyColletionAticleCell.h"
#import "SSMyCollectionVideoCell.h"

static NSString *cellIdentifier = @"cell";
static NSString *cellIdentifierTwo = @"cellTwo";

@interface SSMyColleationAticleController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView *tableView;

@end

@implementation SSMyColleationAticleController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.tableView];
    self.title = @"我的收藏";
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark --tableview datasource delegate


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 2) {
        SSMyCollectionVideoCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifierTwo];
        cell.headImageView.image = [UIImage imageNamed:@"第五人民医院"];
        cell.headLabel.text = @"火到不行的共享单车，这样骑车可以高效哦！";
        cell.checkImageView.image = [UIImage imageNamed:@"eye-icon"];
        cell.checkLabel.text = @"75人查看";
        cell.colletionImageView.image = [UIImage imageNamed:@"Collection"];
        cell.collectionLabel.text = @"30人收藏";
        return cell;
    }
    SSMyColletionAticleCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    cell.headImageView.image = [UIImage imageNamed:@"第五人民医院"];
    cell.headLabel.text = @"火到不行的共享单车，这样骑车可以高效哦！";
    cell.tagLabel.text = @"运动";
    cell.checkImageView.image = [UIImage imageNamed:@"eye-icon"];
    cell.checkLabel.text = @"75人查看";
    cell.colletionImageView.image = [UIImage imageNamed:@"Collection"];
    cell.collectionLabel.text = @"30人收藏";
    cell.clockImageView.image = [UIImage imageNamed:@"time"];
    cell.clockLabel.text = @"30分钟前更新";
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 93*kScreenHeightScale;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.1;
}

#pragma mark --lazyload


- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[SSMyColletionAticleCell class] forCellReuseIdentifier:cellIdentifier];
        [_tableView registerClass:[SSMyCollectionVideoCell class] forCellReuseIdentifier:cellIdentifierTwo];
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
