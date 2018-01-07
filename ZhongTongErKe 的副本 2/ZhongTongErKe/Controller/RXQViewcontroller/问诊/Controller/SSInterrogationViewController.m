//
//  SSInterrogationViewController.m
//  ZhongTongErKe
//
//  Created by Claf on 17/4/28.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSInterrogationViewController.h"
#import "UIBarButtonItem+Common.h"
#import "SSConsultTableCell.h"
#import "SSTableViewFooter.h"
#import "SSInterrogationHeader.h"
#import "SSPatientJudgeTableCell.h"
#import "SSHotDoctorTableCell.h"
//#import "SSFastConsultController.h"
#import "FastConsultController.h"
#import "SSProConsultController.h"
#import "SSLookHospitalController.h"
#import "SSFamousDocController.h"
#import "SSPhysicSaleController.h"
#import "searchView.h"
#import "LMMessageBtn.h"
#import "NSString+Tools.h"
#import "SSHotProConsultController.h"
#import "NCenterTableViewController.h"
#import "SearchRecordViewController.h"
#import "Doctor.h"
#import "ExConsult.h"
#import "DyfViewController.h"
#import "PatientPraise.h"
#import "SSDocDetailController.h"
#import "SSTableViewHeader.h"

@interface SSInterrogationViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong) searchView *searchView;
@property (nonatomic ,strong) NSArray *sectionArr;
@property (nonatomic ,strong) NSArray *doctorArray;
@property (nonatomic, assign) NSInteger pageNum;
@property (nonatomic, strong) NSMutableDictionary *params;
@property (nonatomic ,strong) NSArray *exConsultArr;
@property (nonatomic ,strong) NSArray *patientPraiseArr;

@end

@implementation SSInterrogationViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //** 导航栏 */
    [self setNavi];
    //**头部视图 */
    [self setHeaderView];

 
}

-(void)loadData
{
    
    self.sectionArr = @[@"更多",@"刷新",@"更多"];
    [self loadAskingParty];
    [self loadPraiseParty];
}
-(void)loadAskingParty
{
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    self.pageNum = 1;
  
    params[@"p"] = @(self.pageNum);
    self.params = params;
    
    [MBProgressHUD showMessage:@"数据加载中..."];
    
    [HttpTool postWithURL:askingParty params:params success:^(id json) {
  
        if (jsonMsg(json)) {
            
            self.doctorArray = [Doctor  mj_objectArrayWithKeyValuesArray:json[@"hotDoctor"]];
            
            self.exConsultArr  = [ExConsult mj_objectArrayWithKeyValuesArray:json[@"hotVoice"]];
            [self.tableView reloadData];
        }
        else
        {
            [MBProgressHUD showError:json[@"msg"]];
            
        }
     
        kHideHUDAll;
    } failure:^(NSError *error) {
        if (self.params != params) return;
        
        
        netWorkError;
        kHideHUDAll;
    }];
}

-(void)loadPraiseParty
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    self.pageNum = 1;
    params[@"p"] = @(self.pageNum);
    params[@"type"] = @"1";
    self.params = params;
    [MBProgressHUD showMessage:@"数据加载中..."];
    
    [HttpTool postWithURL:getPraiseParty params:params success:^(id json) {
      
        ICLog(@"%@",json);
        
        
        if (jsonMsg(json)) {
            
            self.patientPraiseArr = [PatientPraise mj_objectArrayWithKeyValuesArray:json[@"data"]];
            [self.tableView reloadData];
        }
        else
        {
            [MBProgressHUD showError:json[@"msg"]];
            
        }
        [self.tableView.mj_header endRefreshing];
        kHideHUDAll;

        kHideHUDAll;
    } failure:^(NSError *error) {
        [self.tableView.mj_header endRefreshing];
        netWorkError;
        kHideHUDAll;
    }];

}
-(void)setNavi
{
   
    LMMessageBtn *button = [[LMMessageBtn alloc] init];
    [button addTarget:self action:@selector(msgAction) forControlEvents:UIControlEventTouchUpInside];
    [button showRedPoint];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:button];
    
    _searchView = [[searchView alloc]initWithSearchBarEditDidChange:^(NSString *text) {
        
        
    } SearchBegin:^(NSString *kWords, BOOL isSeletedPopTable, NSUInteger index) {
        
        
    }];
    _searchView.sd_layout.heightIs(px(52)).widthIs(200);
    _searchView.searchBar.searchTF.userInteractionEnabled = NO;
    [_searchView addGestureRecognizer: [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapActon)]];
    self.navigationItem.titleView = _searchView;
    _searchView.placeholder = @"搜索疾病、医生、科室";
    _searchView.limitMaxStrLength = 20;

}
//搜索
-(void)tapActon
{
    [self.navigationController pushViewController:[SearchRecordViewController new ] animated:YES];
}
-(void)setHeaderView
{
    
    SSInterrogationHeader *view = [[SSInterrogationHeader alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 174*kScreenHeightScale)];
    view.backgroundColor = [UIColor whiteColor];
    view.headImageview.image = [UIImage imageNamed:interrogation_consult];
    view.remarkImageView.image = [UIImage imageNamed:interrogation_consultScript];
    view.headLabel.text = @"及时通讯，方便快捷";
    view.button1.headImageview.image = [UIImage imageNamed:interrogation_proConsult];
    view.button1.headLabel.text = @"找医生";
    [view.button1 addTarget:self action:@selector(lookDocTaped:) forControlEvents:UIControlEventTouchUpInside];
    view.button2.headImageview.image = [UIImage imageNamed:interrogation_lookHospital];
    view.button2.headLabel.text = @"找医院";
    [view.button2 addTarget:self action:@selector(lookForHospitalButtonTaped:) forControlEvents:UIControlEventTouchUpInside];
    view.button3.headImageview.image = [UIImage imageNamed:interrogation_famousDoc];
    view.button3.headLabel.text = @"名医会诊";
    [view.button3 addTarget:self action:@selector(famousConsultButtonTaped:) forControlEvents:UIControlEventTouchUpInside];
    view.button4.headImageview.image = [UIImage imageNamed:activityIconImageName];
    view.button4.headLabel.text = @"主题活动";
    self.tableView.tableHeaderView = view;
    [view.button4 addTarget:self action:@selector(physicExamingnationButtonTaped:) forControlEvents:UIControlEventTouchUpInside];
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(fastConsultViewTaped)];
    [view.fastConsultView addGestureRecognizer:gesture];
}
//消息中心
-(void)msgAction
{
    [self.navigationController pushViewController:[NCenterTableViewController new] animated:YES];
}

#pragma mark --private action
//主题活动
- (void)physicExamingnationButtonTaped:(SSInterrogationHeadButton *)sender{
    SSPhysicSaleController *vc = [[SSPhysicSaleController alloc]init];
  
    [self.navigationController pushViewController:  [UserTool user].userid.length?vc:[LoginViewController new] animated:YES];
}

- (void)famousConsultButtonTaped:(SSInterrogationHeadButton *)sender{
    SSFamousDocController *vc = [[SSFamousDocController alloc]init];
    [self.navigationController pushViewController:  [UserTool user].userid.length?vc:[LoginViewController new] animated:YES];
}
- (void)lookDocTaped:(SSInterrogationHeadButton *)sender{
    SSProConsultController *vc = [[SSProConsultController alloc]init];
    [self.navigationController pushViewController:  [UserTool user].userid.length?vc:[LoginViewController new] animated:YES];
}
- (void)lookForHospitalButtonTaped:(SSInterrogationHeadButton *)sender{
    SSLookHospitalController *vc = [[SSLookHospitalController alloc]init];
    [self.navigationController pushViewController:  [UserTool user].userid.length?vc:[LoginViewController new] animated:YES];
}
//快速咨询
- (void)fastConsultViewTaped{
 
//        RCDChatViewController *_conversationVC =
//        [[RCDChatViewController alloc] init];
//    _conversationVC.conversationType =   ConversationType_APPSERVICE;
//        _conversationVC.targetId = @"";
//        _conversationVC.title = @"";
//        _conversationVC.conversation = nil;
//    
//    
//    
//        [self.navigationController pushViewController:_conversationVC
//                                             animated:YES];
   FastConsultController *vc = [[FastConsultController alloc]init];
    [self.navigationController pushViewController:  [UserTool user].userid.length?vc:[LoginViewController new] animated:YES];
}

#pragma mark -- delegate datasource
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 64;
    }else if (indexPath.section == 1){
        return 63;
    }
   else
   {
        SSHotDoctorTableCell *cell =  ( SSHotDoctorTableCell *)[self tableView:tableView cellForRowAtIndexPath:indexPath];
       return cell.bounds.size.height;
      
   }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 25;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 7;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
   
    SSTableViewHeader *headerView = [[SSTableViewHeader alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 25*kScreenHeightScale)];
    headerView.imageView.image = [UIImage imageNamed:index_sectionIconImageName];
    [headerView.button setTitle:[NSString stringWithFormat:@"%@>>",self.sectionArr[section]] forState:UIControlStateNormal];
    [headerView.button setTitleColor:cHBColor forState:UIControlStateNormal];
    headerView.button.tag = section;
    [headerView.button addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
    
    if (section == 1) {
        headerView.label.text = @"患者好评";
    }else if (section == 2){
        headerView.label.text = @"热门医生";
    }else{
        headerView.label.text = @"热门专家咨询";
    }
    headerView.backgroundColor = c255255255;
    return headerView;

}
-(void)clickAction:(UIButton *)btn
{
    switch (btn.tag) {
        case 0:
            [self.navigationController pushViewController:[UserTool user].userid.length?[SSHotProConsultController new] :[LoginViewController new] animated:YES];
            break;
            
        case 1://刷新
            // 添加刷新控件
            [self setUpRefresh];
            break;
            
        case 2:
           
            [self.navigationController pushViewController: [UserTool user].userid.length?[ SSProConsultController new]:[LoginViewController new]animated:YES];
            break;
            
            
        default:
            break;
    }
}
- (void)setUpRefresh
{
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadPraiseParty)];
    
    // 自动改变透明度
    self.tableView.mj_header.automaticallyChangeAlpha = YES;
    // 开始刷新
    [self.tableView.mj_header beginRefreshing];
    
 
}


- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    SSTableViewFooter *view = [[SSTableViewFooter alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 7*kScreenHeightScale)];
    return view;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 2) {
        return 1;
    }
    if (section==0) {
        
        return self.exConsultArr.count;
    }
    else return self.patientPraiseArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        
        SSConsultTableCell *cell = [SSConsultTableCell cellWithTableView:tableView];
        ExConsult *consult = self.exConsultArr[indexPath.row];
        __weak typeof  (self) weakSelf = self;
        
        cell.listenButton.tag = indexPath.row;
        
        cell.listenBlock = ^(UIButton *buton)
        {
            
            DyfViewController *dyfVC =    [DyfViewController new];
            
            dyfVC.exConsult = self.exConsultArr[buton.tag];
        
            [weakSelf.navigationController pushViewController: [UserTool user].userid.length? dyfVC:[LoginViewController new] animated:YES];
        };
        cell.exConsult = consult;
        return cell;

    }else if (indexPath.section == 1){
        
        SSPatientJudgeTableCell *cell = [SSPatientJudgeTableCell cellWithTableView:tableView];
        cell.patientPraise = self.patientPraiseArr[indexPath.row];
        return cell;
    }else {
        //热门医生咨询
        SSHotDoctorTableCell *cell = [SSHotDoctorTableCell cellWithTableView:tableView];
        cell.doctorArray = self.doctorArray;
        
        __weak typeof (self) weakSelf = self;
        cell.backDoctorBlock = ^(SSHotDoctorButton *button)
        {
           SSDocDetailController *judgeVC =[ SSDocDetailController new];
            judgeVC.doctor = weakSelf.doctorArray[button.tag];
            
            [weakSelf.navigationController pushViewController:  [UserTool user].userid.length? judgeVC:[LoginViewController new] animated:YES];
            
        };
        return cell;
        
    }
}


- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-NavBar_Height-TabBar_Height) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self.view addSubview:self.tableView];
    }
    return _tableView;
    
    
}
@end
