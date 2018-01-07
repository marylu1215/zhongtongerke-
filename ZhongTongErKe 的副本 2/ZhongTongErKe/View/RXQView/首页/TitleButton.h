//
//  TitleButton.h
//  ZhongTongErKe
//
//  Created by khj on 2017/6/26.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Assessment.h"
#import "Administrative.h"

@interface TitleButton : UIButton

@property (nonatomic ,strong) Assessment *assessment;

@property (nonatomic ,strong) Administrative *administrative;
@end
