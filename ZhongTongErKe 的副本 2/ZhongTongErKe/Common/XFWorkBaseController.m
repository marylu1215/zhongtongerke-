//
//  XFWorkBaseController.m
//  MagicFinger
//
//  Created by xufeng on 16/5/25.
//  Copyright © 2016年 zeenc. All rights reserved.
//

#import "XFWorkBaseController.h"

@interface XFWorkBaseController ()

@property (nonatomic,strong) UIView *naviLine;

@end

@implementation XFWorkBaseController

#pragma mark - View Cycle



-(void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = c255255255;
    [self setUP];
    [self configUI];
    [self configFrame];
    [self loadData];
}

#pragma mark - 基础配置

-(void)setUP
{

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
