//
//  GuideView.m
//  MagicFinger
//
//  Created by khj on 16/11/7.
//  Copyright © 2016年 zeenc. All rights reserved.
//

#import "GuideView.h"
#define     GUIDE_FLAGS    @"/guide"

@interface GuideView ()<UIScrollViewDelegate> {
    int screen_width;
    int screen_height;
}
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) NSArray *imageArray;

@end

@implementation GuideView
+ (void)showGudieView:(NSArray *)imageArray {
    if(imageArray && imageArray.count > 0) {

        NSString *key = @"CFBundleShortVersionString";
        // 取出沙盒中存储的上次使用软件的版本号
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSString *lastVersion = [defaults stringForKey:key];
    
        // 获得当前软件的版本号
        NSString *currentVersion = [NSBundle mainBundle].infoDictionary[key];
        BOOL isExit = [currentVersion isEqualToString:lastVersion];
        if(!isExit) {
            GuideView *guideView = [[GuideView alloc] init:imageArray];
            
            [[UIApplication sharedApplication].delegate.window addSubview:guideView];
            // 存储新版本
            [defaults setObject:currentVersion forKey:key];
            [defaults synchronize];
        }
    }
}

- (instancetype)init:(NSArray *)imageArray {
    self = [super init];
    if(self) [self initThisView:imageArray];
    return self;
}

- (void)initThisView:(NSArray *)imageArray {
    _imageArray = imageArray;
    screen_width  = [UIScreen mainScreen].bounds.size.width;
    screen_height = [UIScreen mainScreen].bounds.size.height;
    self.frame = CGRectMake(0, 0, screen_width, screen_height);
    
    _scrollView=[[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, screen_width, screen_height)];
    _scrollView.contentSize=CGSizeMake(screen_width * (_imageArray.count), screen_height);
    _scrollView.pagingEnabled=YES;
    _scrollView.bounces = NO;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.tag = 7000;
    _scrollView.delegate = self;
    for (int i = 0; i < imageArray.count; i++) {
        CGRect frame = CGRectMake(i * screen_width, 0, screen_width, screen_height);
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:frame];
        imgView.image=[UIImage imageNamed:imageArray[i]];
        imgView.contentMode = UIViewContentModeScaleAspectFill;
        [_scrollView addSubview:imgView];
        
        if (i == imageArray.count - 1) {
            imgView.userInteractionEnabled = YES;
            UIButton *passbtn = [[UIButton alloc] init];

            [passbtn setImage:[UIImage imageNamed:@"passNormal.png"] forState:UIControlStateNormal];
            [passbtn setImage:[UIImage imageNamed:@"passHight.png"] forState:UIControlStateHighlighted];
            passbtn.backgroundColor = [UIColor clearColor];
           
            [passbtn addTarget:self action:@selector(dismissGuideView) forControlEvents:UIControlEventTouchUpInside];
            [imgView addSubview:passbtn];
            
            passbtn.sd_layout.bottomSpaceToView(imgView,kPx(100)).widthIs(kPx(280)).heightIs(kPx(78)).centerXEqualToView(imgView);
        }


    }
    [self addSubview:_scrollView];
}

#pragma mark scrollView的代理
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    if (scrollView.contentOffset.x >= (self.imageArray.count - 1) * screen_width) [self dismissGuideView];
}

-(void)dismissGuideView {
    [UIView animateWithDuration:0.6f animations:^{
        self.transform = (CGAffineTransformMakeScale(1.5, 1.5));
        self.backgroundColor = [UIColor clearColor];
        self.alpha = 0; //让scrollview 渐变消失
    }completion:^(BOOL finished) {
        [self removeFromSuperview];
    } ];
    
}



@end
