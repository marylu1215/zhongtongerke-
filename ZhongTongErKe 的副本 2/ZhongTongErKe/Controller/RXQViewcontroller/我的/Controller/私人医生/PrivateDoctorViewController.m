//
//  PrivateDoctorViewController.m
//  ZhongTongErKe
//
//  Created by khj on 2017/6/1.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "PrivateDoctorViewController.h"
#import "PrivateDoctorView.h"
#import "SectionTitleView.h"
#import "RealNameTableViewCell.h"
#import "CombOptionTableCell.h"
#import "PayButton.h"
#import "UserTool.h"
#import "SSWZJudgeSuccessController.h"

@interface PrivateDoctorViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic ,strong) NSArray *sectionArray;
@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic ,copy) NSString *name;
@property (nonatomic ,copy) NSString *sex;
@property (nonatomic ,copy) NSString *tel;
@property (nonatomic ,copy) NSString *package;
@property (nonatomic ,copy) NSString *over_time;
@property (nonatomic ,copy) NSString *price;

@end

@implementation PrivateDoctorViewController


- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.title = @"私人医生";
    
    PrivateDoctorView *doctorView = [[PrivateDoctorView  alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, px(200))];
    doctorView.doctor = self.doctor;
    
    self.tableView.tableHeaderView = doctorView;
    
    self.sectionArray = @[@"实名信息",@"套餐选择"];
    
    
    UIButton *bottomButton = [UIButton addBtnWithTitle:@"立即购买" WithBGImg:nil WithFont:Font13 WithTitleColor:c255255255 Target:self Action:@selector(payAction)];
    bottomButton.backgroundColor = cHBColor;
    [self.view addSubview:bottomButton];
    bottomButton.sd_layout.widthIs(kScreenWidth).heightIs(50).bottomSpaceToView(self.view,0);
    
    
}

- (void)viewWillDisappear:(BOOL)animated{
    self.tabBarController.tabBar.hidden = NO;
    
}
- (void)viewWillAppear:(BOOL)animated{
    self.tabBarController.tabBar.hidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - table代理
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        
           return px(220);
    }
    else
    {
           CombOptionTableCell  *cell =  (CombOptionTableCell *)[self tableView:tableView cellForRowAtIndexPath:indexPath];
            return cell.bounds.size.height;
    }
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return px(80);
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    
    SectionTitleView *headerView = [[SectionTitleView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, px(80)) title:self.sectionArray[section]];
    
    return headerView;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return CGFLOAT_MIN;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        
        RealNameTableViewCell  *cell = [RealNameTableViewCell cellWithTableView:tableView];
        
        return cell;
    }
    else
    {
    
        CombOptionTableCell *cell = [ CombOptionTableCell cellWithTableView:tableView];
        cell.severViceArray = @[self.doctor.service.priDoctor[0],self.doctor.service.priDoctor[1],  [NSString stringWithFormat:@"%ld", [self.doctor.service.priDoctor[1] integerValue]*3]];
        return cell;
    }
  
}

-(void)payAction
{
    NSIndexPath *nameIndexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    
   RealNameTableViewCell  *nameCell = [self.tableView cellForRowAtIndexPath:nameIndexPath];
    self.name  = nameCell.nameTextField.text;//姓名
    self.sex = nameCell.sexBtn.titleLabel.text;//性别
    self.tel = nameCell.telTextField.text;//手机号
    
     NSIndexPath *optionIndexPath = [NSIndexPath indexPathForRow:0 inSection:1];
    
    
    CombOptionTableCell *optionCell = [self.tableView cellForRowAtIndexPath:optionIndexPath ];
    
    self.package = optionCell.selectButton.titleLabel.text;
    self.over_time = optionCell.timeLable.text;
    self.price = optionCell.priceLable.text;
    
    [self.tableView reloadData];
    
        //姓名
        if (self.name.length == 0) {
            [MBProgressHUD showError:@"请输入姓名"];
            return;
        }
        if (![NSString validatenickName:self.name]) {
            [MBProgressHUD showError:@"请输入正确格式的姓名"];
            return;
        }
        //性别
        if (self.sex.length==0) {
            [MBProgressHUD showError:@"请选择性别"];
            return;
        }
        // 验证手机号
        if (self.tel.length < 11 || ![NSString validateMobile:self.tel]) {
            [MBProgressHUD showError:@"请输入正确的手机号码"];
            return;
        }
        
    // 套餐
    if (self.package.length==0) {
        [MBProgressHUD showError:@"请选择套餐"];
        return;
    }
    
    // 到期时间
    if (self.over_time.length==0) {
        [MBProgressHUD showError:@"请选择到期时间"];
        return;
    }
    
    [self updateInfoRequest];
    
}


#pragma mark - 发起网络请求

- (void)updateInfoRequest
{
    [self.view endEditing:YES];
    
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"name"] = self.name;
    params[@"sex"] = self.sex;
    params[@"tel"] = self.tel;
    params[@"package"] = self.package;
    params[@"over_time"] = self.over_time;
    params[@"price"] = self.price;
    params[@"userid"] = [UserTool user].userid;
    
    [MBProgressHUD showMessage:@"数据提交中..."];
    
    [HttpTool postWithURL:getPrivateDoctorParty params:params success:^(id json) {
        ICLog(@"json menu:%@",json);
        
        if (jsonMsg(json)) {
            
            SSWZJudgeSuccessController *judgeVC = [SSWZJudgeSuccessController new];
            judgeVC.purchase = [[Purchase alloc]init];
            judgeVC.purchase.type = @"private_doctor";
            judgeVC.purchase.doName = self.doctor.name;
            judgeVC.purchase.price = self.price;
            [self.navigationController pushViewController:judgeVC animated:YES];
            
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

- (UITableView *)tableView{
    
    if (!_tableView) {
        _tableView  = [[UITableView alloc]initWithFrame:CGRectMake(0,0,kScreenWidth,kScreenHeight) style:UITableViewStyleGrouped];
        _tableView.backgroundColor = c240240240;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self.view addSubview:self.tableView];
    }
    return _tableView;
}


@end
