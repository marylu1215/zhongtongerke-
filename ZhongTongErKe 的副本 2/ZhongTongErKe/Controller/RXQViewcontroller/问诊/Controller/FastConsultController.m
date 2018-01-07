//
//  FastConsultController.m
//  ZhongTongErKe
//
//  Created by l m on 2017/7/16.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "FastConsultController.h"

@interface FastConsultController ()<UIWebViewDelegate>

@property (nonatomic ,strong) UIWebView *webView;

@end

@implementation FastConsultController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"快速咨询";
    
    _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://dct.zoosnet.net/LR/Chatpre.aspx?id=DCT57598962"]]];
    [self.view addSubview: _webView];
    _webView.scrollView.bounces = NO;
    _webView.scrollView.showsHorizontalScrollIndicator = NO;
    _webView.scrollView.scrollEnabled = NO;
    [_webView sizeToFit];
    _webView.delegate = self;
    
    
}

- (void)viewWillAppear:(BOOL)animated{
  
    self.tabBarController.tabBar.hidden = YES;
}
- (void)viewWillDisappear:(BOOL)animated{
  
    self.tabBarController.tabBar.hidden = NO;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    
   
 
    
    
}



@end
