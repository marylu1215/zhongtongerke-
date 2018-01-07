//
//  SSDocDetailHeader2.h
//  ZhongTongErKe
//
//  Created by Claf on 17/5/16.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SSDocDeTailButton.h"
#import "SSTableViewHeader.h"

@interface SSDocDetailHeader2 : UIView

@property (nonatomic,strong)SSDocDeTailButton *button1;
@property (nonatomic,strong)SSDocDeTailButton *button2;
@property (nonatomic,strong)SSDocDeTailButton *button3;
@property (nonatomic,strong)SSDocDeTailButton *button4;
@property (nonatomic,strong)SSDocDeTailButton *button5;
@property (nonatomic,strong)UILabel *headLabel;
@property (nonatomic ,strong) UIImageView *sepView;
@property (nonatomic ,copy) void (^clickBlock)(SSDocDeTailButton *btn);



@end
