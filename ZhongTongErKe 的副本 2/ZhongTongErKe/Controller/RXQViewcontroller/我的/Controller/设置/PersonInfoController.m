//
//  PersonInfoController.m
//  MagicFinger
//
//  Created by xufeng on 16/5/18.
//  Copyright © 2016年 zeenc. All rights reserved.
//
/** PersonalInfo模型-性别属性值 */
NSString *const KJUserSexMale = @"男";
NSString *const KJUserSexFemale = @"女";
#import "PersonInfoController.h"
#import "PersonInfoHeaderView.h"
#import "PersonInfoCell.h"
#import "UIBarButtonItem+Common.h"
#import "KJUploadImage.h"
#import "User.h"

@interface PersonInfoController ()<UITableViewDataSource,UITableViewDelegate,UIActionSheetDelegate,UITextFieldDelegate,KJUploadImageDelegate,UIAlertViewDelegate>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray *titleArr;
@property (nonatomic,strong) NSArray *placeHolderArr;
@property (nonatomic,strong) PersonInfoHeaderView *headerView;
@property (nonatomic,strong) User *userChange;
@property (nonatomic,assign,getter=isEdit) BOOL edit;
@property (nonatomic,assign,getter=isfirstClick) BOOL firstClick;
@property (nonatomic, copy) NSString *headerUrl;

@end
@implementation PersonInfoController

-(void)viewDidLoad{
    [super viewDidLoad];
    self.navigationItem.title = @"用户设置";
    _titleArr = @[@[@"用户名"], @[@"手机号",@"邮箱"]];
    _placeHolderArr = @[@[@"请填写真实姓名"], @[@"请填写手机",@"请填写邮箱"]];
    self.userChange = [UserTool user];
    self.edit = NO;
    //右边编辑
    UIBarButtonItem *rightBarButton = [UIBarButtonItem itemWithTitle:@"编辑" target:self action:@selector(editAction) font:font(15) color:c255255255 highlightColor:TITLE_COLOR];
    self.navigationItem.rightBarButtonItem = rightBarButton;
    
    UIButton *backBtn = self.navigationItem.leftBarButtonItem.customView;
    backBtn.tag = 2222;
    [backBtn addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    
    self.firstClick = YES;
    //界面
    [self confingUI];
}
- (void)viewWillAppear:(BOOL)animated{
  
    self.tabBarController.tabBar.hidden = YES;
}
- (void)viewWillDisappear:(BOOL)animated{
 
    self.tabBarController.tabBar.hidden = NO;
}
#pragma mark - view
-(void)confingUI{
    // UI
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:(UITableViewStyleGrouped)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = BACKGROUND_COLOR;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
    //头
    _headerView = [[PersonInfoHeaderView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, px(170))];
    _headerView.user = [UserTool user];
    _headerView.avatarIV.userInteractionEnabled = NO;
    __weak typeof(self) weakSelf = self;
    _headerView.avatarIVClickBlock = ^(){
        [weakSelf choosePhoto];
    };
    _tableView.tableHeaderView = _headerView;
    [self.tableView reloadData];
}

-(void)backAction
{
    if ([self.navigationItem.title isEqualToString:@"修改个人资料"]) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"" message:@"有未保存的资料，是否确认退出？" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alertView show];
    }
    
    else
    {
        [self.navigationController popViewControllerAnimated:YES];
    }
    
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        [self.navigationController popViewControllerAnimated:YES];
    }
}
#pragma mark  编辑
-(void)editAction
{
    self.edit = YES;
    if (![self.navigationItem.rightBarButtonItem.title isEqualToString:@"编辑"]) {
        if (self.firstClick) {
            _headerView.avatarIV.userInteractionEnabled = YES;
            [self.tableView reloadData];
            self.firstClick = NO;
        }
        
    }
    
    self.navigationItem.title = @"修改个人资料";
    UIButton *btn = self.navigationItem.rightBarButtonItem.customView;
    [btn setTitle:@"保存" forState:UIControlStateNormal];
    [btn removeTarget:self action:@selector(editAction) forControlEvents:UIControlEventTouchUpInside];
    [btn addTarget:self action:@selector(saveAction) forControlEvents:UIControlEventTouchUpInside];
}
#pragma mark - table代理

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section==0) {
        return px(20);
    }
    else
    {
        return CGFLOAT_MIN;
    }
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
      return _titleArr.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
   NSArray *titleArr = self.titleArr[section];
    return titleArr.count;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 30;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    PersonInfoCell *cell = [PersonInfoCell cellWithTableView:tableView];
    NSArray *titleArray = self.titleArr[indexPath.section];
    cell.titleLabel.text = titleArray[indexPath.row];
    NSString *detailStr = [self detailString:indexPath.section and:indexPath.row];
    
    cell.detailTF.tag = indexPath.section*10+indexPath.row+1;
    cell.detailBtn.hidden = YES;
    cell.detailTF.hidden = NO;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (self.isEdit) {
        cell.userInteractionEnabled = YES;
        NSArray *placeHolderArr  = self.placeHolderArr[indexPath.section];
        
        if ([placeHolderArr[indexPath.row] isEqualToString:detailStr]) {//未设置
            cell.detailTF.text = @"";
            cell.detailTF.placeholder = detailStr;
        }else{//设置前有值
            cell.detailTF.text = detailStr;
        }
    }else{
        cell.userInteractionEnabled = NO;
        cell.detailTF.text = detailStr;
        
    }
    return cell;
}
//选择照片
-(void)choosePhoto{
    
    NSLog(@"选择拍摄照片");
    [self.view endEditing:YES];
    KJUPLOAD_IMAGE.sheetStyle = ActionSheetStyleSystem;
    KJUPLOAD_IMAGE.isPopView = NO;
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:nil
                                                       delegate:nil
                                              cancelButtonTitle:@"取消"
                                         destructiveButtonTitle:nil
                                              otherButtonTitles:@"相册", @"拍照", nil];
    KJUPLOAD_IMAGE.sheet = sheet;
    KJUPLOAD_IMAGE.allowsEditing = YES;
    [KJUPLOAD_IMAGE showActionSheetInFatherViewController:self delegate:self];
}

//实现代理方法即可
#pragma mark - KJUploadImageDelegate
- (void)uploadImageToServerWithImage:(UIImage *)image pathStr:(NSString *)pathStr{
    
    _headerView.avatarIV.image = image;
}


#pragma mark - 保存
-(void)saveAction
{
    [self.view endEditing:YES];
        //姓名
        if ([self saveCellAtRow:0 Section:0].length == 0) {
            [MBProgressHUD showError:@"请输入姓名"];
            return;
        }
        if (![NSString validatenickName:[self saveCellAtRow:0 Section:0]]) {
            [MBProgressHUD showError:@"请输入正确格式的姓名"];
            return;
        }
        // 验证手机号
        if ([self saveCellAtRow:0 Section:1].length < 11 || ![NSString validateMobile:[self saveCellAtRow:0 Section:1]]) {
            [MBProgressHUD showError:@"请输入正确的手机号码"];
            return;
        }
        //邮箱
        if (![NSString validateEmail:[self saveCellAtRow:1 Section:1]]) {
            [MBProgressHUD showError:@"请输入正确的邮箱"];
            return;
        }
    
    //** 修改个人资料 */
    [self updateInfoRequest];

}

-(NSString *)saveCellAtRow:(NSUInteger)row Section:(NSInteger )section
{
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:section];
    PersonInfoCell *cell  = [self.tableView cellForRowAtIndexPath:indexPath];
    
    return cell.detailTF.text;
    
}

#pragma mark - privite
-(NSString *)detailString:(NSInteger)sectionNum and:(NSInteger )rowNum
{
    NSString *detailStr;
    if (sectionNum==0) {
        if (rowNum==0) {
            NSArray *placeHolderArr = self.placeHolderArr[sectionNum];
            
           detailStr = self.userChange.username.length?self.userChange.username:(self.edit?placeHolderArr[rowNum]:@"未设置");
        }
    }
    else
    {
         NSArray *placeHolderArr = self.placeHolderArr[sectionNum];
        if (rowNum==0) {
           
            detailStr = self.userChange.mobile.length?self.userChange.mobile:(self.edit?placeHolderArr[rowNum]:@"未设置");
        }
        else
        {
           detailStr = self.userChange.email.length?self.userChange.email:(self.edit?placeHolderArr[rowNum]:@"未设置");
        }
    }

    return detailStr;
}

- (void)updateInfoRequest
{
    kshowMessage(@"提交中...");
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
   
    params[@"id"] = [UserTool user].userid;
    params[@"username"] = [self saveCellAtRow:0 Section:0];
    params[@"phone"] = [self saveCellAtRow:0 Section:1];
    params[@"email"] = [self saveCellAtRow:1 Section:1];
    params[@"img"] = [UIImageJPEGRepresentation(self.headerView.avatarIV.image, 1.0f) base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    [HttpTool postWithURL:getUser_szParty params:params success:^(id json)
    {
        if (jsonMsg(json)) {
           // NSLog(@"---用户修改头像和用户设置:%@",json);
            User *user = [User  mj_objectWithKeyValues:json[@"data"]];
            
            NSDictionary *dic = json[@"data"];
            NSURL *url = dic[@"head"];
            
            NSString *str = [NSString stringWithFormat:@"%@",url];
            
        //NSLog(@"输出strulr:%@",str);
            
            NSUserDefaults *usertwo = [NSUserDefaults standardUserDefaults];
            [usertwo setObject:str forKey:@"headstr"];
            [usertwo synchronize];
            
            
            [UserTool saveUserInfo:user];
            
            [self.navigationController popViewControllerAnimated:YES];
            
        }
        
    } failure:^(NSError *error) {
        
    }];
    
//    NSString *onestr = ImageBaseURL;
//    NSString *twostr = getUser_szParty;
//    NSString *touxiang = @"http://yf.xnetyy.com/Party/user_sz";
//    
//    [NSObject POST:touxiang parameters:params progress:^(NSProgress *downloadProgress) {
//        
//    } completionHandler:^(id responseObj, NSError *error) {
//                    NSLog(@"---用户修改头像和用户设置:%@",responseObj);
//        
//                   User *user = [User  mj_objectWithKeyValues:responseObj[@"data"]];
//                    [UserTool saveUserInfo:user];
//        
//                    [self.navigationController popViewControllerAnimated:YES];
//
//        
//    }];
    
}


@end
