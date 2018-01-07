//
//  EvaluatHealthViewController.m
//  ZhongTongErKe
//
//  Created by khj on 2017/6/5.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "EvaluatHealthViewController.h"
#import "WorkTableViewCell.h"
#import "Subject.h"
#import "KJVerticalButton.h"
#import "LMImageView.h"
#import "SSSubjectListController.h"
@interface EvaluatHealthViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic ,strong) UITableView *tableView;

@property (nonatomic ,strong) NSArray *subjectArray;
@end

@implementation EvaluatHealthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
      UIView *view = [[UIView alloc]initWithFrame:CGRectZero];
      [self.view addSubview:view];
     [self.view addSubview:_tableView];
}


-(void)loadData
{
    [super loadData];
    
    [super loadData];
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    [MBProgressHUD showMessage:@"数据加载中..."];
    
    [HttpTool postWithURL:getcheshi_typ params:params success:^(id json) {
        ICLog(@"json menu:%@",json);
        
        if (jsonMsg(json)) {
            self.subjectArray =
            [Assessment mj_objectArrayWithKeyValuesArray:json[@"data"]];
            [self.tableView reloadData];
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
    
    [self.tableView reloadData];
    
    UIImage *image = [UIImage imageNamed:healthJudge_banner];
    
    LMImageView *imageView = [[LMImageView alloc]initWithFrame:CGRectMake(0, 0, image.size.width+10, image.size.height+10)];
    imageView.image = image;
    
    __weak typeof (self) weakSelf = self;
    imageView.backBlock = ^()
    {
        [weakSelf.navigationController popViewControllerAnimated:YES];
    };
    self.tableView.tableHeaderView = imageView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WorkTableViewCell *workCell = [WorkTableViewCell cellWithTableView:tableView];
    workCell.assessmentArray =  self.subjectArray;
   __weak typeof (self) weakSelf = self;
    workCell.selectBlock = ^(TitleButton *titleButton) {
        SSSubjectListController *subjectVC =    [SSSubjectListController new];
        subjectVC.assessment = weakSelf.subjectArray[titleButton.tag];
        [weakSelf.navigationController pushViewController:subjectVC animated:YES];
    };
    
    return workCell;
}

#pragma mark - header

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WorkTableViewCell *cell =  (WorkTableViewCell *)[self tableView:tableView cellForRowAtIndexPath:indexPath];
    return cell.bounds.size.height;
}
- (UITableView *)tableView{
    if (_tableView) return _tableView;
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth , kScreenHeight) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    return _tableView;
}
@end
