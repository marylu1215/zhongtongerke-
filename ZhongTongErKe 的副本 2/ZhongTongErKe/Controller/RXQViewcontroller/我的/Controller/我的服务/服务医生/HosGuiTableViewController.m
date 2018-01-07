//
//  HosGuiTableViewController.m
//  ZhongTongErKe
//
//  Created by khj on 2017/6/1.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "HosGuiTableViewController.h"
#import "HosGuiView.h"
#import "SectionTitleView.h"
#import "PersonInfoCell.h"
#import "SSWZJudgeSuccessController.h"
#import "UserTool.h"

@interface HosGuiTableViewController ()<UITableViewDataSource,UITableViewDelegate,UIActionSheetDelegate,UITextFieldDelegate,UIAlertViewDelegate>

@property (nonatomic , strong) NSArray *sectionArray;
@property (nonatomic,strong)   UITableView *tableView;
@property (nonatomic,strong)   NSArray *placeHolderArr;
@property (nonatomic,strong)   NSArray *sectionTitleArr;
@property (nonatomic,weak) HosGuiView *hosGuiView;

@property (nonatomic,copy)   NSString *name;
@property (nonatomic,copy)   NSString *sex;
@property (nonatomic,copy)   NSString *tel;
@property (nonatomic,copy)   NSString *hospital;
@property (nonatomic,copy)   NSString *department;
@property (nonatomic,copy)   NSString *bed;
@property (nonatomic,copy)   NSString *result;
@end

@implementation HosGuiTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"院后指导";
    [self.view addSubview:self.tableView];
    [self.tableView reloadData];
    [self setHeaderView];
    [self setBottomView];
}

#pragma mark - view
-(void)setHeaderView
{
   
    HosGuiView *hosGuiView = [[HosGuiView  alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, px(200))];
    hosGuiView.doctor = self.doctor;
    self.tableView.tableHeaderView = hosGuiView;
    self.hosGuiView = hosGuiView;
    
}

-(void)setBottomView
{
    UIButton *submitBtn = [UIButton addBtnWithTitle:@"确认购买" WithBGImg:nil WithFont:Font13 WithTitleColor:c255255255 Target:self Action:@selector(submitAction)];
    submitBtn.backgroundColor = cHBColor;
    submitBtn.layer.cornerRadius =6;
    submitBtn.clipsToBounds = YES;
    [self.view addSubview:submitBtn];
    submitBtn.sd_layout.widthIs(kScreenWidth).heightIs(px(100)).bottomSpaceToView(self.view,0);

}
-(void)loadData
{
   
            
    _sectionArray = @[ @[@"姓名",@"性别",@"手机号"] ,@[@"医院",@"科室",@"床号",@"诊断结果"]];
    _placeHolderArr = @[@[@"请输入姓名",@"请输入性别",@"医生可以通过手机号联系到您"], @[@"请输入医院名字",@"请输入科室",@"请输入床号",@"请输入诊断结果"]];
    _sectionTitleArr = @[@"实名信息",@"住院信息"];
    
    [self.tableView reloadData];
    
}
#pragma mark - table代理
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    NSArray *sectionArray = self.sectionArray[section];
    return sectionArray.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    return px(60);
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
  
    return px(80);
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    

    SectionTitleView *headerView = [[SectionTitleView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, px(80)) title:self.sectionTitleArr[section]];
    
    return headerView;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return CGFLOAT_MIN;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    PersonInfoCell *cell = [PersonInfoCell cellWithTableView:tableView];
    NSArray *sectionArray = self.sectionArray[indexPath.section];
    cell.titleLabel.text = sectionArray[indexPath.row];
  
    NSString *detailStr = [self detailString:indexPath.section AndRow:indexPath.row];
    cell.detailTF.placeholder = detailStr;
    
    if (indexPath.section == 0&&indexPath.row== 1) {//选择Btn情况
        [cell.detailBtn setTitle:detailStr forState:(UIControlStateNormal)];
        [cell.detailBtn addTarget:self action:@selector(cellBtnChoose:) forControlEvents:(UIControlEventTouchUpInside)];
        cell.detailBtn.hidden = NO;
        cell.detailTF.hidden = YES;
    }else{//输入框情况
        cell.detailBtn.hidden = YES;
        cell.detailTF.hidden = NO;
        cell.detailTF.tag = indexPath.section*20+indexPath.row;
    }
   
    return cell;

}

#pragma mark - 选择 性别，出生年月
-(void)cellBtnChoose:(UIButton *)btn{
  
      [self chooseGender];
    
    switch (btn.tag) {
        case 100+1:
            //性别
            [self chooseGender];
            break;
        case 100+2:
            break;
            
        default:
            break;
    }
}
-(void)chooseGender{
    // 弹出UIActionSheet
    [self.view endEditing:YES];
    UIActionSheet *action = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"男" otherButtonTitles:@"女",nil] ;
    [action showInView:self.view];
}


#pragma mark - UIActionSheet代理方法
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *btnTitle = [actionSheet buttonTitleAtIndex:buttonIndex];
    self.sex= btnTitle;
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:1 inSection:0];
    PersonInfoCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    
    if (buttonIndex == 0 || buttonIndex == 1) {
        [cell.detailBtn setTitle:btnTitle forState:(UIControlStateNormal)];
    }
}

#pragma mark - 保存
-(void)submitAction
{
    [self.view endEditing:YES];
    self.name  = [self saveCellAtRow:0 section:0];//姓名
    self.tel = [self saveCellAtRow:2 section:0];//手机
    
    self.hospital = [self saveCellAtRow:0 section:1];//医院
    self.department = [self saveCellAtRow:1 section:1];//科室
    self.bed = [self saveCellAtRow:2 section:1];//床号
     self.result = [self saveCellAtRow:3 section:1];//床号
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
        
        //医院
        if (self.hospital.length==0) {
            [MBProgressHUD showError:@"请输入医院名字"];
            return;
        }
        
        //科室
        if (self.department.length==0) {
            [MBProgressHUD showError:@"请输入科室"];
            return;
        }
    
    //床号
      if (self.bed.length==0) {
        [MBProgressHUD showError:@"请输入床号"];
          return;
      }
    //诊断结果
     if (self.result.length==0) {
        [MBProgressHUD showError:@"请输入诊断结果"];
        return;
    }
  
    //** 院后指导 */
    [self updateInfoRequest];
    
}

-(NSString *)saveCellAtRow:(NSInteger)row section:(NSInteger)section
{
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:section];
    
    PersonInfoCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    return cell.detailTF.text;
    
}
#pragma mark - 发起网络请求

- (void)updateInfoRequest
{
    [self.view endEditing:YES];
    
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"userid"] = [UserTool user].userid;
    params[@"num"] =  [NSString stringWithFormat:@"%d",self.hosGuiView.numberChoose.number];
    params[@"price"] = self.doctor.service.guidance[0];
    params[@"name"] = self.name;
    params[@"sex"] = self.sex;
    params[@"tel"] = self.tel;
    params[@"hospital"] = self.hospital;
    params[@"department"] = self.department;
    params[@"bed"] = self.bed;
    params[@"result"] = self.result;
    
    [MBProgressHUD showMessage:@"数据提交中..."];
    
    [HttpTool postWithURL:getGuidanceParty params:params success:^(id json) {
        ICLog(@"json menu:%@",json);
        
        if (jsonMsg(json)) {
            
            SSWZJudgeSuccessController *judgeVC = [SSWZJudgeSuccessController new];
            judgeVC.purchase = [[Purchase alloc]init];
            judgeVC.purchase.type = @"guidance";
            judgeVC.purchase.doName = self.doctor.name;
            judgeVC.purchase.price = self.doctor.service.guidance[0];
            
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

#pragma mark - privite
-(NSString *)detailString:(NSInteger)sectionNum AndRow:(NSInteger )row{
   
    NSString *detailStr;
    
    NSArray *defArr = self.placeHolderArr[sectionNum];
    detailStr = defArr[row];
   return detailStr;
}
- (void)viewWillDisappear:(BOOL)animated{
    self.tabBarController.tabBar.hidden = NO;
    
}
- (void)viewWillAppear:(BOOL)animated{
    self.tabBarController.tabBar.hidden = YES;
}


- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight -  NavBar_Height- TabBar_Height) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}

@end
