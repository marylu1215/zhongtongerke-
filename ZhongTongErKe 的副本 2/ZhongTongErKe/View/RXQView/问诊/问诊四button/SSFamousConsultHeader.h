//
//  SSFamousConsultHeader.h
//  ZhongTongErKe
//
//  Created by Claf on 17/5/22.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LMImageView.h"

@interface SSFamousConsultHeader : UIView

@property (nonatomic, strong) LMImageView *bgImageView;

@property (nonatomic ,copy) void (^backBlock)();

@end
