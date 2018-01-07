//
//  NSObject+Netwoking.m
//  HappyBuy
//
//  Created by tarena on 16/3/29.
//  Copyright © 2016年 tedu. All rights reserved.
//

#import "NSObject+Netwoking.h"
//#import <SVProgressHUD.h>
#define kTimeoutInterval   30

@implementation NSObject (Netwoking)

+ (id)GET:(NSString *)path parameters:(NSDictionary *)parameters progress:(void (^)(NSProgress *))downloadProgress completionHandler:(void (^)(id, NSError *))completionHandler{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //让AF接受除了JSON以外的数据类型:
    //Xcode, iOS: iPhone Operator System
    //OC:Objective-C
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", @"text/plain", @"text/json", @"text/javascript", @"application/json", nil];
    //请求超时时间
    manager.requestSerializer.timeoutInterval = kTimeoutInterval;
    
  
    
    
    return [manager GET:path parameters:parameters progress:downloadProgress success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        completionHandler(responseObject, nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        completionHandler(nil, error);
    }];
}

+ (id)POST:(NSString *)path parameters:(NSMutableDictionary *)parameters progress:(void (^)(NSProgress *))downloadProgress completionHandler:(void (^)(id, NSError *))completionHandler{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //让AF接受除了JSON以外的数据类型:
    //Xcode, iOS: iPhone Operator System
    //OC:Objective-C
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", @"text/plain", @"text/json", @"text/javascript", @"application/json", nil];
    //请求超时时间
    manager.requestSerializer.timeoutInterval = kTimeoutInterval;
    
//    //t
    NSUserDefaults *standfault = [NSUserDefaults standardUserDefaults];
    NSString *cookstr = [standfault objectForKey:@"cookie"];
    
    NSString *valuestring = cookstr;
    [manager.requestSerializer setValue:valuestring forHTTPHeaderField:@"cookie"];
//     [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"cookie"];
//    [[NSUserDefaults standardUserDefaults]synchronize];
    
    if (!parameters) {
        parameters = [NSMutableDictionary dictionary];
    }
//    if (TOKEN) {
//        
//        parameters[@"token"] = TOKEN;
//    }
    return [manager POST:path parameters:parameters progress:downloadProgress success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
       // [SVProgressHUD dismiss];
        completionHandler(responseObject, nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        completionHandler(nil, error);
        NSLog(@"%@",error);
       // [SVProgressHUD showErrorWithStatus:@(error.code).stringValue];
    }];
}
@end










