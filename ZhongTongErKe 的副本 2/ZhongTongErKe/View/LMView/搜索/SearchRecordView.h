//
//  SearchRecordView.h
//  ZhongTongErKe
//
//  Created by khj on 2017/6/2.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchRecordView : UIView

@property (nonatomic ,strong) NSArray *hotReArray;

@property (nonatomic ,copy) void (^backHotBlock)(NSString *hotStr);

@property (nonatomic ,copy) void (^backReBlock)(NSString *reStr);

-(id)initWithFrame:(CGRect)frame searchRecordArray:(NSArray *)searchRecordArray  AndhotReArray:(NSArray *)hotReArray;

@end
