//
//  SSTestResultController.h
//  ZhongTongErKe
//
//  Created by Claf on 17/5/4.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Assessment.h"

@interface SSTestResultController : XFWorkBaseController
@property (nonatomic ,strong) NSArray *subjectArray;
@property (nonatomic ,strong) Assessment *assessment;

@end
