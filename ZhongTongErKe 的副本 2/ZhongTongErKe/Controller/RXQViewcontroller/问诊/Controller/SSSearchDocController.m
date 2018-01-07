//
//  SSSearchDocController.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/12.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSSearchDocController.h"
#import "SSSearchDocCell.h"
#import "SSDocDetailController.h"
#import "ChooseTableToolView.h"
#import "SearchNoBtnBar.h"

@interface SSSearchDocController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;
//** 下拉选择框 */
@property (nonatomic, weak) ChooseTableToolView *chooseView;
@property (nonatomic ,strong) NSMutableArray *docotorMutableArray;
@property (nonatomic, assign) NSInteger pageNum;
@property (nonatomic, strong) NSMutableDictionary *params;
@property (nonatomic, strong) NSMutableArray *tableDataArrOfArr;


@end

@implementation SSSearchDocController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setTitleView];
     [self addChooseView];
    [self.view addSubview:self.tableView];
    [self setUpRefresh];
    [self loadAllAdmini];
}
- (void)viewWillAppear:(BOOL)animated{
  
    self.tabBarController.tabBar.hidden = YES;
}
- (void)viewWillDisappear:(BOOL)animated{
   
    self.tabBarController.tabBar.hidden = NO;
}

-(void)setTitleView
{
    
    __weak typeof (self) weakSelf = self;
    SearchNoBtnBar *search = [[SearchNoBtnBar alloc]initWithSearchBarEditDidChange:^(NSString *text) {
        //文字变化
        [weakSelf searchDoctorWithText:text];
    } SearchBegin:^(NSString *kWords) {
        //点击搜索
        [weakSelf searchDoctorWithText:kWords];
    }];
    
    search.placeholder = @"搜索医生、疾病、医院、科室";
    search.limitMaxStrLength = 20;
   search.sd_layout.heightIs(px(52)).widthIs(200);
   search.layer.cornerRadius = 6;
    self.navigationItem.titleView = search;
}

-(void)searchDoctorWithText:(NSString *)text
{
    kshowMessage(@"数据加载中");
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"name"] = text;
    
    [HttpTool postWithURL:searchDoctorParty params:params success:^(id json) {
        
               
        if (jsonMsg(json)) {
            
        }
        kHideHUDAll;
        
    } failure:^(NSError *error) {
        netWorkError;
        kHideHUDAll;
    }];

    
 
}
- (void)setUpRefresh
{
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadDocoList)];
    
    // 自动改变透明度
    self.tableView.mj_header.automaticallyChangeAlpha = YES;
    // 开始刷新
    [self.tableView.mj_header beginRefreshing];
    
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreDocoList)];
    self.tableView.mj_footer.automaticallyChangeAlpha = YES;
}


-(void)loadDocoList
{
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    self.pageNum = 1;
    params[@"id"] =  self.admini.cid;
    params[@"p"] = @(self.pageNum);
    self.params = params;
    
    [MBProgressHUD showMessage:@"数据加载中..."];
    
    [HttpTool postWithURL:searchPartyDepartment params:params success:^(id json) {
        ICLog(@"json menu:%@",json);
        if (self.params != params) return;
        
        if (jsonMsg(json)) {
            
            // 转模型
            [self.docotorMutableArray removeAllObjects];
            NSArray *tempArr = [Doctor mj_objectArrayWithKeyValuesArray:json[@"data"]];
            [self.docotorMutableArray addObjectsFromArray:tempArr];
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


- (void)loadMoreDocoList
{
    
    [self.tableView.mj_header endRefreshing];
    NSInteger page = self.pageNum + 1;
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"id"] = self.admini.cid;
    params[@"p"] = @(page);
    self.params = params;
    
    [HttpTool postWithURL:searchPartyDepartment params:params success:^(id json) {
        ICLog(@"json menu:%@",json);
        if (self.params != params) return;
        
        if (jsonMsg(json)) {
            // 转模型
            NSArray *tempArr = [Doctor mj_objectArrayWithKeyValuesArray:json[@"data"]];
            [self.docotorMutableArray addObjectsFromArray:tempArr];
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


    if (self.docotorMutableArray.count <= 0) {
        self.tableView.mj_footer.hidden = YES;
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addChooseView{
    
    ChooseTableToolView *chooseView = [[ChooseTableToolView alloc]initWithBtnArray:@[@"科室",@"综合排序",@"全部地区",@"筛选"] tableDataArrOfArr:self.tableDataArrOfArr];
    self.chooseView = chooseView;
    chooseView.backgroundColor = c255255255;
    chooseView.frame = CGRectMake(0,0, kScreenWidth, 44);
    [self.view addSubview:chooseView];
    __weak typeof(self) weakSelf = self;
    
    chooseView.selectCellModelBlock = ^(NSInteger tag ,NSInteger cellIndex){
        
        if (tag == 0) {//选择科室
            
            self.admini = self.adminiArray[cellIndex];
            
        }
        else if (tag == 1){//综合排序
            
            
        }
        else if (tag==2)//全部地区
        {
            
        }
        else//筛选
        {
            
        }
        
        [weakSelf.tableView.mj_header beginRefreshing];
    };
}


//**所有科室 */
- (void)loadAllAdmini
{

    NSMutableArray *adNameArr = [NSMutableArray array];
 
    
    for (Administrative *administrative in self.adminiArray)
    {
        [adNameArr addObject:administrative.department];
    }
    
    self.tableDataArrOfArr[0] = adNameArr;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return px(10);
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return CGFLOAT_MIN;
}

#pragma mark --datasource delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.docotorMutableArray.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    SSSearchDocCell  *cell =  (SSSearchDocCell  *)[self tableView:tableView cellForRowAtIndexPath:indexPath];
    return cell.bounds.size.height;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SSSearchDocCell *cell = [SSSearchDocCell cellWithTableView:tableView];
    Doctor *doctor = self.docotorMutableArray[indexPath.section];
    cell.doctor = doctor;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
   
    SSDocDetailController *detailVC = [[SSDocDetailController alloc]init];
    
    detailVC.doctor = self.docotorMutableArray[indexPath.section];
   [self.navigationController pushViewController:detailVC animated:YES];
}



- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 44, kScreenWidth, kScreenHeight - NavBar_Height-44) style:UITableViewStyleGrouped];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}
-(NSMutableArray *)docotorMutableArray
{
    if (!_docotorMutableArray) {
        
        _docotorMutableArray = [NSMutableArray new];
    }
    return _docotorMutableArray;
}
#pragma mark - lazy
- (NSMutableArray *)tableDataArrOfArr{
    if (!_tableDataArrOfArr) {
        _tableDataArrOfArr = [NSMutableArray arrayWithArray:@[@[],@[],@[],@[]]];
    }
    return _tableDataArrOfArr;
}

@end
