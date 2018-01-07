//
//  HealthHistoryView.m
//  ZhongTongErKe
//
//  Created by khj on 2017/7/3.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "HealthHistoryView.h"

@interface HealthHistoryView ()


@property (nonatomic ,strong) NSArray *diseaseArray;

@end
@implementation HealthHistoryView

#pragma mark --datasourse delegate

-(id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
    
    self.diseaseArray = @[@"高血压",@"高血压",@"高血压",@"高血压",@"高血压",@"高血压",@"高血压",@"高血压",@"高血压",@"高血压",@"高血压",@"高血压",@"高血压",@"高血压"];
        
    }
    return self;
}









@end
