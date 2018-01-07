//
//  MessageViewController.m
//  MagicFinger
//
//  Created by khj on 2016/12/5.
//  Copyright © 2016年 zeenc. All rights reserved.
//

#import "MessageViewController.h"
#import "MsgSetTableViewCell.h"
#import "SwitchChooseModel.h"
#import "SwitchChooseTool.h"

@interface MessageViewController ()
/**
 左边title数组
 */
@property (nonatomic, strong) NSArray *leftTitles;

/**
 用于存储所有cell开关状态
 */
@property (nonatomic, strong) NSMutableArray *msgCellSwitchArray;
@end

@implementation MessageViewController

- (NSMutableArray *)msgCellSwitchArray
{
    if (_msgCellSwitchArray == nil) {
        _msgCellSwitchArray = [NSMutableArray array];
    }
    
    return _msgCellSwitchArray;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"消息通知";
    
    self.leftTitles = @[@"医生回复提醒",@"健康资讯推送",@"系统消息",@"健康计划推送"];
    
    NSArray *array = [SwitchChooseTool switchArray];
    
    if (array) {
        [self.msgCellSwitchArray addObjectsFromArray:array];
    }
    
}

#pragma mark - UITableViewDataSource代理

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.leftTitles.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 30;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    MsgSetTableViewCell *cell = [MsgSetTableViewCell cellWithTableView:tableView];
    
    cell.leftStr =  self.leftTitles[indexPath.row];
   
    
//    SwitchChooseModel *chooseModel = self.msgCellSwitchArray[indexPath.section];
//    cell.switchActionBlock = ^(BOOL isButtonOn,UISwitch *rightSwitch){
//        if (isButtonOn) {
//            // 如果声音或者震动打开，则接收推送一定打开
//            if (rightSwitch.tag != SwitchTagZero) {
//                SwitchChooseModel *modeOne = self.msgCellSwitchArray[SwitchTagZero];
//                modeOne.isOn = YES;
//            }
//            SwitchChooseModel *model = self.msgCellSwitchArray[rightSwitch.tag];
//            model.isOn = YES;
//            
//            [SwitchChooseTool saveSwitchChoose:self.msgCellSwitchArray];
//        }else {
//            if (rightSwitch.tag == SwitchTagZero) {
//                // 如果接收推送按钮关闭，则所有的都关闭
//                for (SwitchChooseModel *model in self.msgCellSwitchArray) {
//                    model.isOn = NO;
//                }
//                [SwitchChooseTool saveSwitchChoose:self.msgCellSwitchArray];
//                
//            }else
//            {
//                SwitchChooseModel *model = self.msgCellSwitchArray[rightSwitch.tag];
//                model.isOn = NO;
//                [SwitchChooseTool saveSwitchChoose:self.msgCellSwitchArray];
//            }
//        }
//        [tableView reloadData];
//    };
    
    return cell;
}
@end
