//
//  CJVideoPlayer.m
//  CJVideoPlayer
//
//  Created by YouChangJiang on 16/4/20.
//  Copyright © 2016年 YouChangJiang. All rights reserved.
//

#import "CJVideoPlayer.h"
#import "Masonry.h"
#import "CJSlider.h"
#import <AVFoundation/AVFoundation.h>

#define kPlayerBackgroundColor [UIColor blackColor].CGColor
#define kBarAnimateSpeed 0.5f
#define kBarBarShowDuration 4.0f
#define kOpacity 0.7f
#define kBottomBarHeight 40.0f
#define kPlayBtnSideLength 60.0f

@interface CJVideoPlayer ()

/**videoPlayer superView*/
@property (nonatomic, strong) UIView *playSuprView;
@property (nonatomic, strong) UIView *bottomBar;
@property (nonatomic, strong) UIButton *playOrPauseBtn;
@property (nonatomic, strong) UILabel *totalDurationLabel;
@property (nonatomic, strong) UILabel *progressLabel;
@property (nonatomic, strong) CJSlider *slider;
@property (nonatomic, strong) UIWindow *keyWindow;
@property (nonatomic, strong) UIActivityIndicatorView *activityIndicatorView;
@property (nonatomic, assign) CGRect playerOriginalFrame;
@property (nonatomic, strong) UIButton *zoomScreenBtn;

@property (nonatomic, strong) AVPlayerItem *playerItem;
@property (nonatomic, strong) AVPlayerLayer *playerLayer;
/**video player*/
@property (nonatomic,strong) AVPlayer *player;
/**video total duration*/
@property (nonatomic, assign) CGFloat totalDuration;

@property (nonatomic, strong) UITableView *bindTableView;
@property (nonatomic, assign) CGRect currentPlayCellRect;
@property (nonatomic, strong) NSIndexPath *currentIndexPath;

@property (nonatomic, assign) BOOL isOriginalFrame;
@property (nonatomic, assign) BOOL isFullScreen;
@property (nonatomic, assign) BOOL barHiden;
@property (nonatomic, assign) BOOL inOperation;
@property (nonatomic, assign) BOOL smallWinPlaying;

@end

@implementation CJVideoPlayer

-(instancetype)init
{
    
    if ([super init]) {
        self.backgroundColor = [UIColor blackColor];
        self.keyWindow = [UIApplication sharedApplication].keyWindow;
        [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
        [[NSNotificationCenter defaultCenter]
                                                 addObserver:self
                                                 selector:@selector(statusBarOrientationChanged:)
                                                  name:UIDeviceOrientationDidChangeNotification
                                                   object:[UIDevice currentDevice]
         ];
        
        UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showOrHideBar:)];
        [self addGestureRecognizer:tapGes];
        
        self.barHiden = YES;
    }
    return self;
}

-(void)setVideoUrl:(NSString *)videoUrl
{
    _videoUrl = videoUrl;
    [self.layer addSublayer:self.playerLayer];
    [self addSubview:self.activityIndicatorView];
    [self.activityIndicatorView startAnimating];
    [self playOrPause:self.playOrPauseBtn];
    [self addSubview:self.bottomBar];
    [self addSubview:self.playOrPauseBtn];
}

//显示或者隐藏toolBar
-(void) showOrHideBar:(UIGestureRecognizer *) ges
{
    if (self.barHiden) {
        [self show];
    }else {
        [self hiden];
    }
}

-(void) performBlock:(void (^) (void)) block afterDelay:(NSTimeInterval) delay
{
    [self performSelector:@selector(doneBlock:) withObject:block afterDelay:delay];
}

-(void) doneBlock:(void (^) (void)) block
{
    
    block();
}

-(void) show
{
    [UIView animateWithDuration:kBarBarShowDuration animations:^{
        self.bottomBar.layer.opacity = kOpacity;
        self.playOrPauseBtn.layer.opacity = kOpacity;
    } completion:^(BOOL finished) {
        if (finished) {
            
            self.barHiden = !self.barHiden;
            [self performBlock:^{
                if (!self.barHiden && !self.inOperation) {
                    [self hiden];
                }
            } afterDelay:kBarBarShowDuration];
        }
    }];
}

-(void) hiden
{
    [UIView animateWithDuration:kBarAnimateSpeed animations:^{
        self.bottomBar.layer.opacity = 0;
        self.playOrPauseBtn.layer.opacity = 0;
    } completion:^(BOOL finished) {
        if (finished) {
            self.barHiden = !self.barHiden;
        }
    }];
}

#pragma mark - status hiden

- (void)setStatusBarHidden:(BOOL)hidden {
    UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
    statusBar.hidden = hidden;
}
//设备方向改变时
-(void) statusBarOrientationChanged:(NSNotification *) notification
{
    if (self.smallWinPlaying) return;
    UIDeviceOrientation orientation = [UIDevice currentDevice].orientation;
    [self orientationWith:orientation];//控制全屏模式(Portrait默认小屏)
}

-(void) orientationWith:(UIDeviceOrientation) orientation
{
    
    if (orientation == UIDeviceOrientationLandscapeLeft) {//左全屏
        self.isFullScreen = YES;
        self.zoomScreenBtn.selected = YES;
        [self.keyWindow addSubview:self];
        [[UIDevice currentDevice] setValue:[NSNumber numberWithInteger:UIDeviceOrientationLandscapeLeft] forKey:@"orientation"];
        [self updateConstraintsIfNeeded];
        
        [UIView animateWithDuration:0.3 animations:^{
            self.transform = CGAffineTransformMakeRotation(M_PI/2);
            self.frame = self.keyWindow.bounds;
            
            self.bottomBar.frame = CGRectMake(
                                              0,
                                              CGRectGetWidth(self.keyWindow.bounds) - kBottomBarHeight,
                                              CGRectGetHeight(self.keyWindow.bounds),
                                              kBottomBarHeight
                                              );
            self.playOrPauseBtn.frame = CGRectMake(
                                                   (CGRectGetHeight(self.keyWindow.bounds)-kPlayBtnSideLength)/2,
                                                   (CGRectGetWidth(self.keyWindow.bounds)-kPlayBtnSideLength)/2,
                                                   kPlayBtnSideLength,
                                                   kPlayBtnSideLength
                                                   );
            
            self.activityIndicatorView.center = CGPointMake(
                                                            CGRectGetHeight(self.keyWindow.bounds)/2,
                                                            CGRectGetWidth(self.keyWindow.bounds)/2
                                                            );
            
        }];
        
        [self setStatusBarHidden:YES];
       
    }else if (orientation == UIDeviceOrientationLandscapeRight) {//右全屏
        self.isFullScreen = YES;
        self.zoomScreenBtn.selected = YES;
        [self.keyWindow addSubview:self];
        [[UIDevice currentDevice] setValue:[NSNumber numberWithInteger:UIDeviceOrientationLandscapeRight] forKey:@"orientation"];
        [self updateConstraintsIfNeeded];
        [UIView animateWithDuration:0.3 animations:^{
            self.transform = CGAffineTransformMakeRotation(-M_PI/2);
            self.frame = self.keyWindow.bounds;
            
            self.bottomBar.frame = CGRectMake(
                                              0,
                                              CGRectGetWidth(self.keyWindow.bounds) - kBottomBarHeight,
                                              CGRectGetHeight(self.keyWindow.bounds),
                                              kBottomBarHeight
                                              );
            self.playOrPauseBtn.frame = CGRectMake(
                                                   (CGRectGetHeight(self.keyWindow.bounds)-kPlayBtnSideLength)/2,
                                                   (CGRectGetWidth(self.keyWindow.bounds)-kPlayBtnSideLength)/2,
                                                   kPlayBtnSideLength,
                                                   kPlayBtnSideLength
                                                   );
            
            self.activityIndicatorView.center = CGPointMake(
                                                            CGRectGetHeight(self.keyWindow.bounds)/2,
                                                            CGRectGetWidth(self.keyWindow.bounds)/2
                                                            );
            
        }];
        
        [self setStatusBarHidden:YES];
     
    }else if (orientation == UIDeviceOrientationPortrait) {//小屏
        self.isFullScreen = NO;
        self.zoomScreenBtn.selected = NO;
        [[UIDevice currentDevice] setValue:[NSNumber numberWithInteger:UIDeviceOrientationPortrait] forKey:@"orientation"];
        if (self.bindTableView) {
            UITableViewCell *cell = [self.bindTableView cellForRowAtIndexPath:self.currentIndexPath];
            [cell.contentView addSubview:self];
        }
        
        [UIView animateWithDuration:0.3 animations:^{
            self.transform = CGAffineTransformMakeRotation(0);
            self.frame = self.playerOriginalFrame;
            self.bottomBar.frame = CGRectMake(
                                              0,
                                              CGRectGetHeight(self.playerOriginalFrame) - kBottomBarHeight,
                                              CGRectGetWidth(self.playerOriginalFrame),
                                              kBottomBarHeight
                                              );
            self.playOrPauseBtn.frame = CGRectMake(
                                                   (CGRectGetWidth(self.playerOriginalFrame)-kPlayBtnSideLength)/2,
                                                   (CGRectGetHeight(self.playerOriginalFrame)-kPlayBtnSideLength)/2,
                                                   kPlayBtnSideLength,
                                                   kPlayBtnSideLength
                                                   );
            
            self.activityIndicatorView.center = CGPointMake(
                                                            CGRectGetWidth(self.playerOriginalFrame)/2,
                                                            CGRectGetHeight(self.playerOriginalFrame)/2
                                                            );
            
            [self updateConstraintsIfNeeded];
        }];
        [self setStatusBarHidden:NO];
       
    }
}

-(void) playOrPause:(UIButton *) btn
{
    if(self.player.rate == 0){      //pause
        btn.selected = YES;
        [self.player play];
    }else if(self.player.rate == 1){    //playing
        [self.player pause];
        btn.selected = NO;
    }
}

//播放或者暂停
-(void) playPause
{
    [self playOrPause:self.playOrPauseBtn];
}

//销毁
-(void) destroyPlayer
{
    [self.player pause];
    [self removeFromSuperview];
}

//在cell上播放必须绑定TableView和IndexPath
-(void) palyerBindTableView:(UITableView *) tableView atIndexPath:(NSIndexPath *) indexPath
{
    self.bindTableView = tableView;
    self.currentIndexPath = indexPath;
}

//是否支持小窗悬停播放(在scrollview代理scrollViewDidScroll里调用)
-(void) isSupportSmallWindowPlaying:(BOOL) isSupport
{
    
    
    self.currentPlayCellRect = [self.bindTableView rectForRowAtIndexPath:self.currentIndexPath];
    CGFloat cellBottom = CGRectGetMaxY(self.currentPlayCellRect);
    CGFloat cellUp = CGRectGetMinY(self.currentPlayCellRect);
    
    //向上滑动,离开屏幕
    if (self.bindTableView.contentOffset.y > cellBottom) {
        if(!isSupport) {
            [self destroyPlayer];//销毁
            return;
        }
        [self smallWindowPlay];
        return;
    }
    
    //向下滑动,离开屏幕
    if(cellUp > self.bindTableView.contentOffset.y+CGRectGetHeight(self.bindTableView.frame))
    {
        if(!isSupport) {
            [self destroyPlayer];//销毁
            return;
        }
        [self smallWindowPlay];
        return;
    }
    
    //向下滑动，回到屏幕
    if (self.bindTableView.contentOffset.y < cellBottom) {
        if (!isSupport) return;
        [self returnToOriginView];
        return;
    }
    
    //向上滑动，回到屏幕
    if(cellUp < self.bindTableView.contentOffset.y+CGRectGetHeight(self.bindTableView.frame))
    {
        if (!isSupport) return;
        [self returnToOriginView];
        return;
    }
}

-(void) smallWindowPlay {
    if ([self.superview isKindOfClass:[UIWindow class]]) {
        return;//已经在window上不创建小窗播放
    }
    self.smallWinPlaying = YES;
    self.playOrPauseBtn.hidden = YES;
    self.bottomBar.hidden = YES;
    
    CGRect tableViewFrame = [self.bindTableView convertRect:self.bindTableView.bounds toView:self.keyWindow];
    self.frame = [self convertRect:self.frame toView:self.keyWindow];
    [self.keyWindow addSubview:self];
    
    [UIView animateWithDuration:0.3f animations:^{
        CGFloat w = CGRectGetWidth(self.playerOriginalFrame)*0.5;
        CGFloat h = CGRectGetHeight(self.playerOriginalFrame)*0.5;
        CGRect smallFrame = CGRectMake(CGRectGetMaxX(tableViewFrame)-w, CGRectGetMaxY(tableViewFrame)-h, w, h);
        self.frame = smallFrame;
        self.playerLayer.frame = self.bounds;
        self.activityIndicatorView.center = CGPointMake(w/2, h/2);
    }];
}

-(void) returnToOriginView {
    if (![self.superview isKindOfClass:[UIWindow class]]) {
        return;//没在window上不做处理
    }
    self.smallWinPlaying = NO;
    self.playOrPauseBtn.hidden = NO;
    self.bottomBar.hidden = NO;
    [UIView animateWithDuration:0.3 animations:^{
        self.frame = CGRectMake(
                                CGRectGetMinX(self.currentPlayCellRect),
                                CGRectGetMinY(self.currentPlayCellRect),
                                CGRectGetWidth(self.playerOriginalFrame),
                                CGRectGetHeight(self.playerOriginalFrame)
                                );
        self.playerLayer.frame = self.bounds;
        self.activityIndicatorView.center = CGPointMake(
                                                        CGRectGetWidth(self.playerOriginalFrame)/2,
                                                        CGRectGetHeight(self.playerOriginalFrame)/2
                                                        );
    } completion:^(BOOL finished){
        self.frame = self.playerOriginalFrame;
        UITableViewCell *cell = [self.bindTableView cellForRowAtIndexPath:_currentIndexPath];
        [cell.contentView addSubview:self];
    }];
}

#pragma mark-LayoutSubviews
-(void)layoutSubviews {
    [super layoutSubviews];
    self.playerLayer.frame = self.bounds;
    
    if (!self.isOriginalFrame) {
        self.playerOriginalFrame = self.frame;
        self.playSuprView = self.superview;
        self.bottomBar.frame = CGRectMake(
                                          0,
                                          CGRectGetHeight(self.playerOriginalFrame) - kBottomBarHeight,
                                          CGRectGetWidth(self.playerOriginalFrame),
                                          kBottomBarHeight
                                          );
        self.playOrPauseBtn.frame = CGRectMake(
                                               (CGRectGetWidth(self.playerOriginalFrame)-kPlayBtnSideLength)/2,
                                               (CGRectGetHeight(self.playerOriginalFrame)-kPlayBtnSideLength)/2,
                                               kPlayBtnSideLength,
                                               kPlayBtnSideLength
                                               );
        
        self.activityIndicatorView.center = CGPointMake(
                                                        CGRectGetWidth(self.playerOriginalFrame)/2,
                                                        CGRectGetHeight(self.playerOriginalFrame)/2
                                                        );
        self.isOriginalFrame = YES;
    }
}

#pragma mark- lazy loading
-(AVPlayerLayer *)playerLayer
{
    if (!_playerLayer) {
        _playerLayer = [AVPlayerLayer playerLayerWithPlayer:self.player];
        _playerLayer.backgroundColor = kPlayerBackgroundColor;
        _playerLayer.videoGravity = AVLayerVideoGravityResizeAspect;//视频填充模式
    }
    return _playerLayer;
}

-(AVPlayer *)player
{
    if (!_player) {
        self.playerItem = [self getAVPlayItem];
        self.player = [[AVPlayer alloc] initWithPlayerItem:self.playerItem];
        
        [self addProgressObserver];
        [self addObserverToItem:self.playerItem];
    }
    return _player;
}

//initialize AVPlayerItem
-(AVPlayerItem *)getAVPlayItem
{
    NSAssert(self.videoUrl != nil, @"必须传入播放地址");
    if ([self.videoUrl rangeOfString:@"http"].location != NSNotFound) {
    
        AVPlayerItem *item = [[AVPlayerItem alloc] initWithURL:[NSURL URLWithString:_videoUrl]];
        
        return item;
    } else {
        AVPlayerItem *item = [[AVPlayerItem alloc] initWithAsset:[AVAsset assetWithURL:[NSURL URLWithString:self.videoUrl]]];
        return item;
    }
}

-(UIActivityIndicatorView *)activityIndicatorView
{
    if (!_activityIndicatorView) {
        _activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    }
    return _activityIndicatorView;
}

-(UIView *)bottomBar
{
    if (!_bottomBar) {
        _bottomBar = [[UIView alloc] init];
        _bottomBar.backgroundColor = [UIColor blackColor];
        _bottomBar.layer.opacity = 0.0f;
        
        UILabel *label1 = [[UILabel alloc] init];
        label1.translatesAutoresizingMaskIntoConstraints = NO;
        label1.textAlignment = NSTextAlignmentCenter;
        label1.text = @"00:00:00";
        label1.font = [UIFont systemFontOfSize:12.0f];
        label1.textColor = [UIColor whiteColor];
        [_bottomBar addSubview:label1];
        self.progressLabel = label1;
        
        [label1 mas_makeConstraints:^(MASConstraintMaker *maker) {
            maker.left.top.bottom.mas_equalTo(0);
            maker.width.mas_equalTo(65);
        }];
        
        UIButton *fullScreenBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        fullScreenBtn.translatesAutoresizingMaskIntoConstraints = NO;
        fullScreenBtn.contentMode = UIViewContentModeCenter;
        [fullScreenBtn setImage:[UIImage imageNamed:@"ImageResources.bundle/btn_zoom_out"] forState:UIControlStateNormal];
        [fullScreenBtn setImage:[UIImage imageNamed:@"ImageResources.bundle/btn_zoom_in"] forState:UIControlStateSelected];
        [fullScreenBtn addTarget:self action:@selector(actionFullScreen) forControlEvents:UIControlEventTouchDown];
        [_bottomBar addSubview:fullScreenBtn];
        self.zoomScreenBtn = fullScreenBtn;
        
        [fullScreenBtn mas_makeConstraints:^(MASConstraintMaker *maker) {
            maker.width.height.mas_equalTo(40);
            maker.right.mas_equalTo(0);
            maker.centerY.mas_equalTo(fullScreenBtn.superview);
        }];
        
        UILabel *label2 = [[UILabel alloc] init];
        label2.translatesAutoresizingMaskIntoConstraints = NO;
        label2.textAlignment = NSTextAlignmentCenter;
        label2.text = @"00:00:00";
        label2.font = [UIFont systemFontOfSize:12.0f];
        label2.textColor = [UIColor whiteColor];
        [_bottomBar addSubview:label2];
        self.totalDurationLabel = label2;
        
        [label2 mas_makeConstraints:^(MASConstraintMaker *maker) {
            maker.right.mas_equalTo(fullScreenBtn.mas_left).offset(0);
            maker.top.bottom.mas_equalTo(0);
            maker.width.mas_equalTo(65);
        }];
        
        CJSlider *slider = [[CJSlider alloc] init];
        slider.value = 0.0f;
        slider.middleValue = 0.0f;
        slider.translatesAutoresizingMaskIntoConstraints = NO;
        [_bottomBar addSubview:slider];
        self.slider = slider;
        __weak typeof(self) weakSelf = self;
        slider.valueChangeBlock = ^(CJSlider *slider){
            [weakSelf sliderValueChange:slider];
        };
        slider.finishChangeBlock = ^(CJSlider *slider){
            [weakSelf finishChange];
        };
        slider.draggingSliderBlock = ^(CJSlider *slider){
            [weakSelf dragSlider];
        };
        
        [slider mas_makeConstraints:^(MASConstraintMaker *maker) {
            maker.left.mas_equalTo(label1.mas_right).offset(0);
            maker.right.mas_equalTo(label2.mas_left).offset(0);
            maker.top.mas_equalTo(0);
            maker.bottom.mas_equalTo(0);
        }];
        
        [self updateConstraintsIfNeeded];
    }
    return _bottomBar;
}

-(UIButton *)playOrPauseBtn
{
    if (!_playOrPauseBtn) {
        _playOrPauseBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _playOrPauseBtn.layer.opacity = 0.0f;
        _playOrPauseBtn.contentMode = UIViewContentModeCenter;
        [_playOrPauseBtn setBackgroundImage:[UIImage imageNamed:@"ImageResources.bundle/play"] forState:UIControlStateNormal];
        [_playOrPauseBtn setBackgroundImage:[UIImage imageNamed:@"ImageResources.bundle/pause"] forState:UIControlStateSelected];
        [_playOrPauseBtn addTarget:self action:@selector(playOrPause:) forControlEvents:UIControlEventTouchDown];
    }
    return _playOrPauseBtn;
}

-(void) sliderValueChange:(CJSlider *) slider
{
    self.progressLabel.text = [self timeFormatted:slider.value * self.totalDuration];
}

-(void) finishChange
{
    self.inOperation = NO;
    [self performBlock:^{
        if (!self.barHiden && !self.inOperation) {
            [self hiden];
        }
    } afterDelay:kBarBarShowDuration];
    
    CMTime currentCMTime = CMTimeMake(self.slider.value * self.totalDuration, 1);
    [self.player seekToTime:currentCMTime completionHandler:^(BOOL finished){
        [self.player play];
        self.playOrPauseBtn.selected = YES;
    }];
}

-(void) dragSlider
{
    self.inOperation = YES;
    [self.player pause];

}

#pragma mark - timeFormat

- (NSString *)timeFormatted:(int)totalSeconds {
    int seconds = totalSeconds % 60;
    int minutes = (totalSeconds / 60) % 60;
    int hours = totalSeconds / 3600;
    return [NSString stringWithFormat:@"%02d:%02d:%02d", hours, minutes, seconds];
}

#pragma mark-ActionFullScreen
-(void) actionFullScreen
{
    if (!self.isFullScreen) {
        [self orientationWith:UIDeviceOrientationLandscapeLeft];
    } else {
        [self orientationWith:UIDeviceOrientationPortrait];
    }
}


#pragma mark - monitor video playing course
-(void) addProgressObserver
{
    AVPlayerItem *currentItem = self.player.currentItem;
    __weak typeof(self) weakSelf = self;
    
    //设置周期1秒更新UI
    [self.player addPeriodicTimeObserverForInterval:CMTimeMake(1.0, 1.0) queue:dispatch_get_main_queue() usingBlock:^(CMTime time) {
        CGFloat current = CMTimeGetSeconds(time);
        CGFloat total = CMTimeGetSeconds(currentItem.duration);
        //设置时间标签
        weakSelf.progressLabel.text = [weakSelf timeFormatted:current];
        
        if (current) {
            weakSelf.slider.value = current/total;
            
            if (weakSelf.slider.value == 1) {
                if (weakSelf.completedPlayingBlock) {
                    [weakSelf setStatusBarHidden:NO];
                    weakSelf.completedPlayingBlock(weakSelf);
                } else {//finish and loop playback
                    weakSelf.playOrPauseBtn.selected = NO;
                    [weakSelf showOrHideBar:nil];
                    CMTime time = CMTimeMake(0, 1);
                    [weakSelf.player seekToTime:time completionHandler:^(BOOL finished) {
                        weakSelf.slider.value = 0;
                    }];
                }
                    
            }
        }
    }];
}

#pragma mark - PlayerItem （status，loadedTimeRanges）
-(void) addObserverToItem:(AVPlayerItem *) item
{
    [item addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];
    [item addObserver:self forKeyPath:@"loadedTimeRanges" options:NSKeyValueObservingOptionNew context:nil];
    
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    AVPlayerItem *item = object;
    if ([keyPath isEqualToString:@"status"]) {
        AVPlayerStatus status = [[change objectForKey:@"new"] intValue];
        if (status == AVPlayerStatusReadyToPlay) {
            self.totalDuration = CMTimeGetSeconds(item.duration);
            self.totalDurationLabel.text = [self timeFormatted:self.totalDuration];
        }
    } else if ([keyPath isEqualToString:@"loadedTimeRanges"]) {
        NSArray *array = item.loadedTimeRanges;
        CMTimeRange range = [array.firstObject CMTimeRangeValue];//本地缓冲时间范围
        CGFloat startSeconds = CMTimeGetSeconds(range.start);
        CGFloat rangeDuration = CMTimeGetSeconds(range.duration);
        NSTimeInterval totalBuffer = startSeconds + rangeDuration;//缓冲总长度
        self.slider.middleValue = totalBuffer/CMTimeGetSeconds(item.duration);
        
        if (self.slider.middleValue <= self.slider.value) {
           
            self.activityIndicatorView.center = self.center;
            [self addSubview:self.activityIndicatorView];
            [self.activityIndicatorView startAnimating];
        } else {
            [self.activityIndicatorView stopAnimating];
            [self.activityIndicatorView removeFromSuperview];
        }
    }
}

#pragma mark - dealloc

- (void)dealloc {
    [self.playerItem removeObserver:self forKeyPath:@"status"];
    [self.playerItem removeObserver:self forKeyPath:@"loadedTimeRanges"];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIDeviceOrientationDidChangeNotification object:[UIDevice currentDevice]];
  
}



@end
