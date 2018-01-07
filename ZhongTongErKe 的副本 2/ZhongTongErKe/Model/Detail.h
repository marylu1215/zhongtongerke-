//
//  Detail.h
//  ZhongTongErKe
//
//  Created by khj on 2017/6/2.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
@interface Detail : NSObject

@property (nonatomic ,strong) User  *postMan;

@property (nonatomic ,copy) NSString *content;

+(NSArray *)getAllDetailArray;

@end
