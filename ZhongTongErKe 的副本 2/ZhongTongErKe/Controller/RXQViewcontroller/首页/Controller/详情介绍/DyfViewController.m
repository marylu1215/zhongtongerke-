//
//  DyfViewController.m
//  ZhongTongErKe
//
//  Created by khj on 2017/6/26.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "DyfViewController.h"
#import "InDetaileView.h"
#import "ExConsult.h"

@interface DyfViewController ()

@property (nonatomic ,weak) InDetaileView *detaileView;

@end

@implementation DyfViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.title = @"详情介绍";
    
    
    InDetaileView *detaileView = [[InDetaileView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 200) ];
    self.detaileView = detaileView;
    
    __weak typeof (self) weakSelf = self;
    
    detaileView.priseBlcok = ^{
        
        [weakSelf priseAction];
        
    };
    
    [self.view addSubview:detaileView];
    
    
    
}

-(void)priseAction
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"id"] = self.exConsult.cid;
    
    [MBProgressHUD showMessage:@"点赞中..."];
    
    [HttpTool postWithURL:getvoice_numParty  params:params success:^(id json) {
        
        ICLog(@"json menu:%@",json);
        
        if (jsonMsg(json)) {
            
            [MBProgressHUD showSuccess:@"点赞成功..."];

            
        }
        else
        {
            [MBProgressHUD showError:json[@"msg"]];
            
        }
        kHideHUDAll;
    } failure:^(NSError *error) {
        
        netWorkError;
        kHideHUDAll;
    }];

}
-(void)loadData
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"id"] = self.exConsult.cid;
    
    [MBProgressHUD showMessage:@"数据加载中..."];
    
    [HttpTool postWithURL:getvoice_detailsParty  params:params success:^(id json) {
       
        ICLog(@"json menu:%@",json);
        
        if (jsonMsg(json)) {
            
            self.detaileView.exConsult =[ExConsult mj_objectWithKeyValues:json [@"data"]];
            
           
        }
        else
        {
            [MBProgressHUD showError:json[@"msg"]];
            
        }
        kHideHUDAll;
    } failure:^(NSError *error) {
        
        netWorkError;
        kHideHUDAll;
    }];

}




@end
