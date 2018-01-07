//
//  PopularHealthView.h
//  ZhongTongErKe
//
//  Created by khj on 2017/6/26.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Assessment.h"
#import "TitleButton.h"

@interface PopularHealthView : UIView
@property (nonatomic ,strong)  NSArray *assessmentArray;
@property (nonatomic ,copy) void (^selectBlock)(Assessment *assessment);
@property (nonatomic ,copy) void (^moreBlock)();

@end
