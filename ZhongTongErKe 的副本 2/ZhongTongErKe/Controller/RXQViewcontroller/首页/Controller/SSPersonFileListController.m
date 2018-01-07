//
//  SSPersonFileListController.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/5.
//  Copyright © 2017年 Claf. All rights reserved.
//
NSString *const LMUserSexMale = @"男";
NSString *const LMUserSexFemale = @"女";
#import "SSPersonFileListController.h"
#import "SSPersonalFileListTableCell.h"
#import "SSPersonalFileListCellTwo.h"
#import "UIBarButtonItem+Common.h"
#import "XFDatePickerView.h"
#import "UIBarButtonItem+Common.h"
#import "KJUploadImage.h"
#import "JF_CalendarTools.h"
#import "UserTool.h"
#import "PersonInfoController.h"
#import "NSString+Tools.h"

@interface SSPersonFileListController ()<UITableViewDelegate,UITableViewDataSource,UIActionSheetDelegate,XFDatePickerViewDelegate,UIAlertViewDelegate>

@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong) NSArray *titleArr;
@property (nonatomic,strong) NSArray *placeHolderArr;

@end

@implementation SSPersonFileListController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = [NSString stringWithFormat:@"%@的个人资料",self.familyGroup.nikename];
    [self.view addSubview:self.tableView];
    
    _titleArr = @[@[@"用户名",@"性别",@"生日"],@[@"身高(cm)",@"体重(kg)"],@[@"婚姻状况",@"是否有小孩",@"文化程度",@"医保类型"]];
    
  
    _placeHolderArr = @[@[@"请填写用户名",@"请点击设置",@"请点击设置"],@[@"请填写身高",@"请填写体重"],@[@"请选择性填写",@"请选择性填写",@"请选择性填写",@"请点击填写"]];
    
    //右边编辑
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTitle:@"保存" target:self action:@selector(saveAction) font:font(15) color:c255255255 highlightColor:c255255255];
    
}
- (void)viewWillAppear:(BOOL)animated{
  
    self.tabBarController.tabBar.hidden = YES;
}
- (void)viewWillDisappear:(BOOL)animated{
     self.tabBarController.tabBar.hidden = NO;
}


-(void)loadData
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"id"] = self.familyGroup.cid;
    [MBProgressHUD showMessage:@"数据加载中..."];
    
    [HttpTool postWithURL:getPartyuser_info params:params success:^(id json) {
        
        ICLog(@"json menu:%@",json);
        
        if (jsonMsg(json)) {
            
            self.familyGroup = [FamilyGroup mj_objectWithKeyValues:json[@"data"]];
            
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

#pragma mark --datasource delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 40*kScreenHeightScale;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
   
    return CGFLOAT_MIN;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _titleArr.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
   
    NSArray *titleArr = _titleArr[section];
    return titleArr.count;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  
    
      NSString *detailStr = [self detailString:indexPath];
    
    if (indexPath.section == 0 &&indexPath.row == 0) {
      
        SSPersonalFileListCellTwo *listCell = [SSPersonalFileListCellTwo cellWithTableView:tableView];
       listCell.headLabel.text = self.titleArr[indexPath.section][indexPath.row];
       listCell.contentTextField.placeholder = detailStr;
       return listCell;
    }
    else
    {
        SSPersonalFileListTableCell *cell = [SSPersonalFileListTableCell cellWithTableView:tableView];
        cell.titleLabel.text = self.titleArr[indexPath.section][indexPath.row];
        
        
        if (indexPath.section == 0)
        {
            if (indexPath.row==1||indexPath.row==2) {
                [cell.detailBtn setTitle:detailStr forState:(UIControlStateNormal)];
                [cell.detailBtn addTarget:self action:@selector(cellBtnChoose:) forControlEvents:(UIControlEventTouchUpInside)];
                cell.detailBtn.tag = 100 + indexPath.row;
                cell.detailBtn.hidden = NO;
                cell.detailTF.hidden = YES;
            }
            
        }
        
        else{//输入框情况
            cell.detailTF.tag =  indexPath.section*10+indexPath.row;
            cell.detailBtn.hidden = YES;
            cell.detailTF.hidden = NO;
            cell.detailTF.placeholder = detailStr;
        }
        
        
        
        return cell;

    }
}

#pragma mark - 选择 性别，出生年月
-(void)cellBtnChoose:(UIButton *)btn{
    switch (btn.tag) {
        case 100+1:
            //性别
            [self chooseGender];
            break;
        case 100+2:
            //出生年月
            [self chooseBirthday];
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

#pragma mark -
-(void)chooseBirthday{
    [self.view endEditing:YES];
    // 弹出日期控件
    [self chooseTime];
}
//封装控件
-(void)chooseTime{
    NSString *currentDate;
    
    if (self.familyGroup.year.length)
{
   
    currentDate = [NSString ToTimeIntervalyyyyMMdd:self.familyGroup.year];
}
    
  XFDatePickerView *datePickerView = [[XFDatePickerView alloc]initWithCurrentDate: currentDate destinateYear:[JF_CalendarTools getYear] datePickerType:(XFDatePickerTypeYMD)];
    
    datePickerView.delegate = self;
    [datePickerView showInView:nil];
}
//选择日期代理
-(void)sureChooseDate:(XFDatePickerView *)datePicker chooseDateFormatterStr:(NSString *)dateFormatterStr TimeInterval:(NSString *)timeStr{
   
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:2 inSection:0];
    SSPersonalFileListTableCell  *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    self.familyGroup.year = dateFormatterStr;
    if (timeStr.length > 0) {
        
        [cell.detailBtn setTitle:dateFormatterStr forState:(UIControlStateNormal)];
    }else
    {
        [cell.detailBtn setTitle:@"" forState:(UIControlStateNormal)];
    }

}

#pragma mark - UIActionSheet代理方法
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *btnTitle = [actionSheet buttonTitleAtIndex:buttonIndex];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:1 inSection:0];
    SSPersonalFileListTableCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    
    if (buttonIndex == 0 || buttonIndex == 1) {
        [cell.detailBtn setTitle:btnTitle forState:(UIControlStateNormal)];
        
        self.familyGroup.sex = buttonIndex ?@"0":@"1";
    }
}

#pragma mark - privite
-(NSString *)detailString:(NSIndexPath *)indexPath {
   
     NSString *detailStr;
    
    if (indexPath.section==0) {
        
        if (indexPath.row==0) {
            
            detailStr =    [UserTool user].username.length?[UserTool user].username:self.placeHolderArr[indexPath.section][indexPath.row];
        }
        else if (indexPath.row==1)
        {
      
            detailStr = [UserTool user].sex.length?[UserTool user].sex.integerValue? LMUserSexMale: LMUserSexFemale:self.placeHolderArr[indexPath.section][indexPath.row];
        }
        else
        {
            detailStr = [UserTool user].year.length?[UserTool user].year:self.placeHolderArr[indexPath.section][indexPath.row];
        }
    }
    else if (indexPath.section==1)
    {
        if (indexPath.row==0) {
            
              detailStr =  [UserTool user].height.length? [UserTool user].height:self.placeHolderArr[indexPath.section][indexPath.row];
        }
        else
        {
            detailStr =  [UserTool user].weight.length? [UserTool user].weight:self.placeHolderArr[indexPath.section][indexPath.row];
        }
    }
    else
    {
        if (indexPath.row==0) {
            
             detailStr =  [UserTool user].marriage.length? [UserTool user].marriage:self.placeHolderArr[indexPath.section][indexPath.row];
        }
      else  if (indexPath.row==1) {
          
       
           detailStr =  [UserTool user].children.length?   [UserTool user].children:self.placeHolderArr[indexPath.section][indexPath.row];
        }
      else  if (indexPath.row==2) {
          
           detailStr = [UserTool user].culture.length?[UserTool user].culture:self.placeHolderArr[indexPath.section][indexPath.row];
        }
      else
      {
           detailStr = [UserTool user].medical_insurance.length? [UserTool user].medical_insurance:self.placeHolderArr[indexPath.section][indexPath.row];
          
      }
    }

    return detailStr;
}


#pragma mark - 保存
-(void)saveAction
{
    [self.view endEditing:YES];
    
   
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
   SSPersonalFileListCellTwo *listCell = [self.tableView cellForRowAtIndexPath:indexPath];

    if (!listCell.contentTextField.text.length) {
        self.familyGroup.nikename = listCell.contentTextField.text;//姓名
    }
   
    if (![self saveCellAtRow:0 Section:1].length) {
        self.familyGroup.height = [self saveCellAtRow:0 Section:1];//身高
    }
    
    if (![self saveCellAtRow:1 Section:1].length) {
          self.familyGroup.weight = [self saveCellAtRow:1 Section:1];//体重
    }
  
    if (![self saveCellAtRow:0 Section:2].length) {
        self.familyGroup.marriage = [self saveCellAtRow:0 Section:2];//婚姻

    }
    
    if (![self saveCellAtRow:1 Section:2].length) {
           self.familyGroup.children = [self saveCellAtRow:1 Section:2];//小孩
    }
    
    if (![self saveCellAtRow:2 Section:2].length) {
         self.familyGroup.culture = [self saveCellAtRow:2 Section:2];//文化
    }
    if ([self saveCellAtRow:3 Section:2].length) {
    
        self.familyGroup.medical_insurance = [self saveCellAtRow:3 Section:2];//医保

    }
    
    [self.tableView reloadData];
    
    
        //姓名
        if (self.familyGroup.nikename.length == 0) {
            [MBProgressHUD showError:@"请输入姓名"];
            return;
        }
    
        if (!self.familyGroup.sex) {
            
            [MBProgressHUD showError:@"请选择性别"];
            return;
        }
    
        if (self.familyGroup.year.length==0) {
            [MBProgressHUD showError:@"请选择出生年月"];
                    return;
                }
    
    if ( self.familyGroup.height.length==0) {
        [MBProgressHUD showError:@"请选择身高"];
        return;
    }
    
    if (self.familyGroup.weight.length==0) {
        [MBProgressHUD showError:@"请选择体重"];
        return;
    }
    
    
    [self updateInfoRequest];
    
    
    
}
-(NSString *)saveCellAtRow:(NSUInteger)row Section:(NSInteger )section
{
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:section];
     SSPersonalFileListTableCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    
    return cell.detailTF.text;
    
}
#pragma mark - 发起网络请求

- (void)updateInfoRequest
{
    kshowMessage(@"提交中...");
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    params[@"id"] = self.familyGroup.cid;
    params[@"biaoshi"] = self.type;
    params[@"username"] = self.familyGroup.nikename;
    params[@"sex"] = self.familyGroup.sex;
    params[@"birthday"] = self.familyGroup.year;
    params[@"height"] = self.familyGroup.height;
    params[@"height"] = self.familyGroup.height;
    params[@"weight"] = self.familyGroup.weight;
    params[@"marriage"] = self.familyGroup.marriage;
    params[@"culture"] = self.familyGroup.culture;
    params[@"medical_insurance"] = self.familyGroup.medical_insurance;
    params[@"children"] = self.familyGroup.children;
    
    [HttpTool postWithURL:getUserinfo_jfParty params:params success:^(id json) {
        
        ICLog(@"%@",json);
        
        if (jsonMsg(json)) {
            
        if (![self.type isEqualToString:@"jifen"]) {
            
           
            if ( [[UserTool user].userid isEqualToString:self.familyGroup.cid])
            {
                User *user = [User mj_objectWithKeyValues:json[@"data"]];
                // 保存数据
                [UserTool saveUserInfo:user];
            }
      
        
        }
           
        
        [self.navigationController popViewControllerAnimated:YES];
            
        }
        
        else
        {
        
        }
    } failure:^(NSError *error) {
       
        kHideHUD;
        netWorkError;
    }];
    
}



#pragma mark --lazyload
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-NavBar_Height) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}



@end
