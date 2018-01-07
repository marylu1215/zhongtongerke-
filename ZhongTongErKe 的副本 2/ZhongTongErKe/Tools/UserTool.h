//
//  UserTool.h
//  MagicFinger
//
//  Created by khj on 16/5/19.
//  Copyright © 2016年 zeenc. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "User.h"

@interface UserTool : NSObject
/**
 *  存储账户信息
 *
 */
+ (void)saveUserInfo:(User *)user;
/**
 *  获得账户信息
 */

+ (User *)user;
/**
 *  删除账户信息
 */
+ (void)deleteUser;
@end
