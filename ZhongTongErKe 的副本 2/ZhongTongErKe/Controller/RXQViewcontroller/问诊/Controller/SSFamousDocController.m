//
//  SSFamousDocController.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/21.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSFamousDocController.h"
#import "SSDocInformationController.h"
#import "SSFamousConsultHeader.h"
#import "WorkTableViewCell.h"
#import "Evaluate.h"
#import "SSFamousConsultCell.h"
#import "Subject.h"
#import "SectionTitleView.h"
#import "PatientPraise.h"

@interface SSFamousDocController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView *tableView;

@property (nonatomic ,strong) NSMutableArray *commentMutableArr;
@property (nonatomic ,strong) NSArray  *adminiArray;
@property (nonatomic, assign) NSInteger pageNum;
@property (nonatomic, strong) NSMutableDictionary *params;


@end

@implementation SSFamousDocController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *view = [[UIView alloc]initWithFrame:CGRectZero];
    [self.view addSubview:view];
    [self.view addSubview:self.tableView];
    
    SSFamousConsultHeader *headerView = [[SSFamousConsultHeader alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, px(608))];
    self.tableView.tableHeaderView = headerView;
    __weak typeof (self)weakSelf = self;
    headerView.backBlock = ^()
    {
        [weakSelf.navigationController popViewControllerAnimated:YES];
    };
   
}

-(void)loadData
{
    [super loadData];
 
    [self loadPartyDepartment];
    
     [self setUpRefresh];
    
}
-(void)loadPartyDepartment
{
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

- (void)setUpRefresh
{
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadAllComment)];
    
    // 自动改变透明度
    self.tableView.mj_header.automaticallyChangeAlpha = YES;
    // 开始刷新
    [self.tableView.mj_header beginRefreshing];
    
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreComment)];
    self.tableView.mj_footer.automaticallyChangeAlpha = YES;
}


-(void)loadAllComment
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    self.pageNum = 1;
    params[@"p"] = @(self.pageNum);
    params[@"type"] = @"2";
    self.params = params;
    
    [MBProgressHUD showMessage:@"数据加载中..."];
    
    [HttpTool postWithURL:getPraiseParty params:params success:^(id json) {
        ICLog(@"json menu:%@",json);
        if (self.params != params) return;
        
        if (jsonMsg(json)) {
            
            // 转模型
            [self.commentMutableArr removeAllObjects];
            
            NSArray *tempArr = [PatientPraise mj_objectArrayWithKeyValuesArray:json[@"data"]];
            [self.commentMutableArr addObjectsFromArray:tempArr];
            [self.tableView reloadData];
        }
        else
        {
            [MBProgressHUD showError:json[@"msg"]];
            
        }
        // 结束刷新
        [self.tableView.mj_header endRefreshing];
        kHideHUDAll;
    } failure:^(NSError *error) {
        if (self.params != params) return;
        
        [self.tableView.mj_header endRefreshing];
        netWorkError;
        kHideHUDAll;
    }];
    
}



- (void)loadMoreComment
{
    
    [self.tableView.mj_header endRefreshing];
    NSInteger page = self.pageNum + 1;
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"p"] = @(self.pageNum);
    params[@"type"] = @"2";
    self.params = params;
    
    [HttpTool postWithURL:getPraiseParty params:params success:^(id json) {
        ICLog(@"json menu:%@",json);
        if (self.params != params) return;
        
        if (jsonMsg(json)) {
            // 转模型
            // 转模型
            NSArray *tempArr = [PatientPraise mj_objectArrayWithKeyValuesArray:json[@"data"]];
            [self.commentMutableArr addObjectsFromArray:tempArr];
            
            // 刷新表格
            [self.tableView reloadData];
            self.pageNum = page;
            
            // 监测footer状态
            [self checkFooterStatus];
            // 结束刷新
            [self.tableView.mj_footer endRefreshing];
        }
        else
        {
            [self.tableView.mj_footer endRefreshingWithNoMoreData];
        }
        
        kHideHUDAll;
    } failure:^(NSError *error) {
        if (self.params != params) return;
        
        // 结束刷新
        [self.tableView.mj_footer endRefreshing];
        netWorkError;
        kHideHUDAll;
    }];
}
- (void)checkFooterStatus
{
    
    if (self.commentMutableArr.count <= 0) {
        self.tableView.mj_footer.hidden = YES;
    }
}

#pragma mark -- datasource delegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
        return 1;
    }
    else
    {
        return self.commentMutableArr.count;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  
  
    if (indexPath.section==0) {
        //测试语音急诊
        WorkTableViewCell *cell = [WorkTableViewCell cellWithTableView:tableView];
        cell.adminArray = self.adminiArray;
        __weak typeof (self) weakSelf = self;
        cell.selectBlock = ^(TitleButton *titleButton)
        {
            
            SSDocInformationController *inforVC = [[SSDocInformationController alloc]init];
            
            inforVC.administrative = self.adminiArray[titleButton.tag];
            
            [weakSelf.navigationController pushViewController:inforVC animated:YES];
  
        };
        return cell;
    }
    
    else
    {
        //缓者好评
        
        SSFamousConsultCell *cell = [SSFamousConsultCell cellWithTableView:tableView];
       // cell.backgroundColor = [UIColor redColor];
      cell.patientPraise =  self.commentMutableArr[indexPath.row];
        return cell;

    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        
        WorkTableViewCell *cell =  (WorkTableViewCell *)[self tableView:tableView cellForRowAtIndexPath:indexPath];
        return cell.bounds.size.height;
    }
   
    else
    {
        SSFamousConsultCell *cell = (SSFamousConsultCell *)[self tableView:tableView cellForRowAtIndexPath:indexPath];
        return cell.bounds.size.height;

    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return px(40);
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    if (section==1) {
         return px(80);
    }
   else
   {
       return CGFLOAT_MIN;
   }
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    if (section==1) {
        SectionTitleView *headerView = [[SectionTitleView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, px(80)) title:@"用户评价"];
        
        return headerView;
    }
    else
    {
        return nil;
    }
    
}

-(NSMutableArray *)commentMutableArr
{
    if (!_commentMutableArr) {
        
        _commentMutableArr = [NSMutableArray new];
    }
    return _commentMutableArr;
}
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}

@end
