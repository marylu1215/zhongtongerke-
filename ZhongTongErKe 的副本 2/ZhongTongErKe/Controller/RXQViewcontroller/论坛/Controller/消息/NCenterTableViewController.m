//
//  NCenterTableViewController.m
//  ZhongTongErKe
//
//  Created by khj on 2017/5/31.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "NCenterTableViewController.h"
#import "SSInTableViewCell.h"
#import "LMMessageTableViewController.h"

@interface NCenterTableViewController ()

@property (nonatomic ,strong) NSMutableArray *titleArray;
@property (nonatomic ,strong) NSMutableArray *imageArray;

@end

@implementation NCenterTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"消息中心";
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
}


#pragma mark - Table view data source
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.titleArray.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    NSArray *titArr = self.titleArray[section];
    return titArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section==1) {
        return px(20);
    }
    else
    {
        return CGFLOAT_MIN;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    SSInTableViewCell *cell = [SSInTableViewCell cellWithTableView:tableView];
    
    NSArray *imageNameArray = self.imageArray[indexPath.section];
    NSString *imageName = imageNameArray[indexPath.row];
    cell.headImageView.image = [UIImage imageNamed:imageName];
    
    NSArray *titleArr = self.titleArray[indexPath.section];

    cell.infoLabel.text = titleArr[indexPath.row];
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 30;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.navigationController pushViewController:[LMMessageTableViewController  new] animated:YES];
}


-(NSMutableArray *)titleArray
{
    if (!_titleArray) {
        _titleArray = [NSMutableArray new];
        
        [_titleArray addObjectsFromArray:@[ @[@"医生服务",@"语音服务",@"系统公告"],@[@"为您推荐"]]];
    }
    return _titleArray;
}

-(NSMutableArray *)imageArray
{
    if (!_imageArray) {
        
        _imageArray = [NSMutableArray arrayWithArray:@[@[doctorserviceImageName,voiceIconImageName,systemNoticeImageName],@[recommendImageName]]];
    }
    return _imageArray;
}



@end
