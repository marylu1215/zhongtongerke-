//
//  SSChooseDoctorController.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/10.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSChooseDoctorController.h"
#import "SSBottomButton.h"
#import "SSChooseDoctorCell.h"
#import "SSChooseDocDefaultCell.h"
#import "SSDoctorJudgeController.h"
#import "SSVoiceQuestionController.h"
#import "QuDetailViewController.h"


static NSString *cellIdentifier = @"cell";
static NSString *cellIdentifierDefault = @"cellDefault";


@interface SSChooseDoctorController ()<UITableViewDelegate,UITableViewDataSource,SSChooseDocDefaultCellDelegate,SSChooseDoctorCellDelegate>

@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)SSBottomButton *bottomButton;
@property (assign, nonatomic) NSIndexPath *selectedIndexPath;

@end

@implementation SSChooseDoctorController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"选择医生";
    [self addSubviews];
    [self makeConstraits];
}
- (void)addSubviews{
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.bottomButton];
}
- (void)makeConstraits{
    [self.bottomButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(kScreenWidth, 50*kScreenHeightScale));
        make.left.mas_equalTo(0);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewWillDisappear:(BOOL)animated{
    self.tabBarController.tabBar.hidden = NO;
    
}
- (void)viewWillAppear:(BOOL)animated{
    self.tabBarController.tabBar.hidden = YES;
}

#pragma mark --action private
- (void)bottomButtonTaped:(SSBottomButton *)sender{
  
    QuDetailViewController *vc = [[QuDetailViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark --delegate datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }
    return 7;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 107*kScreenHeightScale;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        SSChooseDocDefaultCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifierDefault];
        cell.headImageView.image = [UIImage imageNamed:chooseDoc_default];
        cell.nameLabel.text = @"系统指派医生";
        cell.describeLabel.text = @"二级以上医院医生 限20次对话";
        cell.detailLabel.text = @"积分200 （现有300）";
        cell.priceLabel.text = @"20/次";
        cell.delegate = self;
        cell.selectedIndexPath = indexPath;
        return cell;
    }
    
    SSChooseDoctorCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    cell.headImageView.image = [UIImage imageNamed:@"1"];
    cell.nameLabel.text = @"王跃程";
    cell.describeLabel.text = @"呼吸内科 住院医生";
    cell.detailLabel.text = @"擅长：呼吸内科常见病，打喷嚏，喉咙痒，口干，头疼，嗓子疼，痰多，干呕，呼吸困难，流鼻涕，气喘，等等";
    cell.priceLabel.text = @"20/次";
    cell.delegate = self;
    cell.selectedIndexPath = indexPath;
    return cell;
}
- (void)handleSelectedButtonActionWithSelectedIndexPath:(NSIndexPath *)selectedIndexPath {
    
    if (selectedIndexPath.section==0) {
        
        SSChooseDocDefaultCell *celled = [_tableView cellForRowAtIndexPath:_selectedIndexPath];
        [celled.checkButton setImage:[UIImage imageNamed:unchooseImageName] forState:UIControlStateNormal];
        celled.delegate = self;
        //记录当前选中的位置索引
        _selectedIndexPath = selectedIndexPath;
        
        //当前选择的打勾
         SSChooseDocDefaultCell *cell = [_tableView cellForRowAtIndexPath:selectedIndexPath];
        [cell.checkButton setImage:[UIImage imageNamed:chooseIconImageName] forState:UIControlStateNormal];
    }
    else
    {
         SSChooseDoctorCell *celled = [_tableView cellForRowAtIndexPath:_selectedIndexPath];
        [celled.checkButton setImage:[UIImage imageNamed:unchooseImageName] forState:UIControlStateNormal];
        celled.delegate = self;
        //记录当前选中的位置索引
        _selectedIndexPath = selectedIndexPath;
        
        //当前选择的打勾
        SSChooseDoctorCell *cell = [_tableView cellForRowAtIndexPath:selectedIndexPath];
        [cell.checkButton setImage:[UIImage imageNamed:chooseIconImageName] forState:UIControlStateNormal];
    }

 
}


- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-64-NavBar_Height) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[SSChooseDoctorCell class] forCellReuseIdentifier:cellIdentifier];
        [_tableView registerClass:[SSChooseDocDefaultCell class] forCellReuseIdentifier:cellIdentifierDefault];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}

- (SSBottomButton *)bottomButton{
    if (!_bottomButton) {
        _bottomButton = [SSBottomButton loadBottomButtonWithTitle:@"提问（0）元"];
        [_bottomButton addTarget:self action:@selector(bottomButtonTaped:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _bottomButton;
}

@end
