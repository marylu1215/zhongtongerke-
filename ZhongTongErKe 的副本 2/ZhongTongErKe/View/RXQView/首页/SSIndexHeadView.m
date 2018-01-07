//
//  SSIndexHeadView.m
//  ZhongTongErKe
//
//  Created by Claf on 17/4/28.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSIndexHeadView.h"
#import "SSBottomScrollView.h"
#import "SSIndexCollectionViewCell.h"
#import "XFModelTest.h"
#import "Course.h"
#import "Assessment.h"
#import "LMAd.h"

static NSString *cellIdentifire  = @"cell";

@interface SSIndexHeadView ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UIScrollViewDelegate>

@property (nonatomic,copy)NSMutableArray *collectionViewDataSource;
@property (nonatomic,strong) NSMutableArray *headerImageURLMuArr;
@property (nonatomic, assign) CGFloat timeInterval; /**<  滑动间隔   **/
@property (atomic,strong) UIView *headerSVBackView;
@property (nonatomic,strong) UIPageControl *pageControl;
@property (nonatomic,strong) TouchScrollView *horScrollView;
@property (nonatomic,strong) NSTimer *timer;
@property (nonatomic,assign) int pageNumber;
@property (nonatomic,assign) int currentPageNumber;
@property (nonatomic,strong) NSMutableArray *adsMutableArr;
@end

@implementation SSIndexHeadView



+ (instancetype)loadHeaderView{
    
    SSIndexHeadView *view = [[SSIndexHeadView alloc]init];
    [view addSubviews];
    [view makeConstraits];
 
    return view;
    
}


- (void)addSubviews{
    
    [self addHeaderScrollView];
    
    [self addSubview:self.collectionView];
    
    [self addSubview:self.bottomScrollview];

    SSBottomScrollView *aBottomScrollView = [[SSBottomScrollView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, px(160)) courseArray:[Course mj_objectArrayWithKeyValuesArray:[XFModelTest sharedModelTest].todayCoursesDict[@"todayCourses"]]];
    __weak typeof (self) weakSelf = self;
    aBottomScrollView.chooseBlock = ^()
    {
        if (weakSelf.chooseBlock) {
            weakSelf.chooseBlock();
        }
    };
    
    [self.bottomScrollview addSubview:aBottomScrollView];
    
 
    self.healthView = [[PopularHealthView alloc]init];
    [self addSubview:self.healthView];
   
    [self loadData];
    [self loadAssessmentData];
    
}

-(void)loadData
{
        kshowMessage(@"数据加载中");
        NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
        params[@"position"]= @"1";
    
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

-(void)loadAssessmentData
{
    kshowMessage(@"数据加载中");
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    [HttpTool postWithURL: getcheshi_typ params:params success:^(id json) {
        
       
        
        if (jsonMsg(json)) {
            
            self.healthView.assessmentArray = [NSArray getIntendWithIntendNum:3 IntendArr:[Assessment mj_objectArrayWithKeyValuesArray:json[@"data"]]];
        }
        kHideHUDAll;
        
    } failure:^(NSError *error) {
        netWorkError;
        kHideHUDAll;
    }];
    
}

- (void)makeConstraits{

    self.collectionView.sd_layout.widthIs(kScreenWidth).heightIs(px(166)).topSpaceToView(self,px(340));
    
    self.bottomScrollview.sd_layout.widthIs(kScreenWidth).heightIs(px(160)).topSpaceToView( self.collectionView,0);
     
    self.healthView.sd_layout.widthIs(kScreenWidth).heightIs(px(240)).topSpaceToView(self.bottomScrollview,0);
}

#pragma mark -- private action
//** 添加计划 */
#pragma TODO
- (void)addPlanTaped{
  
    
}


#pragma mark datasourse and delegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.delegate respondsToSelector:@selector(collectionItemTaped:)] && self.delegate) {
        [self.delegate collectionItemTaped:indexPath.row];
    }
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.collectionViewDataSource.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    SSIndexCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifire forIndexPath:indexPath];
    NSDictionary *info = self.collectionViewDataSource[indexPath.row];
    cell.imageView.image = [UIImage imageNamed:info[@"imageName"]];
    cell.label.text = info[@"text"];
    cell.backgroundColor = [UIColor whiteColor];
    return cell;
    
}

#pragma mark - 滚动首页展示
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
   
    _horScrollView =[[TouchScrollView alloc]init];
    [headerSVBackView addSubview:_horScrollView];
    headerSVBackView.sd_layout.topSpaceToView(self,0).widthIs(kScreenWidth).heightIs(170);
      _horScrollView.frame = headerSVBackView.frame;
    _horScrollView.pagingEnabled=YES;
    _horScrollView.delegate = self;
    _horScrollView.bounces=NO;
    _horScrollView.showsHorizontalScrollIndicator=NO;//不显示水平线
    [self createPageControl];
    [headerSVBackView addSubview:_pageControl];
    //
    //下载没图片时的点位图
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 170)];
    [imageView setImage:[UIImage imageNamed:bannerImageName]];
    [_horScrollView addSubview:imageView];

    
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
    
        [_horScrollView addSubview:imageView];
    }
    if (self.headerImageURLMuArr.count == 0) {
        //下载没图片时的点位图
        UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 170)];
        [imageView setImage:[UIImage imageNamed:@"s01"]];
        [_horScrollView addSubview:imageView];
    }
    _horScrollView.contentSize=CGSizeMake(self.headerImageURLMuArr.count*kScreenWidth, 0);//活动范围，这里只支持左右，上下不支持
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
    _pageControl.frame = CGRectMake(0, _headerSVBackView.height - px(12) - px(12), _headerSVBackView.width, px(12));
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
            [_horScrollView setContentOffset:CGPointMake((_pageNumber)*kScreenWidth, 0) animated:NO];
        }else{
            [_horScrollView setContentOffset:CGPointMake((_pageNumber)*kScreenWidth, 0) animated:YES];
            
        }
    }
   
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{

 
    if (scrollView == _horScrollView) {
        _pageControl.currentPage = scrollView.contentOffset.x/kScreenWidth;
        _currentPageNumber = (int)_pageControl.currentPage;
    }
    
}
- (UICollectionViewFlowLayout *)flowLayout{
    if (!_flowLayout) {
        _flowLayout = [[UICollectionViewFlowLayout alloc]init];
        _flowLayout.itemSize = CGSizeMake(53*kScreenWidthScale, 73);
        _flowLayout.minimumInteritemSpacing = 40*kScreenWidthScale;
        _flowLayout.sectionInset = UIEdgeInsetsMake(5, 15, 5, 15);
        
        _flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    }
    return _flowLayout;
}


- (UICollectionView *)collectionView{
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, 0, 0) collectionViewLayout:self.flowLayout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        [_collectionView registerClass:[SSIndexCollectionViewCell class] forCellWithReuseIdentifier:cellIdentifire];
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"ident"];
    }
    return _collectionView;
}
- (UIView *)bottomScrollview{
    if (!_bottomScrollview) {
        _bottomScrollview = [[UIView alloc]init];
        _bottomScrollview.backgroundColor = BACKGROUND_COLOR;
        
    }
    return _bottomScrollview;
}


- (NSMutableArray *)collectionViewDataSource{
    if (!_collectionViewDataSource) {
        _collectionViewDataSource = [NSMutableArray arrayWithCapacity:0];
        NSArray *array = @[@{@"imageName":index_healthJudgeImageName,@"text":@"健康评估"},@{@"imageName":index_healthTaskImageName,@"text":@"健康任务"},@{@"imageName":index_healthPlanImageName,@"text":@"健康课程"},@{@"imageName":index_healthFileImageName,@"text":@"每日签到"},];
        [_collectionViewDataSource addObjectsFromArray:array];
    }
    return _collectionViewDataSource;
}


#pragma mark 懒加载
-(NSMutableArray *)headerImageURLMuArr{
    if (!_headerImageURLMuArr) {
        _headerImageURLMuArr = [NSMutableArray array];
    }
    return _headerImageURLMuArr;
}

-(NSMutableArray *)adsMutableArr
{
    if (!_adsMutableArr) {
        
        _adsMutableArr = [NSMutableArray new];
    }
    return _adsMutableArr;
}
-(void)clickAction
{
    
    if (self.clickActionBlock) {
        
        self.clickActionBlock ();
    }
}
@end
