//
//  SSCouponViewController.m
//  ZhongTongErKe
//
//  Created by khj on 2017/5/27.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSCouponViewController.h"
#import "ChooseToolView.h"
#import "SSCouponTableViewCell.h"
#import "Scoupon.h"
@interface SSCouponViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSInteger _type;//0:未使用   1：使用记录  2：已过期
}
@property (nonatomic,strong) UITableView *tableView;
//@property (nonatomic,strong) NSDictionary *params;
//@property (nonatomic,assign) int pageNum;
//@property (nonatomic,strong) NSString *rollCount;
//@property (nonatomic, strong) NSMutableArray *arrayOfTasks;
@property (nonatomic, strong) NSMutableArray *exceptionTempMuArr;
@property (nonatomic ,strong) NSArray *scouponArray;


@end

@implementation SSCouponViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"优惠券";
    [self addChooseView];
    
    [self.view addSubview:self.tableView];
    
}

- (void)addChooseView{
    
    
    ChooseToolView *chooseView = [[ChooseToolView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 44) titles:@[@"未使用",@"使用记录",@"已过期"] borderColor:cMainLine chooseToolViewType:ChooseToolViewIndicator More:YES];
    chooseView.backgroundColor = c255255255;
    chooseView.titleColor = TITLE_COLOR;
    chooseView.selectedTitleColor = MAIN_COLOR;
    
     self.scouponArray = [Scoupon getAllScouponArray];
    
    
//    _type = 0;
//    self.pageNum = pageNumStart;
    
    __weak typeof(self)weakSelf = self;
    [chooseView didChooseAtIndex:^(NSInteger index) {
        _type = index;
//        [weakSelf.tableView.mj_header endRefreshing];
//        [weakSelf.tableView.mj_footer endRefreshing];
//        [weakSelf.tableView.mj_header beginRefreshing];
        
        [self.tableView reloadData];
        
    }];
    
    [self.view addSubview:chooseView];
}

#pragma mark - refresh
- (void)setUpRefresh{
    
//    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
//    self.tableView.mj_header.automaticallyChangeAlpha = YES;
//    
//    self.pageNum = pageNumStart;
//    
//    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
}

- (void)loadNewData{
//    self.pageNum = pageNumStart;
    
//    [self loadExceptionData];
}

- (void)loadMoreData{
//    self.pageNum++;
    
//    [self loadExceptionData];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.scouponArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SSCouponTableViewCell  *cell = [SSCouponTableViewCell cellWithTableView:tableView];
    Scoupon *scoupon= self.scouponArray[indexPath.row];
    cell.scoupon = scoupon;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return  px(170);
}

#pragma mark - lazy

- (UITableView *)tableView{
    if (_tableView) return _tableView;
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,px(98), kScreenWidth, kScreenHeight - 44 ) style:(UITableViewStyleGrouped)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = c255255255;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    return _tableView;
    
}
@end
