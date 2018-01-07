//
//  LMBaseViewController.m
//  ZhongTongErKe
//
//  Created by khj on 2017/6/5.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "LMBaseViewController.h"

@interface LMBaseViewController ()

@end

@implementation LMBaseViewController

- (void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBar.hidden = YES;
    self.tabBarController.tabBar.hidden = YES;
}
- (void)viewWillDisappear:(BOOL)animated{
    self.navigationController.navigationBar.hidden = NO;
    self.tabBarController.tabBar.hidden = NO;
}


-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setUP];
    [self configUI];
    [self configFrame];
    [self loadData];
    
    self.view.backgroundColor = c255255255;
}

#pragma mark - 基础配置

-(void)setUP
{
    UIView *zeroView = [[UIView alloc]initWithFrame:CGRectZero];
    [self.view addSubview:zeroView];
}

-(void)configUI
{
    
}

-(void)configFrame
{
    
}

#pragma mark - 下载数据

-(void)loadData
{
    
}

#pragma mark - Privite

-(void)showAlertView:(NSString *)msg
{
    UIAlertView *clearAlert = [[UIAlertView alloc]initWithTitle:nil message:msg delegate:nil cancelButtonTitle:@"好的" otherButtonTitles: nil];
    [clearAlert show];
}

-(void)showErrorWithJSON:(id)JSON
{
    NSString *msg = [NSString notEqualToNull:JSON[@"message"]];
    if (msg.length > 0) {
        
    }
}





@end
