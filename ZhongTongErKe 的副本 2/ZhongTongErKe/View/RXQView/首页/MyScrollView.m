//
//  MyScrollView.m
//  蜂鸟APP
//
//  Created by apple on 16/7/15.
//  Copyright © 2016年 Xwq. All rights reserved.
//

#import "MyScrollView.h"

#define DEFAULTTIME 3

@interface MyScrollView()<UIScrollViewDelegate>
@property (nonatomic, copy) ImageClickBlock imageClickBlock;
@property (nonatomic, strong) NSMutableArray<UIImage *> *imagesArray;//图片数组
@property (nonatomic, strong) UIImageView *leftImageView;//上一页视图
@property (nonatomic, strong) UIImageView *currentImageView;//当前视图
@property (nonatomic, strong) UIImageView *rightImageView;//下一页视图
@property (nonatomic, assign) CGFloat width;//视图宽
@property (nonatomic, assign) CGFloat height;//视图高
@property (nonatomic, assign) NSInteger currentIndex;//当前显示的图片索引
@property (nonatomic, assign) NSInteger leftIndex;//左边图索引
@property (nonatomic, assign) NSInteger rightIndex;//右边图索引
@property (nonatomic, strong) NSTimer *timer;
@end

@implementation MyScrollView

#pragma mark - 便利构造、初始化方法
+ (instancetype)scrollViewWithFrame:(CGRect)frame ImagesArray:(NSMutableArray *)imagesArray
{
    MyScrollView *scollView = [[MyScrollView alloc] initWithFrame:frame ImagesArray:imagesArray];
    return scollView;
}

- (instancetype)initWithFrame:(CGRect)frame ImagesArray:(NSMutableArray *)imagesArray
{
    if (self = [super initWithFrame:frame])
    {
        [self setScrollViewContentSizeWithFrame:frame ImagesArray:imagesArray];
    }
    return self;
}

+ (instancetype)scrollViewWithFrame:(CGRect)frame ImagesArray:(NSMutableArray *)imagesArray ImageClick:(void(^)(NSInteger index))block
{
    MyScrollView *scollView = [[MyScrollView alloc] initWithFrame:frame ImagesArray:imagesArray ImageClick:block];
    return scollView;
}

- (instancetype)initWithFrame:(CGRect)frame ImagesArray:(NSMutableArray *)imagesArray ImageClick:(void(^)(NSInteger index))block
{
    if (self = [super initWithFrame:frame])
    {
        self.imageClickBlock = block;
        [self setScrollViewContentSizeWithFrame:frame ImagesArray:imagesArray];
    }
    return self;
}

- (void)setScrollViewContentSizeWithFrame:(CGRect)frame ImagesArray:(NSMutableArray *)imagesArray
{
    self.imagesArray = imagesArray;
    self.currentIndex = 0;
    self.time = 3;
    [self addSubview:self.leftImageView];
    [self addSubview:self.currentImageView];
    [self addSubview:self.rightImageView];
    [self startTimer];
    if (_imagesArray.count < 2)//如果图片数组个数小于2，视图不能滚动
    {
        self.contentSize = CGSizeMake(frame.size.width, frame.size.height);
        return;
    }
    self.pagingEnabled = YES;
    self.bounces = NO;
    self.showsHorizontalScrollIndicator = NO;
    self.showsVerticalScrollIndicator = NO;
    self.delegate = self;
    self.contentSize = CGSizeMake(frame.size.width * 3, frame.size.height);//创建3个UIImageView
    self.contentOffset = CGPointMake(frame.size.width, 0);//默认显示中间的视图
}

#pragma mark - getter
- (CGFloat)width//获取视图宽度
{
    return self.frame.size.width;
}

- (CGFloat)height//获取视图高度
{
    return self.frame.size.height;
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //向左滑
    if (self.contentOffset.x >= self.width * 2)
    {
        _currentIndex = (_currentIndex + 1) % _imagesArray.count;
        _leftIndex = (_currentIndex - 1 < 0 ? _imagesArray.count - 1 : _currentIndex - 1) % _imagesArray.count;
        _rightIndex = (_currentIndex + 1) % _imagesArray.count;
        _currentImageView.image = [_imagesArray objectAtIndex:_currentIndex];
        self.contentOffset = CGPointMake(self.width, 0);
        _leftImageView.image = [_imagesArray objectAtIndex:_leftIndex];
        _rightImageView.image = [_imagesArray objectAtIndex:_rightIndex];
        _pageControl.currentPage = _currentIndex;
    }
    //向右滑
    else if (self.contentOffset.x <= 0)
    {
        _currentIndex = (_currentIndex - 1 < 0 ? _imagesArray.count - 1 : _currentIndex - 1) % _imagesArray.count;
        _leftIndex = (_currentIndex - 1 < 0 ? _imagesArray.count - 1 : _currentIndex - 1) % _imagesArray.count;
        _rightIndex = (_currentIndex + 1) % _imagesArray.count;
        _currentImageView.image = [_imagesArray objectAtIndex:_currentIndex];
        self.contentOffset = CGPointMake(self.width, 0);
        _leftImageView.image = [_imagesArray objectAtIndex:_leftIndex];
        _rightImageView.image = [_imagesArray objectAtIndex:_rightIndex];
        _pageControl.currentPage = _currentIndex;
    }
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self stopTimer];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self startTimer];
}

#pragma mark - Events
- (void)imageClick//点击图片触发事件
{
    self.imageClickBlock(_currentIndex);
   
}

- (void)timerAction
{
    [self setContentOffset:CGPointMake(self.width * 2, 0) animated:YES];
}

#pragma mark - 定时器
- (void)startTimer
{
    if (!_timer.isValid)
    {
        _timer = [NSTimer timerWithTimeInterval:_time < 2 ? DEFAULTTIME : _time target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    }
}

- (void)stopTimer
{
    if (_timer.isValid)
    {
        [_timer invalidate];
    }
}

#pragma mark - lazy load
- (NSMutableArray *)imagesArray
{
    if (!_imagesArray)
    {
        _imagesArray = [NSMutableArray array];
    }
    return _imagesArray;
}

- (UIImageView *)leftImageView
{
    if (!_leftImageView)
    {
        _leftImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.width, self.height)];
        _leftImageView.image = [_imagesArray lastObject];
    }
    return _leftImageView;
}

- (UIImageView *)currentImageView
{
    if (!_currentImageView)
    {
        _currentImageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.width, 0, self.width, self.height)];
        _currentImageView.image = [_imagesArray objectAtIndex:0];
        _currentImageView.userInteractionEnabled = YES;
        [_currentImageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageClick)]];
    }
    return _currentImageView;
}

- (UIImageView *)rightImageView
{
    if (!_rightImageView)
    {
        _rightImageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.width * 2, 0, self.width, self.height)];
        if (_imagesArray.count < 2)
        {
            _rightImageView.image = [_imagesArray objectAtIndex:0];
        }
        else
        {
            _rightImageView.image = [_imagesArray objectAtIndex:1];
        }
    }
    return _rightImageView;
}

- (UIPageControl *)pageControl
{
    if (!_pageControl)
    {
        _pageControl = [[UIPageControl alloc] init];
        _pageControl.bounds = CGRectMake(0, 0, 100, 30);
        _pageControl.center = CGPointMake(self.width / 2, self.bounds.origin.y + self.height - 10);
        _pageControl.userInteractionEnabled = NO;
        _pageControl.numberOfPages = _imagesArray.count;
        _pageControl.pageIndicatorTintColor = _pageControlTintColor ? _pageControlTintColor : [UIColor grayColor];
        _pageControl.currentPageIndicatorTintColor = _pageControlCurrentColor ? _pageControlCurrentColor : [UIColor orangeColor];
    }
    return _pageControl;
}


@end
