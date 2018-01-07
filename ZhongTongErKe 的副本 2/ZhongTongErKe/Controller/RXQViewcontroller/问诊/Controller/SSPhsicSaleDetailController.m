//
//  SSPhsicSaleDetailController.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/23.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSPhsicSaleDetailController.h"
#import "KJWebProgressLayer.h"
#import "UIBarButtonItem+Common.h"
#import "UserTool.h"

@interface SSPhsicSaleDetailController ()<UIWebViewDelegate>

@property (nonatomic, copy) NSString *url;
@property (nonatomic, strong) UIColor *strokeColor;
@property (nonatomic, copy) NSString *webTitle;

@end

@implementation SSPhsicSaleDetailController

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
    params[@"scid"] = self.activitieTheme.cid;
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


-(void)setUP{
    
    _webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    _webView.delegate = self;
    
    _progressLayer = [[KJWebProgressLayer alloc] initWithStrokeColor:_strokeColor];
    _progressLayer.frame = CGRectMake(0, 42, SCREEN_WIDTH, 2);
    [self.navigationController.navigationBar.layer addSublayer:_progressLayer];
     [_webView loadHTMLString:self.activitieTheme.content baseURL:nil];
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
