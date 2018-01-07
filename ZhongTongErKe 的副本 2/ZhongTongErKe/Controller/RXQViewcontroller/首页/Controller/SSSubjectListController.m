//
//  SSSubjectListController.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/4.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSSubjectListController.h"
#import "SSSubjectListHead.h"
#import "SSTestResultController.h"
#import "Subject.h"
#import "AnwserTableCell.h"
#import "MyAssessment.h"

@interface SSSubjectListController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *titleMuArr;
@property (nonatomic,strong) NSMutableArray *answerMuArr;
@property (nonatomic, assign) NSInteger currentIndex;
@property (nonatomic,strong) NSMutableArray *subjectMuArr;

@end

@implementation SSSubjectListController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.title = @"题目列表";
    [self.view addSubview:self.tableView];

}

- (void)viewWillAppear:(BOOL)animated{
    self.tabBarController.tabBar.hidden = YES;
    [self.subjectMuArr removeAllObjects];
    self.currentIndex=0;
    [self.tableView reloadData];
    
}
- (void)viewWillDisappear:(BOOL)animated{
    self.tabBarController.tabBar.hidden = NO;
}

-(void)loadData
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"id"] = self.assessment.cid;
    [MBProgressHUD showMessage:@"数据加载中..."];
    
    [HttpTool postWithURL:getHomePagecheshi params:params success:^(id json) {
        ICLog(@"json menu:%@",json);
        
        if (jsonMsg(json)) {
            
            NSArray *allArray = json[@"data"];
            for (NSDictionary *dic in allArray) {
                
                [self.titleMuArr addObject:dic.allKeys[0]];
            
                NSArray *subjectArr = [Subject mj_objectArrayWithKeyValuesArray:dic[dic.allKeys[0]]];
              
                [self.answerMuArr addObject:subjectArr];
                
            }
            
            
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

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark --datasource delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    AnwserTableCell *anwsercell =  (AnwserTableCell *)[self tableView:tableView cellForRowAtIndexPath:indexPath];
    return anwsercell.bounds.size.height;

}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    NSArray *answerArr;
    if (self.answerMuArr.count) {
        
        answerArr = self.answerMuArr[section];
    }
    
    return answerArr.count;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
     SSSubjectListHead *view = ( SSSubjectListHead *)[self tableView:tableView viewForHeaderInSection:section];
    return  view.bounds.size.height;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{

    SSSubjectListHead *headerview = [[SSSubjectListHead  alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, px(128))];
    
    MyAssessment * myAssessment = [MyAssessment new];
    myAssessment.assessment = self.assessment;
    myAssessment.numStr = [NSString stringWithFormat:@"%@/%@",[NSString stringWithFormat:@"%ld",self.currentIndex+1],[NSString stringWithFormat:@"%ld",self.titleMuArr.count]];
    if (self.titleMuArr.count) {
       myAssessment.subTitle = [NSString stringWithFormat:@"%@",self.titleMuArr[self.currentIndex]];
    }
    
    headerview.myassessment = myAssessment;
    
    headerview.frame = CGRectMake(0, 0, kScreenWidth, headerview.bounds.size.height);

    return headerview;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSArray *currentAnswer = self.answerMuArr[self.currentIndex];
    Subject *subject = currentAnswer[indexPath.row];
    
    [self.subjectMuArr addObject:subject];
    
    if (self.currentIndex==self.titleMuArr.count-1) {
        SSTestResultController *testvc = [[SSTestResultController alloc]init];
        testvc.subjectArray = self.subjectMuArr;
        testvc.assessment = self.assessment;
        [self.navigationController pushViewController:testvc animated:YES];
    }
    else
    {
        self.currentIndex++;
        [self.tableView reloadData];
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    AnwserTableCell *anwserCell = [AnwserTableCell cellWithTableView:tableView ];
    NSArray *anwserArray = self.answerMuArr[self.currentIndex];
    
    anwserCell.subject = anwserArray[indexPath.row];
    
    return anwserCell;
    
}

#pragma mark --lazyLoad
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight- 49) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}

-(NSMutableArray *)titleMuArr
{
    if (!_titleMuArr) {
        
        _titleMuArr = [NSMutableArray new];
    }
    return  _titleMuArr;
}
-(NSMutableArray *)answerMuArr
{
    if (!_answerMuArr) {
        
        _answerMuArr = [NSMutableArray new];
    }
    return _answerMuArr;
}

-(NSMutableArray *)subjectMuArr
{
    if (!_subjectMuArr) {
        
        _subjectMuArr = [NSMutableArray new];
    }
    return _subjectMuArr;
}
@end
