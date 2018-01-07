//
//  XFWorkBaseTableViewController.m
//  MagicFinger
//
//  Created by xufeng on 16/6/6.
//  Copyright © 2016年 zeenc. All rights reserved.
//

#import "XFWorkBaseTableViewController.h"

@interface XFWorkBaseTableViewController ()

@property (nonatomic,strong) UIView *naviLine;

@end

@implementation XFWorkBaseTableViewController

#pragma mark - init

//-(instancetype)initWithStyle:(UITableViewStyle)style
//{
//    if (self = [super initWithStyle:UITableViewStyleGrouped]) {
//    }
//    
//    return self;
//}


-(void)viewDidLoad
{
    [self setUP];
    [self configUI];
    [self configFrame];
    [self loadData];
    
  
    
}
#pragma mark - 基础配置

-(void)setUP
{
    self.view.backgroundColor = c255255255;
}

-(void)configUI
{
    self.tableView.backgroundColor = c255255255;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.showsVerticalScrollIndicator = NO;
}

-(void)configFrame
{
    
}



#pragma mark - 下载数据

-(void)loadData
{
    
}
#pragma mark - table代理

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
  
    return CGFLOAT_MIN;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return CGFLOAT_MIN;
}

#pragma mark - Privite

-(void)showAlertView:(NSString *)msg
{
    UIAlertView *clearAlert = [[UIAlertView alloc]initWithTitle:nil message:msg delegate:self cancelButtonTitle:@"好的" otherButtonTitles: nil];
    [clearAlert show];
}

-(void)showErrorWithJSON:(id)JSON
{
    NSString *msg = [NSString notEqualToNull:JSON[@"message"]];
    if (msg.length > 0) {
        [MBProgressHUD showError:JSON[@"message"]];
    }else
    {
        NSString *errMsg = [NSString stringWithFormat:@"请求失败:%ld",[JSON[@"code"] integerValue]];
        [MBProgressHUD showError:errMsg];
    }
    
}

@end
