//
//  SwitchChooseModel.h
//  MagicFinger
//
//  Created by khj on 2016/12/5.
//  Copyright © 2016年 zeenc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SwitchChooseModel : NSObject<NSCoding>
@property (nonatomic, assign) NSUInteger tag;
@property (nonatomic, assign) BOOL isOn;
@end
