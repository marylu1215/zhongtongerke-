//
//  SSChooseHealthFileController.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/10.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSChooseHealthFileController.h"
#import "UIBarButtonItem+Common.h"
#import "SSBottomButton.h"
#import "SSChooseHealthFileCell.h"
#import "SSChooseDoctorController.h"
#import "FamilyGroup.h"
#import "AddFamilyViewController.h"

@interface SSChooseHealthFileController ()<UITableViewDelegate,UITableViewDataSource,SSChooseHealthFileCellDelegate>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic ,strong) NSArray *FamilyGroupArray;
@property (assign, nonatomic) NSIndexPath *selectedIndexPath;


@end

@implementation SSChooseHealthFileController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"选择健康档案";
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithBtnTitle:@"编辑" target:self action:@selector(edit)];

    [self loadData];
    
    
}
- (void)viewWillDisappear:(BOOL)animated{
    self.tabBarController.tabBar.hidden = NO;
    
}
- (void)viewWillAppear:(BOOL)animated{
    self.tabBarController.tabBar.hidden = YES;
}
-(void)loadData
{
   
    [self.tableView reloadData];
}
-(void)edit
{
    [self.navigationController pushViewController:[AddFamilyViewController new] animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
 
    
}


#pragma mark private action
- (void)configUI{
  
    UIView *headView = [[UIView alloc]init];
    headView.frame = CGRectMake(0, 0, kScreenWidth, px(66));
    UILabel *headLabel = [UILabel addLabelWithText:@"请选择为谁提问" AndFont:  Font13  AndAlpha:1.0 AndColor: cHBColor];
    headLabel.frame = CGRectMake(px(30), 0, kScreenWidth, px(66));
    [headView addSubview:headLabel];
    
    self.tableView.tableHeaderView = headView;
    
   
    UIButton *bottomButton = [UIButton addBtnWithTitle:@"完成" WithBGImg:nil WithFont:Font13 WithTitleColor:c255255255 Target:self Action:@selector(bottomButtomTaped)];
    bottomButton.backgroundColor = cHBColor;
    [self.view addSubview:bottomButton];
    bottomButton.sd_layout.widthIs(kScreenWidth).heightIs(50).bottomSpaceToView(self.view,0);
    
    
}

#pragma mark --action private
- (void)bottomButtomTaped{
    SSChooseDoctorController *vc = [[SSChooseDoctorController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}


#pragma mark --delegate datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.FamilyGroupArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return px(150)*kScreenHeightScale;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return px(10)*kScreenHeightScale;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    SSChooseHealthFileCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.familyGroup = self.FamilyGroupArray[indexPath.section];
   
    cell.delegate = self;
    cell.selectedIndexPath = indexPath;

    return cell;
}
- (void)handleSelectedButtonActionWithSelectedIndexPath:(NSIndexPath *)selectedIndexPath {
   
    SSChooseHealthFileCell *celled = [_tableView cellForRowAtIndexPath:_selectedIndexPath];
   
    
    [celled.checkButton setImage:[UIImage imageNamed:unchooseImageName] forState:UIControlStateNormal];
    celled.delegate = self;
    //记录当前选中的位置索引
    _selectedIndexPath = selectedIndexPath;
    
   
    
    //当前选择的打勾
     SSChooseHealthFileCell *cell = [_tableView cellForRowAtIndexPath:selectedIndexPath];
    [cell.checkButton setImage:[UIImage imageNamed:chooseIconImageName] forState:UIControlStateNormal];
}



- (UITableView *)tableView{
   
    if (!_tableView) {
        _tableView  = [[UITableView alloc]initWithFrame:CGRectMake(0,0,kScreenWidth,kScreenHeight) style:UITableViewStyleGrouped];
        _tableView.backgroundColor = c240240240;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[SSChooseHealthFileCell class] forCellReuseIdentifier:@"cell"];
        [self.view addSubview:self.tableView];
    }
    return _tableView;
}

@end
