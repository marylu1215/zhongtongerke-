//
//  SSHealthTaskController.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/4.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSHealthTaskController.h"
#import "UIBarButtonItem+Common.h"
#import "SSPersonalFileController.h"
#import "HealthCoureTableCell.h"
#import "HealthCurriculumViewController.h"
#import "MyCourseDetailsViewController.h"

@interface SSHealthTaskController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableView;
@property (nonatomic ,strong) NSMutableArray *heaCuMutableArray;

@end

@implementation SSHealthTaskController
-(NSMutableArray *)heaCuMutableArray
{
    if (!_heaCuMutableArray) {
        
        _heaCuMutableArray = [NSMutableArray new];
    }
    return _heaCuMutableArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   
    self.title = @"我的课程";
    
    [self.view addSubview:self.tableView];
}
-(void)loadData
{
    [super loadData];
    
    NSArray *courseArray = [Course mj_objectArrayWithKeyValuesArray: [XFModelTest sharedModelTest].healthCoursesDict[@"healthCourses"]];
    
    [self.heaCuMutableArray addObjectsFromArray:courseArray];
    
    Course *course =[[Course alloc] init];
    course.courseImageName = tjkcImageName;
    [self.heaCuMutableArray addObject:course];
    [self.tableView reloadData];
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    HealthCoureTableCell *cell =  (HealthCoureTableCell *)[self tableView:tableView cellForRowAtIndexPath:indexPath];
    return cell.bounds.size.height;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HealthCoureTableCell *healthCoureCell = [ HealthCoureTableCell cellWithTableView:tableView];
    
    healthCoureCell.coureArray = self.heaCuMutableArray;
    __weak typeof (self) weakSelf = self;
    healthCoureCell.selectCourseBlock = ^(HealthTitleBtn *btn)
    {
       
        if (btn.tag == self.heaCuMutableArray.count-1) {
            
            [weakSelf.navigationController pushViewController:[HealthCurriculumViewController new] animated:YES];
        }
        
        else
        {
            MyCourseDetailsViewController *detailVC = [MyCourseDetailsViewController new];
            detailVC.course =  weakSelf.heaCuMutableArray[btn.tag];
            [weakSelf.navigationController pushViewController:detailVC  animated:YES];
        }
        
        
    };
    
    return healthCoureCell;
}




- (UITableView *)tableView{
    if (_tableView) return _tableView;
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth , kScreenHeight -  NavBar_Height - 33 - TabBar_Height ) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = c255255255;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
    return _tableView;
}
@end
