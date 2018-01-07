//
//  SwitchChooseTool.h
//  MagicFinger
//
//  Created by khj on 2016/12/5.
//  Copyright © 2016年 zeenc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SwitchChooseTool : NSObject
/**
 *  存储SwitchChoose信息
 *
 */
+ (void)saveSwitchChoose:(id)array;
/**
 *  获得SwitchChoose信息
 */
+ (NSArray *)switchArray;
/**
 第一次初始化
 */
+ (void)fristInitializeSwitch;
@end
