//
//  SwitchChooseTool.m
//  MagicFinger
//
//  Created by khj on 2016/12/5.
//  Copyright © 2016年 zeenc. All rights reserved.
//
#define  switchCount 4
#import "SwitchChooseTool.h"
#import "SwitchChooseModel.h"

#define kSwitchPath ([[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"switchchoose.data"])

@implementation SwitchChooseTool
+ (void)saveSwitchChoose:(id)array
{
    [NSKeyedArchiver archiveRootObject:array toFile:kSwitchPath];
}

+ (NSArray *)switchArray
{
    NSArray *array = [NSKeyedUnarchiver unarchiveObjectWithFile:kSwitchPath];
    
    return array;
}

+ (void)fristInitializeSwitch
{
    NSArray *switchArray = [self switchArray];
    NSMutableArray *array = [NSMutableArray array];
    if (switchArray == nil) {
        for (NSInteger i = 0; i < switchCount; i++) {
            SwitchChooseModel *chooseModel = [[SwitchChooseModel alloc] init];
            chooseModel.tag = i;
            chooseModel.isOn = YES;
            [array addObject:chooseModel];
        }
        [self saveSwitchChoose:array];
    }

}
@end
