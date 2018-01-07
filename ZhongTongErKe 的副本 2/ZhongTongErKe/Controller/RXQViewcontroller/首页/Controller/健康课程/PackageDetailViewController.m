//
//  PackageDetailViewController.m
//  ZhongTongErKe
//
//  Created by khj on 2017/6/20.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "PackageDetailViewController.h"
#import "PackageDetailView.h"
#import "SSDocInformationCell.h"
#import "SSHomeMemberController.h"
#import "SectionHeaderView.h"
#import "TimeSchoolViewController.h"

@interface PackageDetailViewController ()<UITableViewDelegate,UITableViewDataSource,SSDocInformationCellDelegate>

@property (nonatomic ,strong) UITableView *tableView;

@property (nonatomic ,strong) NSArray *docListArray;
@property (assign, nonatomic) NSIndexPath *selectedIndexPath;

@end

@implementation PackageDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"套餐详情";
    [self.view addSubview:self.tableView];
    
    [self setTableHeaderView];
    
    [self setFooterView];
    
}
-(void)setTableHeaderView
{
    PackageDetailView *headerView = [[PackageDetailView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, px(538))];
    headerView.course = self.course;
    __weak typeof (self) weakSelf = self;
    headerView.ClickBlock = ^()
    {
        [weakSelf.navigationController pushViewController:[SSHomeMemberController new] animated:YES];
        
    };
    self.tableView.tableHeaderView = headerView;
}
-(void)setFooterView
{
    UIButton *bottomBtn = [UIButton addBtnWithTitle:@"选择医生" WithBGImg:nil WithFont:Font13 WithTitleColor:c255255255 Target:self Action:@selector(selectAction)];
    bottomBtn.backgroundColor = cHBColor;
    [self.view addSubview:bottomBtn];
    bottomBtn.sd_layout.widthIs(kScreenWidth).heightIs(px(100)).bottomSpaceToView(self.view,0);
}
-(void)selectAction
{
    [self.navigationController pushViewController:[TimeSchoolViewController new] animated:YES];
}
-(void)loadData
{
    [super loadData];
    
    self.docListArray = [Doctor mj_objectArrayWithKeyValuesArray:[XFModelTest sharedModelTest].doctorListDict[@"doctors"]];
    [self.tableView reloadData];
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.docListArray.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    SSDocInformationCell *cell = [SSDocInformationCell cellWithTableView:tableView];
    cell.doctor = self.docListArray[indexPath.section];
    cell.delegate = self;
    cell.checkButton.hidden = NO;
    cell.selectedIndexPath = indexPath;
    return cell;

}
-(void)handleSelectedButtonActionWithSelectedIndexPath:(NSIndexPath *)selectedIndexPath {
    

   SSDocInformationCell *celled = [_tableView cellForRowAtIndexPath:_selectedIndexPath];
    [celled.checkButton setImage:[UIImage imageNamed:unchooseImageName] forState:UIControlStateNormal];
    celled.delegate = self;
    //记录当前选中的位置索引
    _selectedIndexPath = selectedIndexPath;
    
    //当前选择的打勾
    SSDocInformationCell *cell = [_tableView cellForRowAtIndexPath:selectedIndexPath];
    [cell.checkButton setImage:[UIImage imageNamed:chooseIconImageName] forState:UIControlStateNormal];

}

#pragma mark - header

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SSDocInformationCell *cell =  (SSDocInformationCell *)[self tableView:tableView cellForRowAtIndexPath:indexPath];
    return cell.bounds.size.height;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return px(20);
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 30;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    SectionHeaderView  *view = [[SectionHeaderView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 30) LeftImagrName:homeThemeImageName Info:@"医生列表" Margin:0];
    return view;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableView *)tableView{
    if (_tableView) return _tableView;
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth , kScreenHeight-NavBar_Height-TabBar_Height) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    return _tableView;
}
@end
