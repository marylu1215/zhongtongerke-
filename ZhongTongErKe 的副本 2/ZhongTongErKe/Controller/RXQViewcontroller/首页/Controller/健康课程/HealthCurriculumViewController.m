//
//  HealthCurriculumViewController.m
//  ZhongTongErKe
//
//  Created by khj on 2017/6/18.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "HealthCurriculumViewController.h"
#import "HealthCoureTableCell.h"
#import "HealthTitleBtn.h"
#import "CourseDetailsViewController.h"
#import "LMImageView.h"

@interface HealthCurriculumViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic ,strong) UITableView *tableView;
@property (nonatomic ,strong) NSMutableArray *heaCuMutableArray;
 @end

@implementation HealthCurriculumViewController

-(NSMutableArray *)heaCuMutableArray
{
    if (!_heaCuMutableArray) {
        
        _heaCuMutableArray = [NSMutableArray new];
    }
    return _heaCuMutableArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
   
    UIImage *bannerImage = [UIImage imageNamed:healBannerImageName];
    LMImageView *bannerView = [[LMImageView alloc]initWithFrame:CGRectMake(0, 0, bannerImage.size.width, bannerImage.size.height)];
    bannerView.image = bannerImage;
    __weak typeof (self) weakSelf = self;
    bannerView.backBlock = ^()
    {
        [weakSelf.navigationController popViewControllerAnimated:YES];
    };
    
       self.tableView.tableHeaderView = bannerView;
    
}

-(void)loadData
{
  
    NSArray *courseArray = [Course mj_objectArrayWithKeyValuesArray: [XFModelTest sharedModelTest].healthCoursesDict[@"healthCourses"]];
    
    [self.heaCuMutableArray addObjectsFromArray:courseArray];
   
    Course *course =[[Course alloc] init];
    course.title = @"敬请期待";
    course.courseImageName = ExpectIconIconImageName;
    [self.heaCuMutableArray addObject:course];
    [self.tableView reloadData];
}
#pragma mark --datasource delegate


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
        if (btn.tag != weakSelf.heaCuMutableArray.count-1) {
            
            CourseDetailsViewController *courseDetailsVC = [CourseDetailsViewController new];
            courseDetailsVC.course = self.heaCuMutableArray[btn.tag];
            
            [weakSelf.navigationController pushViewController:courseDetailsVC animated:YES];
        }
     
        
    };

    return healthCoureCell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


- (UITableView *)tableView{
    if (_tableView) return _tableView;
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth , kScreenHeight -  NavBar_Height - 33 - TabBar_Height ) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = c255255255;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
    return _tableView;
}

@end
