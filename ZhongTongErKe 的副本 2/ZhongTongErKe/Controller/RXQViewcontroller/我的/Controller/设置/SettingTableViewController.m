
//
//  SettingTableViewController.m
//  ZhongTongErKe
//
//  Created by khj on 2017/5/29.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SettingTableViewController.h"
#import "PersonInfoController.h"
#import "LMRevisePWDViewController.h"
#import "MessageViewController.h"
#import "SSInTableViewCell.h"
#import "UserTool.h"
#import "AppDelegate.h"
#import "AboutOurViewController.h"

#import <RongIMKit/RongIMKit.h>
#import "UserTool.h"
#import <RongIMKit/RCIM.h>


@interface SettingTableViewController ()<UIActionSheetDelegate,UITableViewDelegate,UITableViewDataSource,RCIMUserInfoDataSource>

@property (nonatomic ,strong) NSArray *titleArray;
@property (nonatomic ,strong) NSArray *imageArray;
@property (nonatomic ,strong) UITableView *tableView;

@end

@implementation SettingTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"设置";
    [self.view addSubview:self.tableView];
    
  
    UIButton *quitBtn =[UIButton addBtnWithTitle:@"退出登录" WithBGImg:nil WithFont:Font13 WithTitleColor:c255255255 Target:self Action:@selector(actonQuit)];
    quitBtn.backgroundColor = cHBColor;
    quitBtn.layer.cornerRadius =6;
    quitBtn.clipsToBounds  = YES;
    [self.view addSubview:quitBtn];
     quitBtn.sd_layout.widthIs(kScreenWidth-2*px(30)).heightIs(px(80)).bottomSpaceToView(self.view,px(30)).centerXEqualToView(self.view);
  
    [[RCIM sharedRCIM] setUserInfoDataSource:self];
}

- (void)viewWillAppear:(BOOL)animated{

    self.tabBarController.tabBar.hidden = YES;
}
- (void)viewWillDisappear:(BOOL)animated{
 
    self.tabBarController.tabBar.hidden = NO;
}


#pragma mark 退出
-(void)actonQuit
{
    UIActionSheet *actionSheet=[[UIActionSheet alloc]initWithTitle:@"退出账户后再重新登录可能会有部分数据异常，在[设置]中清除数据恢复正常" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"退出登录" otherButtonTitles:nil, nil];
    [actionSheet showInView:self.view];
}
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    //取消
    if (buttonIndex == 1) return;
    if(buttonIndex == 0)
    {
        [UserTool  deleteUser];
        
       [self.navigationController popToRootViewControllerAnimated:YES];
   
    }
}



#pragma mark - Table view data source

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.titleArray.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    NSArray *titleArr = self.titleArray[section];
    return titleArr.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return CGFLOAT_MIN;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return px(20);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    SSInTableViewCell *cell = [SSInTableViewCell cellWithTableView:tableView];
    
    NSArray *imageArray = self.imageArray[indexPath.section];
    cell.headImageView.image = [UIImage imageNamed:imageArray[indexPath.row]];
    
    NSArray *titleArr = self.titleArray[indexPath.section];
    cell.infoLabel.text = titleArr[indexPath.row];
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 30;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section==0) {
        
        if (indexPath.row==0) {
            //用户设置
            [self.navigationController pushViewController:[UserTool user].userid.length?[PersonInfoController new]:[LoginViewController new] animated:YES];
        }
        
        else if (indexPath.row==1)
        {
             [self.navigationController pushViewController:[LMRevisePWDViewController new] animated:YES];
        }
        else
        {
            //消息通知
            [self.navigationController pushViewController:[MessageViewController new] animated:YES];
        }
    }
    else if (indexPath.section==1)
    {
        //清除缓存
        [self clearCacheSuccess];
        
        //环信清除缓存
        
    }
   
     else
    {
        [self.navigationController pushViewController:[AboutOurViewController new] animated:YES];
        
    }
}


-(NSArray *)titleArray
{
    if (!_titleArray) {
        
        _titleArray = @[@[@"用户设置",@"修改密码",@"消息通知" ],@[@"清除缓存"],@[@"关于我们"]];
    }
    return _titleArray;
}

-(NSArray *)imageArray
{
    if (!_imageArray) {
        _imageArray = @[@[userSettingsImageName,changeNumImageName,messageImageName],@[clearCacheImageName],@[aboutIconImageName]];
    }
    return _imageArray;
}
//-(void)clearUserInfoCache{
//    [MBProgressHUD showSuccess:@"融云清除"];
//}
#pragma mark * 清除缓存
-(void)actionClear
{
    
    dispatch_async(
                   dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
                   , ^{
                       
                       
                       [self clearUpLibraryDirectory];
                       [self clearUpSDocumentDirectory];
                       [self clearUpTemporaryDirectory];
                       [self performSelectorOnMainThread:@selector(clearCacheSuccess) withObject:nil waitUntilDone:YES];
                   });
}


-(void)clearCacheSuccess
{
    
    
    [MBProgressHUD showSuccess:@"清除缓存成功"];
    
}

#pragma mark -清除Document 数据
- (void)clearUpSDocumentDirectory
{
    NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES) firstObject];
    
    NSArray *documentfiles = [[NSFileManager defaultManager] subpathsAtPath:documentPath];
    
    for (NSString *dp in documentfiles) {
        NSError *error;
        if (![dp isEqualToString:@"switchchoose.data"]) {
            NSString *path = [documentPath stringByAppendingPathComponent:dp];
            if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
                [[NSFileManager defaultManager] removeItemAtPath:path error:&error];
            }
        }
        
    }
}
#pragma mark 清除TemporaryDirectory数据
- (void)clearUpTemporaryDirectory
{
    NSString *tmpPath = NSTemporaryDirectory();
    NSArray *tmpfiles = [[NSFileManager defaultManager] subpathsAtPath:tmpPath];
    
    for (NSString *tp in tmpfiles) {
        NSError *error;
        NSString *path = [tmpPath stringByAppendingPathComponent:tp];
        if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
            [[NSFileManager defaultManager] removeItemAtPath:path error:&error];
        }
    }
}

#pragma mark  清除LibraryDirectory数据
- (void)clearUpLibraryDirectory
{
    NSString *cachPath = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory,NSUserDomainMask, YES) firstObject];
    
    NSArray *files = [[NSFileManager defaultManager] subpathsAtPath:cachPath];
    
    for (NSString *p in files) {
        NSError *error;
        NSString *path = [cachPath stringByAppendingPathComponent:p];
        if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
            [[NSFileManager defaultManager] removeItemAtPath:path error:&error];
        }
    }
    
}
- (UITableView *)tableView{
    if (_tableView) return _tableView;
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth , kScreenHeight-NavBar_Height) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor=[UIColor colorWithHexString:@"e9e9e9"];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    return _tableView;
}

@end
