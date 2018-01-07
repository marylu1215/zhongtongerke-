//
//  MyAssessment.h
//  ZhongTongErKe
//
//  Created by l m on 2017/7/24.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Assessment.h"
@interface MyAssessment : NSObject
@property (nonatomic ,strong) Assessment *assessment;
@property (nonatomic ,copy)  NSString *numStr;
@property (nonatomic ,copy)  NSString *subTitle;

@end
