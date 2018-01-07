//
//  SSHealthHistoryFooter.h
//  ZhongTongErKe
//
//  Created by Claf on 17/5/9.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SSHealthHistoryFooter : UIView

@property (nonatomic ,copy) void (^backDiseBlock)(UIButton *btn);

@property (nonatomic ,strong) NSArray *diseaseArray;

- (instancetype)initWithFrame:(CGRect)frame withDiseaseArr:(NSArray *)diseaseArr;



@end
