//
//  ChooseToolView.h
//  MagicFinger
//
//  Created by xufeng on 16/8/16.
//  Copyright © 2016年 zeenc. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    ChooseToolViewIndicator, //下划线
    ChooseToolViewBorder, //边框
} ChooseToolViewType;

typedef void(^ChooseBlock)(NSInteger index);
@interface ChooseToolView : UIView
{
    ChooseBlock _chooseBlock;
}
@property (nonatomic, weak) UIView *indicatorView;

@property (nonatomic,strong) UIColor *titleColor;
@property (nonatomic,strong) UIColor *selectedTitleColor;

@property (nonatomic,strong) UIColor *BgNomalColor;
@property (nonatomic,strong) UIColor *BgSelectedColor;

@property (nonatomic,strong) UIColor *indicatorLineColor;
@property (nonatomic,assign) CGFloat indicatorLineHeight;

@property (nonatomic,strong) UIFont *titleFont;

@property (nonatomic,assign) BOOL showBottomLine;

@property (nonatomic,assign) BOOL showMidLine;

@property (nonatomic,strong) UIColor *midLineColor;

@property (nonatomic,assign) CGFloat midLineHeight;

@property (nonatomic,assign) CGFloat midLineWidth;
//** 生产任务编号 */
@property (nonatomic , strong) NSArray *constructNoArray;
/**
 *  初始化选择条
 *
 *  @param frame       整个frame
 *  @param titlesArr   标题数组
 *  @param borderColor 边框颜色（如果是ChooseToolViewBorder类型有用）
 *  @param type        类型
 *
 *  @return 选择条
 */
- (id)initWithFrame:(CGRect)frame titles:(NSArray *)titlesArr borderColor:(UIColor *)borderColor chooseToolViewType:(ChooseToolViewType)type More:(BOOL)more;
/**
 *  外部调点击方法
 *
 *  @param index 点击下标
 */
- (void)titleClickAtIndex:(NSInteger)index;
/**
 *  点击回调
 *
 *  @param chooseBlock 返回下标
 */
- (void)didChooseAtIndex:(ChooseBlock)chooseBlock;

@end


