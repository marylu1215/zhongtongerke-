//
//  SSHotProConsultController.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/29.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSHotProConsultController.h"
#import "SSConsultTableCell.h"
#import "ChooseTableToolView.h"
#import "ArDetailViewController.h"
#import "Administrative.h"
#import "ExConsult.h"
#import "DyfViewController.h"
#import "VideoListTableCell.h"

static NSString *cellIdentifier = @"cell";
@interface SSHotProConsultController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
//** 下拉选择框 */
@property (nonatomic, weak) ChooseTableToolView *chooseView;
@property (nonatomic, strong) NSMutableArray *tableDataArrOfArr;
@property (nonatomic,strong)  NSArray *adminiArray;
@property (nonatomic ,strong) NSMutableArray *exConsultMuArr;
@property (nonatomic, assign) NSInteger pageNum;
@property (nonatomic, strong) NSMutableDictionary *params;
@property (nonatomic, copy) NSString *departmentid;
@end

@implementation SSHotProConsultController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"热门专家咨询";
    [self.view addSubview:self.tableView];
    [self addChooseView];
     [self loadAllAdmini];
    
    // 添加刷新控件
    [self setUpRefresh];
}

- (void)setUpRefresh
{
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadAllHot_detailsParty)];
    
    // 自动改变透明度
    self.tableView.mj_header.automaticallyChangeAlpha = YES;
    // 开始刷新
    [self.tableView.mj_header beginRefreshing];
    
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreHot_detailsParty)];
    self.tableView.mj_footer.automaticallyChangeAlpha = YES;
}


-(void)loadAllHot_detailsParty
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    self.pageNum = 1;
    params[@"p"] = @(self.pageNum);
    if (self.departmentid.length) {
        params[@"departmentid"] = self.departmentid;
    }
    self.params = params;
    
    [MBProgressHUD showMessage:@"数据加载中..."];
    
    [HttpTool postWithURL:getHot_detailsParty params:params success:^(id json) {
        ICLog(@"json menu:%@",json);
        if (self.params != params) return;
        
        if (jsonMsg(json)) {
            
            // 转模型
            [self.exConsultMuArr removeAllObjects];
            NSArray *tempArr = [ExConsult   mj_objectArrayWithKeyValuesArray:json[@"data"]];
            [self.exConsultMuArr addObjectsFromArray:tempArr];
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



- (void)loadMoreHot_detailsParty
{
    
    [self.tableView.mj_header endRefreshing];
    
    NSInteger page = self.pageNum + 1;
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    params[@"p"] = @(page);
    if (self.departmentid.length) {
        params[@"departmentid"] = self.departmentid;
    }
    self.params = params;
    
    [HttpTool postWithURL:getHot_detailsParty params:params success:^(id json) {
        ICLog(@"json menu:%@",json);
        if (self.params != params) return;
        
        if (jsonMsg(json)) {
            
            // 转模型
            NSArray *tempArr = [ExConsult  mj_objectArrayWithKeyValuesArray:json[@"data"]];
            [self.exConsultMuArr addObjectsFromArray:tempArr];
            
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
    
    if (self.exConsultMuArr.count <= 0) {
        self.tableView.mj_footer.hidden = YES;
    }
    
}


//**所有科室 */
- (void)loadAllAdmini
{
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    [MBProgressHUD showMessage:@"数据加载中..."];
    
    [HttpTool postWithURL:getPartyDepartment params:params success:^(id json) {
        ICLog(@"json menu:%@",json);
        
        if (jsonMsg(json)) {
            
            self.adminiArray = [Administrative mj_objectArrayWithKeyValuesArray:json[@"data"]];
            
            NSMutableArray *adNameArr = [NSMutableArray array];
            
            
            for (Administrative *administrative in self.adminiArray)
            {
                [adNameArr addObject:administrative.department];
            }
            
            self.tableDataArrOfArr[0] = adNameArr;
            
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



#pragma mark -- delegate datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.exConsultMuArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SSConsultTableCell *cell = [SSConsultTableCell cellWithTableView:tableView];
    ExConsult *consult = self.exConsultMuArr[indexPath.row];
    __weak typeof  (self) weakSelf = self;
    
    cell.listenButton.tag = indexPath.row;
    
    cell.listenBlock = ^(UIButton *buton)
    {
        
        DyfViewController *dyfVC =    [DyfViewController new];
        
        dyfVC.exConsult = self.exConsultMuArr[buton.tag];
        
        [weakSelf.navigationController pushViewController: [UserTool user].userid.length? dyfVC:[LoginViewController new] animated:YES];
    };
    cell.exConsult = consult;
    return cell;

}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 84*kScreenHeightScale;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return CGFLOAT_MIN;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return CGFLOAT_MIN;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    [self.navigationController pushViewController:[ArDetailViewController new] animated:YES];
}
- (void)addChooseView{
    
    ChooseTableToolView *chooseView = [[ChooseTableToolView alloc]initWithBtnArray:@[@"科室",@"发布时间",@"点赞数"] tableDataArrOfArr:self.tableDataArrOfArr];
    self.chooseView = chooseView;
    chooseView.backgroundColor = c255255255;
    chooseView.frame = CGRectMake(0,0, kScreenWidth, 44);
    [self.view addSubview:chooseView];
    __weak typeof(self) weakSelf = self;
 
    chooseView.selectCellModelBlock = ^(NSInteger tag ,NSInteger cellIndex){
        
        if (tag == 0) {//选择科室
        
            Administrative *administrative = self.adminiArray[cellIndex];
            weakSelf.departmentid = administrative.cid;
            
            
          
        }
       else if (tag == 1){//选择楼层
            
    
       }
    
        
        [weakSelf.tableView.mj_header beginRefreshing];
    };
}


- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 44, kScreenWidth, kScreenHeight-44) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
     
    }
    return _tableView;
}
#pragma mark - lazy
- (NSMutableArray *)tableDataArrOfArr{
    if (!_tableDataArrOfArr) {
        _tableDataArrOfArr = [NSMutableArray arrayWithArray:@[@[],@[],@[]]];
    }
    return _tableDataArrOfArr;
}

-(NSMutableArray *)exConsultMuArr
{
    if (!_exConsultMuArr) {
        _exConsultMuArr = [NSMutableArray new];
    }
    return  _exConsultMuArr;
}
@end
