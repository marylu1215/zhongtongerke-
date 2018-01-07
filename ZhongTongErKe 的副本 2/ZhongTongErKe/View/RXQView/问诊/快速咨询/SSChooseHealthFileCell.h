//
//  SSChooseHealthFileCell.h
//  ZhongTongErKe
//
//  Created by Claf on 17/5/10.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FamilyGroup.h"
#import "XFBaseLineTableCell.h"

@protocol  SSChooseHealthFileCellDelegate <NSObject>

@optional
- (void)handleSelectedButtonActionWithSelectedIndexPath:(NSIndexPath *)selectedIndexPath;

@end

@interface SSChooseHealthFileCell :XFBaseLineTableCell

@property (nonatomic ,strong) FamilyGroup *familyGroup;
@property (nonatomic,strong) UIButton *checkButton;
@property (nonatomic, weak) id<SSChooseHealthFileCellDelegate> delegate;

@property (assign, nonatomic) NSIndexPath *selectedIndexPath;

@end
