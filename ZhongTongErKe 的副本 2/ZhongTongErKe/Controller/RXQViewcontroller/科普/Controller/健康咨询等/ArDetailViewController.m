//
//  ArDetailViewController.m
//  ZhongTongErKe
//
//  Created by khj on 2017/6/4.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "ArDetailViewController.h"
#import "KJWebProgressLayer.h"
#import "UIBarButtonItem+Common.h"
#import "UserTool.h"

@interface ArDetailViewController ()<UIWebViewDelegate>
@property (nonatomic, copy) NSString *url;
@property (nonatomic, strong) UIColor *strokeColor;
@property (nonatomic, copy) NSString *webTitle;

@end

@implementation ArDetailViewController
{
    UIWebView *_webView;
    KJWebProgressLayer *_progressLayer; //载进度条
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.title = @"详情介绍";
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithIcon:colIconImageName showBadge:NO target:self action:@selector(collectAction)];
    
    

}
-(void)collectAction
{
    kshowMessage(@"提交中...");
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"scid"] = self.article.cid;
    params[@"userid"] = [UserTool user].userid;
    
    
    [HttpTool postWithURL:scwzParty params:params success:^(id json) {
        
        ICLog(@"%@",json);
        
        if (jsonMsg(json)) {
            
            [MBProgressHUD showSuccess:@"收藏成功！"];
            [self.navigationController popViewControllerAnimated:YES];
        }
      
        
    } failure:^(NSError *error) {
        
    }];

}
-(void)loadData
{
    [super loadData];
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"wz_id"] = self.article.cid;
   
    
    [HttpTool postWithURL: getXiangQingScience params:params success:^(id json) {
        
        ICLog(@"%@",json);
        
        if (jsonMsg(json)) {
            
             [_webView loadHTMLString:json[@"data"][@"content"] baseURL:nil];
        }
        else
        {
            
        }

        kHideHUDAll;
    } failure:^(NSError *error) {
        netWorkError;
        kHideHUDAll;
    }];

}
-(void)setUP{
    
    _webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    _webView.delegate = self;
   
    _progressLayer = [[KJWebProgressLayer alloc] initWithStrokeColor:_strokeColor];
    _progressLayer.frame = CGRectMake(0, 42, SCREEN_WIDTH, 2);
    [self.navigationController.navigationBar.layer addSublayer:_progressLayer];
    [self.view addSubview:_webView];
    [_progressLayer startLoad];
}
#pragma mark - UIWebViewDelegate
- (void)webViewDidStartLoad:(UIWebView *)webView {
    
}
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [_progressLayer finishedLoad];
    NSString *str = @"document.getElementsByTagName('body')[0].style.webkitTextSizeAdjust= '80%'";
    [webView stringByEvaluatingJavaScriptFromString:str];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    [_progressLayer finishedLoad];
}
- (void)dealloc {
    [_progressLayer closeTimer];
    [_progressLayer removeFromSuperlayer];
    _progressLayer = nil;
}

@end
