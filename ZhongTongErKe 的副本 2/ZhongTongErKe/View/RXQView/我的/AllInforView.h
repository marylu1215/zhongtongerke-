//
//  AllInforView.h
//  ZhongTongErKe
//
//  Created by khj on 2017/6/4.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AllInforView : UIView

-(instancetype)initWithTitle:(NSString *)title SubTitle:(NSString *)SubTitle LeftArr:(NSArray *)LeftArr;

@property (nonatomic ,strong) NSArray *rightArr;
@end
