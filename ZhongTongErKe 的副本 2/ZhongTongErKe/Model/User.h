//
//  User.h
//  ZhongTongErKe
//
//  Created by khj on 2017/5/31.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (nonatomic , copy) NSString *username;
@property (nonatomic , copy) NSString *sex;
@property (nonatomic , copy) NSString *height;
@property (nonatomic ,copy) NSString *head;
//@property(nonatomic,copy)NSURL* head;

@property (nonatomic ,copy) NSString *openid;
@property (nonatomic ,copy) NSString *year;
@property (nonatomic ,copy) NSString *birthday;
@property (nonatomic ,copy) NSString *weight;
@property (nonatomic ,copy) NSString *marriage;
@property (nonatomic ,copy) NSString *culture;
@property (nonatomic ,copy) NSString *medical_insurance;
@property (nonatomic ,strong) NSString *children;
@property (nonatomic ,copy) NSString *integral;
@property (nonatomic ,copy) NSString *mobile;
@property (nonatomic ,copy) NSString *age;
//用户ID
@property (nonatomic ,copy) NSString *userid;
//** 云信账户token */
@property (nonatomic, copy) NSString *accToken;
/**
 *  融云id
 */
@property (nonatomic, copy) NSString *cid;
//**密码*/
@property (nonatomic, copy) NSString *pwd;

@property (nonatomic, copy) NSString *email;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *xg_time;

@end
