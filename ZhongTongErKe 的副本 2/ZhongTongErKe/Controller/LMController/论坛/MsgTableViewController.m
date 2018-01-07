//
//  MsgTableViewController.m
//  ZhongTongErKe
//
//  Created by khj on 2017/5/26.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "MsgTableViewController.h"
#import "MsgCenterTableViewCell.h"
#import "Message.h"
@interface MsgTableViewController ()

@property (nonatomic ,strong) NSArray *mesArray;

@end

@implementation MsgTableViewController

-(void)viewDidLoad{
    
    [super viewDidLoad];
    
    self.mesArray = [Message getAllMessages];
    self.title = @"消息中心";
    self.tableView.separatorStyle = UITableViewCellStyleDefault;
}



#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.mesArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
   MsgCenterTableViewCell  *cell = [MsgCenterTableViewCell cellWithTableView:tableView];
    Message *msg = self.mesArray[indexPath.row];
    cell.message = msg;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return  px(80);
}




@end
