//
//  MyCourseDetailsViewController.m
//  ZhongTongErKe
//
//  Created by khj on 2017/6/20.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "MyCourseDetailsViewController.h"
#import "MyCourseDetailsView.h"
#import "MyCourseDetailsTableCell.h"
#import "CourseScheduleViewController.h"

@interface MyCourseDetailsViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic ,strong) NSMutableArray *visibleMutableArray;
@property (nonatomic ,strong) UITableView *tableView;

@end

@implementation MyCourseDetailsViewController

-(NSMutableArray *)visibleMutableArray
{
    if (!_visibleMutableArray) {
        
        _visibleMutableArray = [NSMutableArray new];
    }
    return _visibleMutableArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
  
    self.title = @"我的课程";
    
    [self setUPHeaderView];
    
    
}
-(void)setUPHeaderView
{
    MyCourseDetailsView *headerView = [[MyCourseDetailsView  alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, px(210))];
    headerView.course =  self.course;
    __weak typeof (self) weakSelf = self;
    headerView.telBlock = ^()
    {
        NSString *path=[NSString stringWithFormat:@"tel://%@",@""];
        [[UIApplication sharedApplication]openURL:[NSURL URLWithString:path]];
    };
    
    headerView.lookBlock = ^()
    {
        CourseScheduleViewController *courseVC = [CourseScheduleViewController new];
        courseVC.course = self.course;
        [weakSelf.navigationController pushViewController:courseVC animated:YES];
        
    };
    
    self.tableView.tableHeaderView =headerView;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    MyCourseDetailsTableCell *cell = [MyCourseDetailsTableCell cellWithTableView:tableView];
   
    return cell;
    
}
#pragma mark - header

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return px(134);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableView *)tableView{
    if (_tableView) return _tableView;
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth , kScreenHeight -  NavBar_Height) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = bgColor;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
    return _tableView;
}

@end
