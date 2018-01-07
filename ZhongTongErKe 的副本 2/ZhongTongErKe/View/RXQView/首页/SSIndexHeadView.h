//
//  SSIndexHeadView.h
//  ZhongTongErKe
//
//  Created by Claf on 17/4/28.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TouchScrollView.h"
#import "PopularHealthView.h"

@protocol SSIndexHeadViewDelegate <NSObject>

- (void)addPlan;
- (void)collectionItemTaped:(NSInteger)index;

@end

@interface SSIndexHeadView : UIView


@property (nonatomic,weak) id<SSIndexHeadViewDelegate>delegate;

@property (nonatomic,strong) NSMutableArray *imageArray;
@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,strong) UICollectionViewFlowLayout *flowLayout;
@property (nonatomic,strong) UIView *bottomScrollview;
@property (nonatomic , copy) void (^clickActionBlock)();
@property (nonatomic , copy) void (^chooseBlock)();
@property (nonatomic,strong) PopularHealthView *healthView;

+ (instancetype)loadHeaderView;

@end
