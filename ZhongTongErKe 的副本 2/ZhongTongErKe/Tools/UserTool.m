//
//  UserTool.m
//  MagicFinger
//
//  Created by khj on 16/5/19.
//  Copyright © 2016年 zeenc. All rights reserved.
//

#import "UserTool.h"


#define kAccountPath ([[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"account.data"])

@implementation UserTool

+ (void)saveUserInfo:(User *)user
{
    [NSKeyedArchiver archiveRootObject:user toFile:kAccountPath];
}

+ (User *)user
{
    User *user = [NSKeyedUnarchiver unarchiveObjectWithFile:kAccountPath];
   
    return user;
}

+ (void)deleteUser
{
    NSFileManager *fileMgr = [NSFileManager defaultManager];
    NSError *error = nil;
    
    BOOL bRet = [fileMgr fileExistsAtPath:kAccountPath];
    if (bRet) {
        [fileMgr removeItemAtPath:kAccountPath error:&error];
    }
    
}
@end
