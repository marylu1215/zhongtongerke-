//
//  ActionSheetView.h
//  MagicFinger
//
//  Created by khj on 16/6/8.
//  Copyright © 2016年 zeenc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HotGroup.h"

typedef enum : NSUInteger {
    ActionSheetViewTypeFactoryUser,
    ActionSheetViewTypeTransDevice,
    ActionSheetViewTypeDeviceType,
    ActionSheetViewTypeCompanyType,
    ActionSheetViewTypeProjectType,
    ActionSheetViewTypePouringWay,
    ActionSheetViewTypeProjectSchedule,
    ActionSheetViewTypePart,
    ActionSheetViewTypeHotGroup,
    
} ActionSheetViewType;

@class ActionSheetView;
@protocol ActionSheetViewDelegate <NSObject>

@optional
- (void)sheetView:(ActionSheetView *)sheetView didSelectIndex:(NSInteger)index;

@end

@interface ActionSheetView : UIView
{
    UITableView *_tableView;
    // 模型数组
    NSArray *_listData;
}

@property (nonatomic, weak) id<ActionSheetViewDelegate> delegate;
@property (nonatomic, assign) ActionSheetViewType sheetType;
@property (nonatomic, copy) void (^selectRowAtIndex)(NSInteger index);

- (instancetype)initWithList:(NSArray *)list height:(CGFloat)height type:(ActionSheetViewType)type;
- (void)showInView:(UIViewController *)sView;

@end
