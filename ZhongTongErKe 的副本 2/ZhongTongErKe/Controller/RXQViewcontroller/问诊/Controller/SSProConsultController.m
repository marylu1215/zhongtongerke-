//
//  SSProConsultController.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/12.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSProConsultController.h"
#import "SSProConsultCell.h"
#import "SSSearchDocController.h"
#import "Administrative.h"
#import "searchView.h"
#import "SSTableViewHeader.h"

@interface SSProConsultController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)  NSArray *adminiArray;
@property (nonatomic,strong) NSMutableArray *dataArray;
@property (nonatomic,strong) searchView *searchView;


@end

@implementation SSProConsultController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"专家咨询";
    
    [self.view addSubview:self.tableView];
    
    UIView *headerView = [[UIView alloc]init];
    headerView.backgroundColor = [UIColor colorWithHexString:@"f1f0f0"];
    headerView.sd_layout.widthIs(kScreenWidth).heightIs(px(90));
 
    _searchView = [[searchView alloc]initWithSearchBarEditDidChange:nil SearchBegin:nil];
    
    [headerView addSubview:_searchView];
    _searchView.sd_layout.heightIs(px(48)).leftSpaceToView(headerView,px(76)).rightSpaceToView(headerView,px(76)).centerYEqualToView(headerView);
    _searchView.placeholder = @"搜索医生、药、咨询";
    _searchView.searchBar.userInteractionEnabled = NO;
     [_searchView addGestureRecognizer:   [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(searchBtnClick)]];
    self.tableView.tableHeaderView = headerView;
    
}

-(void)searchBtnClick
{
    SSSearchDocController *searchVC = [[SSSearchDocController alloc]init];
    searchVC.adminiArray = self.adminiArray;
    [self.navigationController pushViewController:searchVC animated:YES];

}
-(void)loadData
{
    [super loadData];
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
   
    [MBProgressHUD showMessage:@"数据加载中..."];
    
    [HttpTool postWithURL:getPartyDepartment params:params success:^(id json) {
        ICLog(@"json menu:%@",json);
     
        if (jsonMsg(json)) {
            
        self.adminiArray = [Administrative mj_objectArrayWithKeyValuesArray:json[@"data"]];
            [self.tableView reloadData];
            
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
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 25*kScreenHeightScale;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    SSTableViewHeader *headerView = [[SSTableViewHeader alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 25*kScreenHeightScale)];
    headerView.backgroundColor = c255255255;
    
    headerView.imageView.image = [UIImage imageNamed:@"home-themeicon"];
    headerView.label.text = @"按科室找医生";
    return headerView;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    SSProConsultCell *consultCell = [SSProConsultCell cellWithTableView:tableView];
    consultCell.adminArray = self.adminiArray;
    __weak typeof (self) weakSelf = self;
    consultCell.selectBlock = ^(TitleButton *titleButton)
    {
        SSSearchDocController *searchVC = [[SSSearchDocController alloc]init];
        searchVC.admini = self.adminiArray[titleButton.tag];
        searchVC.adminiArray = weakSelf.adminiArray;
    [weakSelf.navigationController pushViewController:searchVC animated:YES];
    };
    
    
    return consultCell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

     SSProConsultCell *cell =  (SSProConsultCell *)[self tableView:tableView cellForRowAtIndexPath:indexPath];
    return cell.bounds.size.height;
}


- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-NavBar_Height) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}
@end
