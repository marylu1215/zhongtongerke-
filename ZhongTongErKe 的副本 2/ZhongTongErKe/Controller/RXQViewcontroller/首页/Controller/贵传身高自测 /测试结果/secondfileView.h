//
//  secondfileView.h
//  ZhongTongErKe
//
//  Created by 研发部 on 2017/9/13.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "totalLabel.h"
@interface secondfileView : UIView
@property(nonatomic,strong)UIImageView *onview;
//偏矮
@property(nonatomic,strong)UILabel *aiLabel;

//年龄身高
@property(nonatomic,strong)UILabel *heightLabel;
//90.cm
@property(nonatomic,strong)UILabel *cmLabel;
//低于儿童身高标准4CM
@property(nonatomic,strong)UILabel *standarLabel;

@property(nonatomic,strong)totalLabel *upLabel;
@property(nonatomic,strong)totalLabel *middleLabel;
@property(nonatomic,strong)totalLabel *downLabel;

@end
