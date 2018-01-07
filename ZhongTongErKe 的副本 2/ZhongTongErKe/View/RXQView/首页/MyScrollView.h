//
//  MyScrollView.h
//  蜂鸟APP
//
//  Created by apple on 16/7/15.
//  Copyright © 2016年 Xwq. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ImageClickBlock)(NSInteger index);//图片点击block，index为当前点击的图片索引

@interface MyScrollView : UIScrollView
+ (instancetype)scrollViewWithFrame:(CGRect)frame ImagesArray:(NSMutableArray <UIImage *> *)imagesArray;
- (instancetype)initWithFrame:(CGRect)frame ImagesArray:(NSMutableArray <UIImage *> *)imagesArray;
+ (instancetype)scrollViewWithFrame:(CGRect)frame ImagesArray:(NSMutableArray <UIImage *> *)imagesArray ImageClick:(void(^)(NSInteger index))block;
- (instancetype)initWithFrame:(CGRect)frame ImagesArray:(NSMutableArray <UIImage *> *)imagesArray ImageClick:(void(^)(NSInteger index))block;

@property (nonatomic, strong) UIPageControl *pageControl;//页码
@property (nonatomic, strong) UIColor *pageControlCurrentColor;//pageControl背景色，默认gray
@property (nonatomic, strong) UIColor *pageControlTintColor;//pageControl选中色，默认orange
@property (nonatomic, assign) NSInteger time;//设定时间自动切换图片，默认3秒，最低2秒

- (void)startTimer;
- (void)stopTimer;
@end
