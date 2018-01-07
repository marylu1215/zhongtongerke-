//
//  TimeSchoolViewController.m
//  ZhongTongErKe
//
//  Created by khj on 2017/6/20.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "TimeSchoolViewController.h"
#import "ScheduleTableCell.h"
#import "CourseButton.h"
#import "MBProgressHUD+MJ.h"
#import "WeakView.h"
@interface TimeSchoolViewController ()<UITableViewDelegate,UITableViewDataSource,ScheduleTableCellDelegate>

@property (nonatomic ,strong) UITableView *tableView;
@property (nonatomic ,strong)  NSArray *timeQuArray;

@end

@implementation TimeSchoolViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
    [self setUPheaderView];
    [self setUPFooterBtn];
    
}

-(void)setUPheaderView
{
    WeakView *headerView = [[WeakView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, px(50))];
    headerView.backgroundColor = [UIColor colorWithHexString:@"73c5ff"];
    self.tableView.tableHeaderView = headerView;
}
-(void)loadData
{
    self.timeQuArray = @[@[@"8:20~8:50",@"9:00~9:30",@"9:40~10:10",@"10:20~10:50",@"11:00~11:30",@"11:40~12:10"],@[@"13:40~14:10",@"14:20~14:50",@"14:50~15:20",@"15:30~16:00",@"16:10~16:40",@"16:50~17:20",@"17:30~18:00"]];
    [self.tableView reloadData];
    
}
-(void)setUPFooterBtn
{
    UIButton *bottomBtn = [UIButton addBtnWithTitle:@"确认课程" WithBGImg:nil WithFont:Font13 WithTitleColor:c255255255 Target:self Action:@selector(sureAction)];
    bottomBtn.backgroundColor = cHBColor;
    [self.view addSubview:bottomBtn];
    bottomBtn.sd_layout.widthIs(kScreenWidth).heightIs(px(100)).bottomSpaceToView(self.view,0);
}
-(void)sureAction
{
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.timeQuArray.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    ScheduleTableCell *cell = [ScheduleTableCell cellWithTableView:tableView];
    
    cell.delegate = self;
    cell.selectedIndexPath = indexPath;
    cell.timeQuArray = self.timeQuArray[indexPath.section];
   
    return cell;
    
}

#pragma mark - header

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *arr = self.timeQuArray[indexPath.section];
    return  arr.count*px(54);
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section==0) {
          return px(50);
    }
   else
   {
       return CGFLOAT_MIN;
   }
}
-(void)handleSelectedButtonActionWithSelectedIndexPath:(NSIndexPath *)selectedIndexPath  button:(CourseButton *)button{
    
    if (button.selected) {
          [MBProgressHUD showSuccess:[NSString stringWithFormat:@"点击了星期%ld 时间%@",(button.tag%10),self.timeQuArray[selectedIndexPath.section][button.tag/10]]];
    }
  
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (UITableView *)tableView{
    if (_tableView) return _tableView;
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth , kScreenHeight-NavBar_Height) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
   _tableView.backgroundColor=[UIColor colorWithHexString:@"e9e9e9"];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    return _tableView;
}


@end
