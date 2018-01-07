//
//  ChooseTableToolView.h
//  MagicFinger
//
//  Created by xufeng on 16/9/23.
//  Copyright © 2016年 zeenc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BtnSuperView.h"

@interface ChooseTableToolView : UIView
/**
 *  提示列表Str数组的数组
 */
@property (nonatomic, strong) NSMutableArray *tableDataArrOfArr;
@property (nonatomic ,strong) NSArray *constructNoArray;

@property (nonatomic, copy) void(^selectCellModelBlock)(NSInteger tag , NSInteger cellIndex);

@property (nonatomic, copy) void(^changeBgViewColor)();
@property (nonatomic, strong) UIView *contentView;
/**
 *  初始化
 *
 *  @param btnArray          标题数组
 *  @param tableDataArrOfArr 标题对应提示列表Str数组的数组
 *
 *  @return
 */
- (instancetype)initWithBtnArray:(NSArray *)btnArray tableDataArrOfArr:(NSMutableArray *)tableDataArrOfArr;

- (void)showOrHideView:(BOOL)isSelected;

- (void)hideView;

@end
