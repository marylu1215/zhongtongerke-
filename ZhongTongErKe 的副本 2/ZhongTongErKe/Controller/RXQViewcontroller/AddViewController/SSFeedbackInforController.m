//
//  SSFeedbackInforController.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/29.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSFeedbackInforController.h"
#import "KJPlaceholderTextView.h"
#import "UserTool.h"

@interface SSFeedbackInforController ()

@property (nonatomic,strong) KJPlaceholderTextView *textView;
@property (nonatomic,strong)UIButton *sureButton;

@end

@implementation SSFeedbackInforController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"反馈信息";
    [self addSubviews];
    [self makeConstaits];
    self.view.backgroundColor = BACKGROUND_COLOR;
}


#pragma mark --private
- (void)addSubviews{
    [self.view addSubview:self.textView];
    [self.view addSubview:self.sureButton];
}
- (void)makeConstaits{
    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(kScreenWidth, 185*kScreenHeightScale));
        make.left.mas_equalTo(0);
    }];
    [self.sureButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(200*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(200*kScreenWidthScale, 25*kScreenHeightScale));
        make.left.mas_equalTo(87*kScreenWidthScale);
    }];
}



- (KJPlaceholderTextView  *)textView{
    if (!_textView) {
        _textView = [[KJPlaceholderTextView  alloc]init];
        _textView.font = [UIFont systemFontOfSize:12*kScreenHeightScale];
        _textView.textColor =REMARK_COLOR;
        _textView.placeholder = @"请再次输入您对我们的意见和建议哦";
    }
    return _textView;
}
- (UIButton *)sureButton{
    if (!_sureButton) {
        _sureButton = [[UIButton alloc]init];
        _sureButton.layer.cornerRadius = 3;
        _sureButton.backgroundColor = MAIN_COLOR;
        _sureButton.titleLabel.font = [UIFont systemFontOfSize:12*kScreenHeightScale];
        [_sureButton setTitle:@"确认发表" forState:UIControlStateNormal];
        [_sureButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_sureButton addTarget:self action:@selector(submitAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _sureButton;
}


-(void)submitAction
{
    
    if (!self.textView.text.length) {
        
        [MBProgressHUD showError:@"你还没填写任何东西哦!"];
        return;
    }
    
    if (self.textView.text.length<6) {
        
        [MBProgressHUD showError:@"不能少于6个字哦!"];
        return;
        
    }
    
    kshowMessage(@"提交中...");
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    params[@"username"] = [UserTool user].username;
    params[@"content"] = self.textView.text;
    
    [HttpTool postWithURL:FeedbackParty params:params success:^(id json) {
        
      
        
        if (jsonMsg(json)) {
            
            [self.navigationController popViewControllerAnimated:YES];
        }
        kHideHUDAll;
        
    } failure:^(NSError *error) {
        netWorkError;
        kHideHUDAll;
    }];
}

@end
