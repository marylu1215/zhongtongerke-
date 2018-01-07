//
//  CJVideoPlayer.h
//  CJVideoPlayer
//
//  Created by YouChangJiang on 16/4/20.
//  Copyright © 2016年 YouChangJiang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CJVideoPlayer;

typedef void(^VideoCompletedPlayingBlock)(CJVideoPlayer *videoPlayer);

@interface CJVideoPlayer : UIView

@property (nonatomic,copy) VideoCompletedPlayingBlock completedPlayingBlock;

//播放地址
@property (nonatomic,copy) NSString *videoUrl;

//播放或者暂停
-(void) playPause;

//销毁
-(void) destroyPlayer;

//在cell上播放必须绑定TableView和IndexPath
-(void) palyerBindTableView:(UITableView *) tableView atIndexPath:(NSIndexPath *) indexPath;

//是否支持小窗悬停播放(在scrollview代理scrollViewDidScroll里调用)
-(void) isSupportSmallWindowPlaying:(BOOL) isSupport;

@end
