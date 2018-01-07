//
//  TopBtnView.h
//  MagicFinger
//
//  Created by khj on 16/8/22.
//  Copyright © 2016年 zeenc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BtnSuperView;

@interface TopBtnView : UIView

@property (nonatomic, strong) BtnSuperView *btnSuperView;
- (instancetype)initWithBtnArray:(NSArray *)btnArray;
@property (nonatomic, copy) void(^selectCellModelBlock)(NSString *cid, NSInteger tag);
@property (nonatomic, strong) NSArray *projects;
@property (nonatomic, strong) NSArray *companys;
@property (nonatomic, weak) UITableView *tableView;
@end
