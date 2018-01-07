//
//  AllHotGroupsViewController.m
//  ZhongTongErKe
//
//  Created by khj on 2017/7/8.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "AllHotGroupsViewController.h"
#import "SSHotGroupCell.h"
#import "HotGroup.h"
#import "RecoTopicListViewController.h"

@interface AllHotGroupsViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView *tableView;

@property (nonatomic ,strong) NSArray *hotGroupArray;


@end

@implementation AllHotGroupsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"热门群组";
    [self.view addSubview:self.tableView];
    //所有热门群组列表显示
    [self loadHotGroup];
    
}

-(void)loadHotGroup
{
    kshowMessage(@"数据加载中");
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    [HttpTool postWithURL:getHotqzForum params:params success:^(id json) {
        
              
        if (jsonMsg(json)) {
            
            self.hotGroupArray = [HotGroup mj_objectArrayWithKeyValuesArray:json[@"data"]];
            [self.tableView reloadData];
        }
        kHideHUDAll;
        
    } failure:^(NSError *error) {
        netWorkError;
        kHideHUDAll;
    }];
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;

}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
        SSHotGroupCell *cell = [SSHotGroupCell cellWithTableView:tableView];
        cell.hotGroupArray = self.hotGroupArray;
    __weak typeof (self) weakSelf = self;
    cell.selectGroupBlock = ^(KJVerticalButton *button)
    {
        
        RecoTopicListViewController *topicVC =    [RecoTopicListViewController new];
        topicVC.hotGroup = self.hotGroupArray[button.tag];
        
        [weakSelf.navigationController pushViewController:topicVC animated:YES];
        
    };

        return cell;

}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
  
    SSHotGroupCell *cell =  (SSHotGroupCell *)[self tableView:tableView cellForRowAtIndexPath:indexPath];
    return cell.bounds.size.height;
   
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-NavBar_Height-TabBar_Height) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
    }
    return _tableView;
}


@end
