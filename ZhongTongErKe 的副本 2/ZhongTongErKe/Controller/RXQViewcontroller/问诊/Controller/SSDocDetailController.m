//
//  SSDocDetailController.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/12.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSDocDetailController.h"
#import "SSVoiceQuestionController.h"
#import "SSWZJudgeSuccessController.h"
#import "HosGuiTableViewController.h"
#import "PrivateDoctorViewController.h"
#import "QuDetailViewController.h"
#import "Comment.h"
#import "DoctorDetailsView.h"
#import "SSDocDetailHeaderAdd.h"
#import "SSDocDetailCell.h"
#import "SSWZJudgeSuccessController.h"
#import "FastConsultController.h"
#import "chatViewController.h"
@interface SSDocDetailController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong) UIButton *bottomBtn;
@property (nonatomic ,assign) long flag;
@property (nonatomic, assign) NSInteger pageNum;
@property (nonatomic, strong) NSMutableDictionary *params;
@property (nonatomic ,strong) NSMutableArray *commentMutableArray;
@property (nonatomic ,weak) SSDocDetailHeaderAdd *headerView;

@end

@implementation SSDocDetailController

-(NSMutableArray *)commentMutableArray
{
    if (!_commentMutableArray) {
        
        _commentMutableArray = [NSMutableArray new];
    }
    return _commentMutableArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.tableView];
    
    [self setTableHeaderView];
    
    [self setBottomView];
    
    [self setUpRefresh];
}

- (void)setUpRefresh
{
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadDoctorDetail)];
    
    // 自动改变透明度
    self.tableView.mj_header.automaticallyChangeAlpha = YES;
    // 开始刷新
    [self.tableView.mj_header beginRefreshing];
    
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreDoctorDetail)];
    self.tableView.mj_footer.automaticallyChangeAlpha = YES;
}

-(void)loadDoctorDetail
{
    
    kshowMessage(@"数据加载中...");
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    self.pageNum = 1;
    params[@"doctorid"] = self.doctor.cid;
    params[@"p"] = @(self.pageNum);
    self.params = params;
    [HttpTool postWithURL:getDoctor_details params:params success:^(id json) {
        
        ICLog(@"%@",json);
        
        
        if (jsonMsg(json)) {
            
            [self.commentMutableArray removeAllObjects];
            // 转模型
            NSArray *tempArr = [Comment mj_objectArrayWithKeyValuesArray:json[@"comment"]];
            [self.commentMutableArray addObjectsFromArray:tempArr];
            self.headerView.doctor = [Doctor mj_objectWithKeyValues:json[@"details"]];
            self.doctor = [Doctor mj_objectWithKeyValues:json[@"details"]];
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
        
        [self.tableView.mj_header endRefreshing];
        netWorkError;
        kHideHUDAll;
    }];
    
    
}



- (void)loadMoreDoctorDetail
{
    
    [self.tableView.mj_header endRefreshing];
    NSInteger page = self.pageNum + 1;
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"userid"] = self.doctor.cid;
    params[@"p"] = @(page);
    self.params = params;
    
    [HttpTool postWithURL:getDoctor_details params:params success:^(id json) {
        ICLog(@"json menu:%@",json);
        if (self.params != params) return;
        
        if (jsonMsg(json)) {
            
            // 转模型
            NSArray *tempArr = [Comment mj_objectArrayWithKeyValuesArray:json[@"comment"]];
            [self.commentMutableArray addObjectsFromArray:tempArr];
           
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
    
    if (self.commentMutableArray.count <= 0) {
        self.tableView.mj_footer.hidden = YES;
    }
    
}

-(void)setTableHeaderView
{
    SSDocDetailHeaderAdd *headerView = [[SSDocDetailHeaderAdd alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, px(1018)*kScreenHeightScale)];
    
    __weak typeof (self) weakSelf = self;
    headerView.topView.bgImageview.backBlock = ^()
    {
        [weakSelf.navigationController popViewControllerAnimated:YES];
    };
    
    
    self.tableView.tableHeaderView = headerView;
    headerView.bottomView.clickBlock = ^(SSDocDeTailButton *button)
    {
        [weakSelf.bottomBtn setTitle: [NSString stringWithFormat:@"%@(%@)",button.headLabel.text,button.priceLabel.text] forState:UIControlStateNormal];
        weakSelf.flag = button.tag;
        self.bottomBtn.hidden = NO;
    };
    
    self.headerView = headerView;
    
}
-(void)setBottomView
{
    self.bottomBtn = [UIButton addBtnWithTitle:@"" WithBGImg:nil WithFont:Font13 WithTitleColor:c255255255 Target:self Action:@selector(chooseAction)];
    self.bottomBtn.hidden = YES;
    self.bottomBtn.backgroundColor = cHBColor;
    [self.view addSubview:self.bottomBtn];
    self.bottomBtn.sd_layout.widthIs(kScreenWidth).heightIs(px(96)).bottomSpaceToView(self.view ,0);
}
-(void)chooseAction
{
    switch (self.flag) {
//        case 1:
//        {
//            SSWZJudgeSuccessController  *judgeVC = [[ SSWZJudgeSuccessController alloc]init];
//            judgeVC.purchase = [[Purchase alloc]init];
//            judgeVC.purchase.type = @"voice";
//            judgeVC.purchase.doName = self.doctor.name;
//            judgeVC.purchase.price = self.doctor.service.voice;
//            judgeVC.doctor = self.doctor;
//            [self.navigationController pushViewController:judgeVC animated:YES];
//            
//            NSLog(@"在线咨询");
//        }
//            
//            break;
        case 2:
        {
            //免费咨询
          
            //chatViewController *chatview = [chatViewController new];
            
           // chatview.hidesBottomBarWhenPushed = YES;
            
            //[self.navigationController pushViewController:chatview animated:YES];
            [self.navigationController pushViewController:[chatViewController new] animated:YES];

            //[self.navigationController pushViewController:[FastConsultController new] animated:YES];

            
        }
            break;
            
        case 3:
        {
            SSWZJudgeSuccessController  *judgeVC = [[ SSWZJudgeSuccessController alloc]init];
            judgeVC.purchase = [[Purchase alloc]init];
            judgeVC.purchase.type = @"tel";
            judgeVC.purchase.doName = self.doctor.name;
            judgeVC.purchase.price = self.doctor.service.tel;
            judgeVC.doctor = self.doctor;
            [self.navigationController pushViewController:judgeVC animated:YES];
            NSLog(@"院后指导");
        }
            break;
        case 4:
            
        {  //院后指导
            HosGuiTableViewController *guiVC =     [HosGuiTableViewController new];
            guiVC.doctor = self.doctor;
            [self.navigationController pushViewController:guiVC animated:YES];
        }
            break;
        case 5:
        {
           PrivateDoctorViewController *doctorVC =    [PrivateDoctorViewController new];
           doctorVC.doctor = self.doctor;
            [self.navigationController pushViewController:doctorVC animated:YES];
        }
            
            break;
        default:
            break;
    }
}
#pragma mark --delegate datasource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.commentMutableArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
  
    SSDocDetailCell *docDetailCell =  (SSDocDetailCell *)[self tableView:tableView cellForRowAtIndexPath:indexPath];
    return docDetailCell.bounds.size.height;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    SSDocDetailCell *cell = [SSDocDetailCell cellWithTableView:tableView];
    cell.comment = self.commentMutableArray[indexPath.row];
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
   DoctorDetailsView *headerView = ( DoctorDetailsView *)[self tableView:tableView viewForHeaderInSection:section];
    return  headerView.bounds.size.height;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
   DoctorDetailsView *headerView = [[DoctorDetailsView alloc]initWithMarkArray:@[@"发育(2548)",@"腹泻(2548)",@"呼吸道发感染(475)",@"黄疸(2548)",@"幼儿急疹(2548)"]];
    return headerView;
    
}
#pragma mark --lazyload
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





