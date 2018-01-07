//
//  CourseScheduleViewController.m
//  ZhongTongErKe
//
//  Created by khj on 2017/6/21.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "CourseScheduleViewController.h"
#import "CourseScheduleView.h"
#import "CourseSectionView.h"
#import "ScheduleTableCell.h"
#import "CourseButton.h"


@interface CourseScheduleViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic ,strong) UITableView *tableView;
@property (nonatomic ,strong)  NSArray *timeQuArray;
@property (nonatomic ,strong) CourseScheduleView *headerView;


@end

@implementation CourseScheduleViewController




- (void)viewDidLoad {
    [super viewDidLoad];
     self.title = @"我的课程";
    [self.view addSubview:self.tableView];
    [self setUPheaderView];

    
}

-(void)setUPheaderView
{
    self.headerView = [[CourseScheduleView  alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, px(122))];
     self.headerView.course = self.course;
    self.headerView.telBlock = ^()
    {
        
    };
    __weak typeof (self) weakSelf = self;
    self.headerView.downBlock= ^()
    {
        weakSelf.headerView.height = px(150);
    };
    
    self.tableView.tableHeaderView = self.headerView;
}

-(void)loadData
{
    self.timeQuArray = @[@[@"8:20~8:50",@"9:00~9:30",@"9:40~10:10",@"10:20~10:50",@"11:00~11:30",@"11:40~12:10"],@[@"13:40~14:10",@"14:20~14:50",@"14:50~15:20",@"15:30~16:00",@"16:10~16:40",@"16:50~17:20",@"17:30~18:00"]];
    [self.tableView reloadData];
    
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
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section==0) {
        return px(146);
    }
    else
    {
        return CGFLOAT_MIN;
    }
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    if (section==0) {
       CourseSectionView *headerView = [[CourseSectionView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, px(146))];
        
        return headerView;
    }
    else
    {
        return nil;
    }
    
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
