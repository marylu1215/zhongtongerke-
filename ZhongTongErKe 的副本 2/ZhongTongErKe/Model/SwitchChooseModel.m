//
//  SwitchChooseModel.m
//  MagicFinger
//
//  Created by khj on 2016/12/5.
//  Copyright © 2016年 zeenc. All rights reserved.
//

#import "SwitchChooseModel.h"

@implementation SwitchChooseModel

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeInteger:self.tag forKey:@"tag"];
    [aCoder encodeBool:self.isOn forKey:@"isOn"];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if ([self init]) {
        //解压过程
        self.tag = [aDecoder decodeIntegerForKey:@"tag"];
        self.isOn = [aDecoder decodeBoolForKey:@"isOn"];
    }
    return self;
}

@end
