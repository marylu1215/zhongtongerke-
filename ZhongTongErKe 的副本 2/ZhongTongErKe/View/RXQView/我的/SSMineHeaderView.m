//
//  SSMineHeaderView.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/24.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSMineHeaderView.h"
#import "UserTool.h"

@interface SSMineHeaderView ()

@property (nonatomic,strong)UIView *line;
@property (nonatomic,strong)UIView *separator;
@property (nonatomic,strong)UIView *verticalLine1;
@property (nonatomic,strong)UIView *vertivalLine2;
@property (nonatomic,strong) UIImageView *bgImageView;
//1@property (nonatomic,strong) UIButton *headButton;
@property(nonatomic,strong)UIImageView *headimageView;

@property (nonatomic,strong) SSMineHeaderButtonOne *accountButton;
@property (nonatomic,strong) SSMineHeaderButtonOne *scoreButton;
@property (nonatomic,strong) UILabel *nameLabel;
@property (nonatomic,strong) SSMineHerderButtonTwo *myQuestButton;
@property (nonatomic,strong) SSMineHerderButtonTwo *myServiceButton;
@property (nonatomic,strong) SSMineHerderButtonTwo *myTaskButton;

@end

@implementation SSMineHeaderView


- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubviews];
        [self makeConstaits];
    }
    return self;
}


- (void)addSubviews{
    [self addSubview:self.bgImageView];
    //2
    //[self addSubview:self.headButton];
    [self addSubview:self.headimageView];
    [self addSubview:self.accountButton];
    [self addSubview:self.scoreButton];
    [self addSubview:self.nameLabel];
    [self addSubview:self.myQuestButton];
    [self addSubview:self.myServiceButton];
    [self addSubview:self.myTaskButton];
    [self addSubview:self.line];
    [self addSubview:self.verticalLine1];
    [self addSubview:self.vertivalLine2];
    [self addSubview:self.separator];
}
- (void)makeConstaits{
    [self.bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(kScreenWidth, 320*kScreenHeightScale));
        make.left.mas_equalTo(0*kScreenWidthScale);
    }];
//    [self.headButton mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(69*kScreenHeightScale);
//        make.size.mas_equalTo(CGSizeMake(113*kScreenWidthScale, 113*kScreenHeightScale));
//        make.left.mas_equalTo(131*kScreenWidthScale);
//  3  }];
    
    [self.headimageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(69*kScreenHeightScale);
                make.size.mas_equalTo(CGSizeMake(113*kScreenWidthScale, 113*kScreenHeightScale));
                make.left.mas_equalTo(131*kScreenWidthScale);
    }];
    [self.accountButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(111*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(25*kScreenWidthScale, 39*kScreenHeightScale));
        make.left.mas_equalTo(74*kScreenWidthScale);
    }];
    [self.scoreButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(111*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(25*kScreenWidthScale, 39*kScreenHeightScale));
        make.left.mas_equalTo(278*kScreenWidthScale);
    }];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(186*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(kScreenWidth, 14*kScreenHeightScale));
        make.left.mas_equalTo(0*kScreenWidthScale);
    }];
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(295*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(kScreenWidth, 1*kScreenHeightScale));
        make.left.mas_equalTo(0*kScreenWidthScale);
    }];
    [self.myQuestButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(302*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(67*kScreenWidthScale, 40*kScreenHeightScale));
        make.left.mas_equalTo(29*kScreenWidthScale);
    }];
    [self.myServiceButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(302*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(67*kScreenWidthScale, 40*kScreenHeightScale));
        make.left.mas_equalTo(154*kScreenWidthScale);
    }];
    [self.myTaskButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(302*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(67*kScreenWidthScale, 40*kScreenHeightScale));
        make.left.mas_equalTo(270*kScreenWidthScale);
    }];
    [self.verticalLine1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(302*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(1*kScreenWidthScale, 35*kScreenHeightScale));
        make.left.mas_equalTo(125*kScreenWidthScale);
    }];
    [self.vertivalLine2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(302*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(1*kScreenWidthScale, 35*kScreenHeightScale));
        make.left.mas_equalTo(250*kScreenWidthScale);
    }];
    [self.separator mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(346*kScreenHeightScale);
        make.size.mas_equalTo(CGSizeMake(kScreenWidth, 7*kScreenHeightScale));
        make.left.mas_equalTo(0*kScreenWidthScale);
    }];
}



- (UIImageView *)bgImageView{
    if (!_bgImageView) {
        _bgImageView = [[UIImageView alloc]init];
         _bgImageView.image = [UIImage imageNamed:@"banner-mine"];
    }
    return _bgImageView;
}
//- (UIButton *)headButton{
//    if (!_headButton) {
//        _headButton = [[UIButton alloc]init];
//        [_headButton addTarget:self action:@selector(clickAction) forControlEvents:UIControlEventTouchUpInside];
//        _headButton.layer.cornerRadius = 113*kScreenWidthScale/2;
//        _headButton.clipsToBounds = YES;
//        
//    }
//    return _headButton;
//}

-(UIImageView *)headimageView{
    
    if (!_headimageView) {
        _headimageView = [[UIImageView alloc]init];
       _headimageView.layer.cornerRadius = 113*kScreenWidthScale/2;
        _headimageView.clipsToBounds = YES;
    }
    return _headimageView;
}
- (SSMineHeaderButtonOne *)accountButton{
    if (!_accountButton) {
        _accountButton = [[SSMineHeaderButtonOne alloc]init];
        _accountButton.headImageView.image = [UIImage imageNamed:@"account-icon"];
        _accountButton.headLabel.text = @"账户";
        _accountButton.tag = 0;
        [_accountButton addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _accountButton;
}
- (SSMineHeaderButtonOne *)scoreButton{
    if (!_scoreButton) {
        _scoreButton = [[SSMineHeaderButtonOne alloc]init];
        _scoreButton.headImageView.image = [UIImage imageNamed:@"integral"];
        _scoreButton.headLabel.text = @"积分";
        _scoreButton.tag = 1;
        [_scoreButton addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _scoreButton;
}
- (UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc]init];
        _nameLabel.font = [UIFont systemFontOfSize:14*kScreenHeightScale];
        _nameLabel.textColor = [UIColor whiteColor];
        _nameLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _nameLabel;
}
- (UIView *)line{
    if (!_line) {
        _line = [[UIView alloc]init];
        _line.backgroundColor = BACKGROUND_COLOR;
    }
    return _line;
}
- (SSMineHerderButtonTwo *)myQuestButton{
    if (!_myQuestButton) {
        _myQuestButton = [[SSMineHerderButtonTwo alloc]init];
       _myQuestButton.headImageView.image = [UIImage imageNamed:@"ask-icon"];
        _myQuestButton.headLabel.text = @"我的问答";
        _myQuestButton.tag = 2;
        [ _myQuestButton addTarget:self action:@selector(actionClick:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _myQuestButton;
}
- (SSMineHerderButtonTwo *)myServiceButton{
    if (!_myServiceButton) {
        _myServiceButton = [[SSMineHerderButtonTwo alloc]init];
        _myServiceButton.headImageView.image = [UIImage imageNamed:@"serve"];
        _myServiceButton.headLabel.text = @"我的服务";
       _myServiceButton.tag = 3;
        [ _myServiceButton addTarget:self action:@selector(actionClick:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _myServiceButton;
}
- (SSMineHerderButtonTwo *)myTaskButton{
    if (!_myTaskButton) {
        _myTaskButton = [[SSMineHerderButtonTwo alloc]init];
        _myTaskButton.headImageView.image = [UIImage imageNamed:@"assignment"];
       _myTaskButton.headLabel.text = @"我的课程";
        _myTaskButton.tag = 4;
        [  _myTaskButton addTarget:self action:@selector(actionClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _myTaskButton;
}
- (UIView *)verticalLine1{
    if (!_verticalLine1) {
        _verticalLine1 = [[UIView alloc]init];
        _verticalLine1.backgroundColor = BACKGROUND_COLOR;
    }
    return _verticalLine1;
}
- (UIView *)vertivalLine2{
    if (!_vertivalLine2) {
        _vertivalLine2 = [[UIView alloc]init];
        _vertivalLine2.backgroundColor = BACKGROUND_COLOR;
    }
    return _vertivalLine2;
}
- (UIView *)separator{
    if (!_separator) {
        _separator = [[UIView alloc]init];
        _separator.backgroundColor = BACKGROUND_COLOR;
    }
    return _separator;
}



-(void)setUser:(User *)user
{
    
    _user = user;
    
//    [_headButton sd_setImageWithURL:[NSURL URLWithString:  [user.head  containsString:@"http"]? user.head:[NSString stringWithFormat:@"%@%@",ImageBaseURL,user.head]] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:wdPicImageName]];
    
    
    NSLog(@"*********输出user.head的值******************:%@",user.head);
    
    NSLog(@"输出imageview的frame:%f",_headimageView.frame.size.width);
    
     NSLog(@"输出imageview的frame:%f",_headimageView.frame.size.height);
//    [_headButton sd_setImageWithURL:[NSURL URLWithString:@"http://yf.xnetyy.com/Uploads/user_head/2017-09-22 9836.jpg"] forState:UIControlStateNormal];
//    [_headButton sd_setImageWithURL:[NSURL URLWithString:@"http://yf.xnetyy.com/Uploads/user_head/2017-09-22 9836.jpg"] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"wd-pic"]];
   // NSString *urlstring = @"http://yf.xnetyy.com/Uploads/user_head/2017-09-22 9815.jpg";
    
    NSUserDefaults *usertwo = [NSUserDefaults standardUserDefaults];
//    [usertwo setObject:str forKey:@"headstr"];
//    [usertwo synchronize];
    NSString *str = [usertwo objectForKey:@"headstr"];
    
    
    //NSString *onestr = @"http://yf.xnetyy.com";
    NSString *twostr = str;
    
    
    NSString *strtwo = [NSString stringWithFormat:@"%@%@",ImageBaseURL,twostr];
    
     strtwo = [strtwo stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet characterSetWithCharactersInString:@" "].invertedSet];
    
    NSLog(@"输出strtwo:%@",strtwo);
    
    [_headimageView sd_setImageWithURL:[NSURL URLWithString:strtwo] placeholderImage:[UIImage imageNamed:wdPicImageName]];
    self.nameLabel.text = _user.userid.length? (_user.username.length?_user.username:_user.mobile):@"未登录";
    
}

-(void)clickAction
{
    
    
    if (self.headClickBlock) {
        
        self.headClickBlock();
    }
}
-(void)actionClick:(SSMineHerderButtonTwo *)button
{
    if (self.actionclickBlock) {
        self.actionclickBlock(button);
    }
}

-(void)click:(SSMineHeaderButtonOne*)button
{
    if (self.clickBlock) {
        self.clickBlock(button);
    }
}
@end
