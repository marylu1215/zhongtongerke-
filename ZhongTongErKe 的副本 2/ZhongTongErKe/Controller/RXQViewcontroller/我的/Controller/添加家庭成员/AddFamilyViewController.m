//
//  AddFamilyViewController.m
//  ZhongTongErKe
//
//  Created by khj on 2017/6/22.
//  Copyright © 2017年 Claf. All rights reserved.
//

#define MaxYear  120

#import "AddFamilyViewController.h"
#import "PersonInfoCell.h"
#import "ActionSheetView.h"
#import "UserTool.h"

@interface AddFamilyViewController ()<UITableViewDataSource,UITableViewDelegate,UIActionSheetDelegate,UITextFieldDelegate,UIAlertViewDelegate>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray *titleArr;
@property (nonatomic,strong) NSArray *placeHolderArr;
@property (nonatomic,strong) NSMutableArray *yearMutableArray;

@property (nonatomic ,copy) NSString *sex;
@property (nonatomic ,copy) NSString *year;
@property (nonatomic ,copy) NSString *nickName;
@end

@implementation AddFamilyViewController

-(NSMutableArray *)yearMutableArray
{
    if (!_yearMutableArray) {
        
        _yearMutableArray = [NSMutableArray new];
    }
    return _yearMutableArray;
}

- (void)viewWillAppear:(BOOL)animated{
    
    self.tabBarController.tabBar.hidden = YES;
}
- (void)viewWillDisappear:(BOOL)animated{
   
    self.tabBarController.tabBar.hidden = NO;
}
-(void)viewDidLoad{
    [super viewDidLoad];
   
    self.navigationItem.title = @"添加家庭成员资料";
    
    _titleArr = @[@"家庭成员昵称",@"性别",@"年龄"];
    _placeHolderArr = @[@"请填写家庭成员昵称",@"请选择性别",@"请选择年龄"];
   
    //界面
    [self confingUI];
}
#pragma mark - view
-(void)confingUI{
    // UI
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:(UITableViewStyleGrouped)];
    _tableView.backgroundColor = c255255255;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
    
    UIButton *button = [UIButton addBtnWithTitle:@"提交" WithBGImg:nil WithFont:Font13 WithTitleColor:c255255255 Target:self Action:@selector(submitAction)];
    button.backgroundColor = cHBColor;
    [self.view addSubview:button];
    button.sd_layout.widthIs(kScreenWidth).heightIs(px(100)).bottomSpaceToView(self.view,0);
    
    
}

#pragma mark - table代理
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.titleArr.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return px(84);
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
  
    return CGFLOAT_MIN;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return CGFLOAT_MIN;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    PersonInfoCell *cell = [PersonInfoCell cellWithTableView:tableView];
    cell.titleLabel.text = _titleArr[indexPath.section];
    NSString *detailStr = [self detailString:indexPath.section];
    

    
    if (indexPath.section == 1||indexPath.section == 2) {//选择Btn情况
        [cell.detailBtn setTitle:detailStr forState:(UIControlStateNormal)];
        [cell.detailBtn addTarget:self action:@selector(cellBtnChoose:) forControlEvents:(UIControlEventTouchUpInside)];
        cell.detailBtn.tag = 100 + indexPath.section;
        cell.detailBtn.hidden = NO;
        cell.detailTF.hidden = YES;
    }else{//输入框情况
        cell.detailTF.tag = 200 + indexPath.section;
        cell.detailBtn.hidden = YES;
        cell.detailTF.hidden = NO;
    }

        if ([self.placeHolderArr[indexPath.section] isEqualToString:detailStr]) {//未设置
            cell.detailTF.text = @"";
            cell.detailTF.placeholder = detailStr;
        }else{//设置前有值
            cell.detailTF.text = detailStr;
        }
  
       
    return cell;
}

#pragma mark - 选择 性别，年龄
-(void)cellBtnChoose:(UIButton *)btn{
    switch (btn.tag) {
        case 100+1:
            //性别
            [self chooseGender];
            break;
        case 100+2:
            //年龄
        
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
#pragma mark  C获取浇筑方式列表
-(void)chooseBirthday
{
    

    
    for (int index=0; index<MaxYear; index++) {
        
        NSString *yearStr = [NSString stringWithFormat:@"%d",index];
        [self.yearMutableArray addObject:yearStr];
    }
    
  [self showActionSheetViewWithTaskModelArray:self.yearMutableArray];
    
}
#pragma mark  弹出视图
- (void)showActionSheetViewWithTaskModelArray:(NSArray *)taskModelArray
{
    
    
   ActionSheetView *sheet = [[ActionSheetView alloc] initWithList:taskModelArray height:0 type:ActionSheetViewTypeDeviceType];
        
    NSIndexPath *index = [NSIndexPath indexPathForRow:0 inSection:2];
    
     PersonInfoCell *cell = [self.tableView cellForRowAtIndexPath:index];
    __block typeof(self)weakSelf = self;
    sheet.selectRowAtIndex = ^(NSInteger index){
       
        [cell.detailBtn setTitle:weakSelf .yearMutableArray[index] forState:(UIControlStateNormal)];
        weakSelf.year = weakSelf.yearMutableArray[index];
    };

        [sheet showInView:nil];
    

}


#pragma mark - UIActionSheet代理方法
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *btnTitle = [actionSheet buttonTitleAtIndex:buttonIndex];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:1];
    PersonInfoCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    [cell.detailBtn setTitle:btnTitle forState:(UIControlStateNormal)];
    self.sex =[actionSheet buttonTitleAtIndex:buttonIndex];

       
}
-(NSString *)saveCellAtIndex:(NSUInteger)index
{
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:index];
    PersonInfoCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    
    return cell.detailTF.text;
    
}
#pragma mark - 发起网络请求
#pragma mark - 保存
-(void)submitAction
{
    
    [self.view endEditing:YES];
    self.nickName = [self saveCellAtIndex:0];//姓名
   
        if (self.nickName.length == 0) {
            [MBProgressHUD showError:@"请输入昵称"];
            return;
        }
    
        //性别
        if (!self.sex.length) {
            [MBProgressHUD showError:@"请选择性别"];
            return;
        }
        //出生年月
        if (!self.year.length) {
            [MBProgressHUD showError:@"请选择年龄"];
            return;
        }
    
        [self updateInfoRequest];
    
        
  
    
}

- (void)updateInfoRequest
{
    kshowMessage(@"提交中...");
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"userid"] = [UserTool user].userid;
    params[@"nikename"] = self.nickName;
    params[@"sex"] = self.sex;
    params[@"year"] = self.year;
  

     [HttpTool postWithURL:updateUserInfoUrlUrl params:params success:^(id json) {
         
          [MBProgressHUD showSuccess:@"添加成功！"];
         [self.navigationController popViewControllerAnimated:YES];
         
     } failure:^(NSError *error) {
         
     }];
    
}

#pragma mark - privite
-(NSString *)detailString:(NSInteger)sectionNum{
    NSString *detailStr;
    switch (sectionNum) {
        case 0:
            detailStr = self.placeHolderArr[0];
            break;
        case 1:{
            detailStr = self.placeHolderArr[1];
        }
            break;
        case 2:
            detailStr = self.placeHolderArr[2];
            break;
            
            
        default:
            break;
    }
    return detailStr;
}
@end
