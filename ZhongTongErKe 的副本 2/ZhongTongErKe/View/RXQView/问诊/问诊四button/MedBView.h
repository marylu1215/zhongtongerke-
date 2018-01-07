//
//  MedBView.h
//  ZhongTongErKe
//
//  Created by khj on 2017/7/31.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Doctor.h"

@interface MedBView : UIView

@property (nonatomic ,copy) NSString  *doctorInfo;

-(id)initWithTitle:(NSString *)title;


@end
