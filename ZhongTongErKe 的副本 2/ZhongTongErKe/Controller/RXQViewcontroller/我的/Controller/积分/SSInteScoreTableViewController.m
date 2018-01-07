//
//  SSInteScoreTableViewController.m
//  ZhongTongErKe
//
//  Created by khj on 2017/5/28.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSInteScoreTableViewController.h"
#import "SSInteScoreTableViewCell.h"
#import "SSInteScoreView.h"
#import "Integral.h"
#import "IntegralRecord.h"
#import "UserTool.h"
#import "TradeRecordButton.h"
#import "XFDatePickerView.h"
#import "JF_CalendarTools.h"

@interface SSInteScoreTableViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic ,strong) NSMutableArray *integralMuArr;
@property (nonatomic, assign) NSInteger pageNum;
@property (nonatomic, strong) NSMutableDictionary *params;
@property (nonatomic ,strong) UITableView *tableView;
@property (nonatomic ,strong) TradeRecordButton *recordButton;

@end

@implementation SSInteScoreTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"积分记录";
    [self.view addSubview:self.tableView];
    // 添加刷新控件
    [self setUpRefresh];

    [self setTableViewHeaderView];
    
}

-(void)setTableViewHeaderView
{
    
  self.recordButton  = [[ TradeRecordButton alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, px(150))];

    [self.recordButton addTarget:self action:@selector(selectMonth:) forControlEvents:UIControlEventTouchUpInside];
    self.tableView.tableHeaderView =  self.recordButton;
}

-(void)selectMonth:(TradeRecordButton *)button
{
    [self chooseTime:button];
    
}
//封装控件
-(void)chooseTime:(TradeRecordButton *)button{
    
    NSString *currentStr = [NSString stringWithFormat:@"%@%@",button.yearLabel.text,button.monthLabel.text];
    currentStr = [NSString YMcurrentTime:currentStr];
    
    
    XFDatePickerView *datePickerView = [[XFDatePickerView alloc]initWithCurrentDate: currentStr destinateYear:[JF_CalendarTools getYear] datePickerType:(XFDatePickerTypeYM)];
    datePickerView.delegate = self;
    [datePickerView showInView:nil];
}
//选择日期代理
-(void)sureChooseDate:(XFDatePickerView *)datePicker chooseDateFormatterStr:(NSString *)dateFormatterStr TimeInterval:(NSString *)timeStr{
    
    
  self.recordButton.yearLabel.text =  [[dateFormatterStr componentsSeparatedByString:@"-"]firstObject];
  self.recordButton.monthLabel.text =  [[dateFormatterStr componentsSeparatedByString:@"-"]lastObject];
    // 开始刷新
    [self.tableView.mj_header beginRefreshing];
}

- (void)setUpRefresh
{
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadJifenRecord)];
    
    // 自动改变透明度
    self.tableView.mj_header.automaticallyChangeAlpha = YES;
    // 开始刷新
    [self.tableView.mj_header beginRefreshing];
    
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreJifenRecord)];
    self.tableView.mj_footer.automaticallyChangeAlpha = YES;
}


-(void)loadJifenRecord
{
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    self.pageNum = 1;
    params[@"p"] = @(self.pageNum);
    params[@"userid"] = [UserTool user].userid;
    params[@"day"] = [NSString stringWithFormat:@"%@-%@",  self.recordButton.yearLabel.text,self.recordButton.monthLabel.text];
    self.params = params;
    
    [MBProgressHUD showMessage:@"数据加载中..."];
    
    [HttpTool postWithURL:getJifenRecordUrl params:params success:^(id json) {
        ICLog(@"json menu:%@",json);
        if (self.params != params) return;
        
        if (jsonMsg(json)) {
            
        [self.integralMuArr removeAllObjects];
          if ([json[@"data"] isKindOfClass:[NSDictionary class]])
          {
          NSDictionary *integralDic = json[@"data"];
          
          NSArray *allIntegralArray = integralDic.allKeys;
          
          
          for (int index=0; index<allIntegralArray.count; index++) {
              
              NSArray *sectionIntegralArray = integralDic[allIntegralArray[index]];
              
              
              [self.integralMuArr addObject: [Integral mj_objectArrayWithKeyValuesArray:sectionIntegralArray]];
          }
 
          }
            
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



- (void)loadMoreJifenRecord
{
    
    [self.tableView.mj_header endRefreshing];
    NSInteger page = self.pageNum + 1;
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    params[@"p"] = @(page);
    params[@"userid"] = [UserTool user].userid;
    params[@"day"] = [NSString stringWithFormat:@"%@-%@",  self.recordButton.yearLabel.text,self.recordButton.monthLabel.text];

    self.params = params;
    
    [HttpTool postWithURL:getJifenRecordUrl  params:params success:^(id json) {
        ICLog(@"json menu:%@",json);
        if (self.params != params) return;
        
        if (jsonMsg(json)) {
           
    if ([json[@"data"] isKindOfClass:[NSDictionary class]]) {
        
         NSDictionary *integralDic = json[@"data"];
        NSArray *allIntegralArray = integralDic.allKeys;
        
        
        for (int index=0; index<allIntegralArray.count; index++) {
            
            NSArray *sectionIntegralArray = integralDic[allIntegralArray[index]];
            
            
            [self.integralMuArr addObject: [Integral mj_objectArrayWithKeyValuesArray:sectionIntegralArray]];
        }

            }
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
    
    if (self.integralMuArr.count <= 0) {
        self.tableView.mj_footer.hidden = YES;
    }
    
}



#pragma mark --datasource delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return self.integralMuArr.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    NSArray *sectionArray = self.integralMuArr[section];
    
    return sectionArray.count;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
 
    SSInteScoreTableViewCell *SSInteCell = [SSInteScoreTableViewCell cellWithTableView:tableView];
    NSArray *sectionArray = self.integralMuArr[indexPath.section];
    SSInteCell.integral = sectionArray[indexPath.row];
    
    return SSInteCell;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return px(72);
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return px(60);
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    SSInteScoreView  *scoreView = [[SSInteScoreView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, px(30))];
    NSArray *sectionArray = self.integralMuArr[section];
    
    Integral *integral = sectionArray[0];
    scoreView.integral = integral;
    return scoreView;

}

-(NSMutableArray *)integralMuArr
{
    if (!_integralMuArr) {
        
        _integralMuArr = [NSMutableArray new];
    }
    
    return _integralMuArr;
}

- (UITableView *)tableView{
    if (_tableView) return _tableView;
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth ,kScreenHeight-NavBar_Height-TabBar_Height) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor=[UIColor colorWithHexString:@"e9e9e9"];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    return _tableView;
}


@end
