//
//  SSInterrogationHeader.h
//  ZhongTongErKe
//
//  Created by Claf on 17/5/10.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SSInterrogationHeadButton.h"

@interface SSInterrogationHeader : UIView

@property (nonatomic,strong)UIView *fastConsultView;
@property (nonatomic,strong)UIImageView *headImageview;
@property (nonatomic,strong)UIImageView *remarkImageView;
@property (nonatomic,strong)UILabel *headLabel;
@property (nonatomic,strong)SSInterrogationHeadButton *button1;
@property (nonatomic,strong)SSInterrogationHeadButton *button2;
@property (nonatomic,strong)SSInterrogationHeadButton *button3;
@property (nonatomic,strong)SSInterrogationHeadButton *button4;

@end
