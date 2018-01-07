//
//  SSAccountHeader.h
//  ZhongTongErKe
//
//  Created by Claf on 17/5/24.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SSAccountHeader : UIView

@property (nonatomic,strong)UILabel *headLabel;
@property (nonatomic,strong)UILabel *contentLabel;

@property (nonatomic , copy) void (^backAction)();

@end
