//
//  SSFamousConsultHeader.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/22.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSFamousConsultHeader.h"
#import "TouchScrollView.h"
#import "LMImageView.h"
#import "LMAd.h"

@interface SSFamousConsultHeader ()<UIScrollViewDelegate>

@property (nonatomic ,strong) LMImageView *headImageView;
@property (nonatomic ,strong) TouchScrollView *pScrollView;
@property (nonatomic,strong) UIPageControl *pageControl;
@property (nonatomic, assign) CGFloat timeInterval; /**<  滑动间隔   **/
@property (nonatomic,strong) NSTimer *timer;
@property (nonatomic,assign) int pageNumber;
@property (nonatomic,assign) int currentPageNumber;
@property (nonatomic,strong) NSMutableArray *adsMutableArr;
@property (nonatomic,strong) NSMutableArray *headerImageURLMuArr;
@property (atomic,strong) UIView *headerSVBackView;

@end

@implementation SSFamousConsultHeader

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubviews];
    }
    return self;
}


- (void)addSubviews{

    
    UIImage *image = [UIImage imageNamed:consultationIcon];
    self.headImageView = [[LMImageView alloc]initWithFrame:CGRectMake(0, 0,kScreenWidth, image.size.height)];
    self.headImageView.image = image;
    [self addSubview: self.headImageView];
    __weak typeof (self)weakSelf  =self;
    self.headImageView.backBlock = ^()
    {
        if (weakSelf .backBlock) {
           weakSelf.backBlock();
        }
    };
    
    [self addHeaderScrollView];
    
    [self loadData];
    
}

-(void)loadData
{
    kshowMessage(@"数据加载中");
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    params[@"position"]= @"2";
    
    [HttpTool postWithURL:getPlayParty params:params success:^(id json) {
        
      
        
        if (jsonMsg(json)) {
            
            
            NSArray *adsArr  = [LMAd mj_objectArrayWithKeyValuesArray:json[@"data"]];
            
            [self.adsMutableArr addObjectsFromArray: adsArr];
            for (int i = 0; i < self.adsMutableArr.count; i++) {
                LMAd *ads = self.adsMutableArr[i];
                [self.headerImageURLMuArr addObject:[NSString stringWithFormat:@"%@%@",ImageBaseURL,ads.img]];
                
            }
            
            [self headerSVImageChange];
        }
        kHideHUDAll;
        
    } failure:^(NSError *error) {
        netWorkError;
        kHideHUDAll;
    }];
    
}

#pragma mark - 滚动名义会诊展示
-(void)addHeaderScrollView{
    
    self.timeInterval = 3.0;
    [self showPicForHome];
}
#pragma mark - 自定义滚动视图
-(void)showPicForHome
{
    UIView *headerSVBackView = [[UIView alloc]init];
    _headerSVBackView = headerSVBackView;
    [self addSubview:headerSVBackView];
     _headerSVBackView = headerSVBackView;
    headerSVBackView.sd_layout.topSpaceToView(self.headImageView,0).widthIs(kScreenWidth).heightIs(px(354));
    
    self.pScrollView =[[TouchScrollView alloc]init];
    [headerSVBackView addSubview:self.pScrollView];
    self.pScrollView.frame = headerSVBackView.frame;
    self.pScrollView.pagingEnabled=YES;
    self.pScrollView.delegate = self;
    self.pScrollView.bounces=NO;
    self.pScrollView.showsHorizontalScrollIndicator=NO;//不显示水平线

    [self createPageControl];
    [headerSVBackView addSubview:_pageControl];
    //
    //下载没图片时的点位图
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 170)];
    [imageView setImage:[UIImage imageNamed:bannerImageName]];
    [self.pScrollView addSubview:imageView];

}
-(void)headerSVImageChange{
    
    _currentPageNumber = 0;
    _pageNumber = 0;
    //改变整个滚动视图范围
    [self layoutIfNeeded];
    
    //下载的图片数据
    for (int i=0; i<self.headerImageURLMuArr.count; i++) {
        NSString *imageURL= self.headerImageURLMuArr[i];
        UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(i*kScreenWidth, 0, kScreenWidth, 170)];
        [imageView sd_setImageWithURL:[NSURL URLWithString:imageURL] placeholderImage:[UIImage imageNamed:@"s01"]];
        
        [self.pScrollView addSubview:imageView];
    }
    if (self.headerImageURLMuArr.count == 0) {
        //下载没图片时的点位图
        UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 170)];
        [imageView setImage:[UIImage imageNamed:@"s01"]];
        [self.pScrollView addSubview:imageView];
    }
    self.pScrollView.contentSize=CGSizeMake(self.headerImageURLMuArr.count*kScreenWidth, 0);//活动范围，这里只支持左右，上下不支持
    _pageControl.currentPage=0;
    _pageControl.numberOfPages=_headerImageURLMuArr.count;
    
    [self setupTimer:self.timeInterval];
   
}
/**
 *  启动定时器
 *
 *  @param timeInterval 定时器的时间间隔
 */

- (void)setupTimer:(CGFloat)timeInterval {
    self.timer = [NSTimer timerWithTimeInterval:timeInterval target:self selector:@selector(playingImage) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];
}
-(void)createPageControl
{
    _pageControl=[[UIPageControl alloc]init];
    _pageControl.frame = CGRectMake(0, _headerSVBackView.height - px(60), _headerSVBackView.width, px(12));
    _pageControl.pageIndicatorTintColor= [UIColor redColor];
    _pageControl.currentPageIndicatorTintColor= cHBColor;
    //    关闭分页控件的用户交互功能
    _pageControl.userInteractionEnabled = YES;
}
-(void)playingImage
{
    if (self.headerImageURLMuArr.count > 0) {//只有有数据时才可滚动
        _pageNumber = _currentPageNumber + 1;
        if (_pageNumber==self.headerImageURLMuArr.count) {
            _pageNumber=0;
            _currentPageNumber = 0;
            [self.pScrollView setContentOffset:CGPointMake((_pageNumber)*kScreenWidth, 0) animated:NO];
        }else{
            [self.pScrollView setContentOffset:CGPointMake((_pageNumber)*kScreenWidth, 0) animated:YES];
            
        }
    }
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    
    if (scrollView == self.pScrollView) {
        _pageControl.currentPage = scrollView.contentOffset.x/kScreenWidth;
        _currentPageNumber = (int)_pageControl.currentPage;
    }
    
}

-(NSMutableArray *)adsMutableArr
{
    if (!_adsMutableArr) {
        
        _adsMutableArr = [NSMutableArray new];
    }
    return _adsMutableArr;
}


-(NSMutableArray *)headerImageURLMuArr{
    if (!_headerImageURLMuArr) {
        _headerImageURLMuArr = [NSMutableArray array];
    }
    return _headerImageURLMuArr;
}
@end
