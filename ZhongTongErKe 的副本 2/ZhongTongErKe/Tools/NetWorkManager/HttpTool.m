//
//  HttpTool.m
//  SinaWeibo
//
//  Created by kj on 14-8-5.
//  Copyright (c) 2014年 kj. All rights reserved.
//

#import "HttpTool.h"

#import "UserTool.h"
#import "AppDelegate.h"
#import "NSDate+XFExtension.h"
#import "NSString+NTES.h"
#import <AFNetworking.h>

/**
 *  是否开启https SSL 验证
 *
 *  @return YES为开启，NO为关闭
 */
//#define openHttpsSSL YES
///**
// *  SSL 证书名称，仅支持cer格式。
// */
//#define certificate @"zeencios"

@implementation HttpTool

static HttpTool *_manger;
+ (instancetype)shareHttpToolManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _manger = [[HttpTool alloc] init];
        
    });
    return _manger;
}

//+ (AFSecurityPolicy *)customSecurityPolicy
//{
//    // 导入证书
//    NSString *cerPath = [[NSBundle mainBundle] pathForResource:certificate ofType:@"cer"];
//    NSData *certData = [NSData dataWithContentsOfFile:cerPath];
//    
//    ICLog(@"certData:%@",certData);
//    
//    NSSet *cerSet = [NSSet setWithObject:certData];
//    
//    // AFSSLPinningModeCertificate 使用证书验证模式
//    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
//    // allowInvalidCertificates 是否允许无效证书（也就是自建的证书），默认为NO
//    // 如果是需要验证自建证书，需要设置为YES
//    securityPolicy.allowInvalidCertificates = YES;
//    
//    //validatesDomainName 是否需要验证域名，默认为YES；
//    //假如证书的域名与你请求的域名不一致，需把该项设置为NO；如设成NO的话，即服务器使用其他可信任机构颁发的证书，也可以建立连接，这个非常危险，建议打开。/Users/hanyukeji/Desktop/workspace/巧手/KJMagicFinger/MagicFinger.xcodeproj
//    //置为NO，主要用于这种情况：客户端请求的是子域名，而证书上的是另外一个域名。因为SSL证书上的域名是独立的，假如证书上注册的域名是www.google.com，那么mail.google.com是无法验证通过的；当然，有钱可以注册通配符的域名*.google.com，但这个还是比较贵的。
//    //如置为NO，建议自己添加对应域名的校验逻辑。
//    securityPolicy.validatesDomainName = NO;
//    
//    securityPolicy.pinnedCertificates = cerSet;
//    
//    return securityPolicy;
//}
//

+ (void)postWithURL:(NSString *)path params:(NSDictionary *)params success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    // 1.创建请求管理对象
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", @"text/xml", @"text/plain", nil];
    // 设置超时时间
    [manager.requestSerializer willChangeValueForKey:@"timeoutinterval"];
    manager.requestSerializer.timeoutInterval = 60.f;
    [manager.requestSerializer didChangeValueForKey:@"timeoutinterval"];
    // 3.发送请求
    NSString *url = [NSString stringWithFormat:@"%@%@",BaseURL,path];
    // 2.发送请求
    [ manager POST:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success)
        {
          success(responseObject);
       }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure)
        {
          failure(error);
       }
    }];
}

@end
