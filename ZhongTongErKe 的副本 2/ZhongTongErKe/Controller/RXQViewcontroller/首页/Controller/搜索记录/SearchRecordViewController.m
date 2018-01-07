//
//  SearchRecordViewController.m
//  ZhongTongErKe
//
//  Created by khj on 2017/6/2.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SearchRecordViewController.h"
#import "SearchRecordView.h"
#import "LMMessageBtn.h"
#import "ArDetailViewController.h"
#import "searchView.h"

@interface SearchRecordViewController ()

@property (nonatomic,strong) searchView *searchView;

@property (nonatomic,strong) SearchRecordView *recordView;

@property (nonatomic ,strong) NSMutableArray *keyWordsMutableArray;

@end

@implementation SearchRecordViewController

-(NSMutableArray *)keyWordsMutableArray
{
    if (!_keyWordsMutableArray) {
        
        _keyWordsMutableArray = [NSMutableArray new];
    }
    return _keyWordsMutableArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self setNaviBar];
    
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    self.recordView = [[SearchRecordView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) searchRecordArray:[ud objectForKey:@"keyWords"]AndhotReArray:@[@"过敏",@"青春痘",@"皮肤科",@"咳嗽",@"失眠",@"失眠"]];

     __weak typeof(self)weakSelf = self;
    //**点击热门话题 */
    
    self.recordView.backHotBlock = ^(NSString *title)
    {
        [weakSelf changeTitleWithTitle:title];
    };
    
    //**点击搜索历史 */
    self.recordView.backReBlock = ^(NSString *title)
    {
         [weakSelf changeTitleWithTitle:title];
    };
    
    [self.view addSubview: self.recordView];
}

#pragma mark TODO 改变搜索框文字 隐藏视图 开始搜索
-(void)changeTitleWithTitle:(NSString *)title
{
    __weak typeof(self)weakSelf = self;
    weakSelf.searchView.searchBar.searchTF.text = title;
    
    [weakSelf.recordView removeFromSuperview];
       //**开始搜索 */
    [self.navigationController pushViewController:[ArDetailViewController new] animated:YES];
}

-(void)setNaviBar
{
    LMMessageBtn *button = [[LMMessageBtn alloc] init];
    [button addTarget:self action:@selector(msgAction) forControlEvents:UIControlEventTouchUpInside];
    
    [button showRedPoint];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:button];
    
    _searchView = [[searchView alloc]initWithSearchBarEditDidChange:^(NSString *text) {
        
        
    } SearchBegin:^(NSString *kWords, BOOL isSeletedPopTable, NSUInteger index) {
        //** 添加关键字 隐藏记录 */
        if (self.keyWordsMutableArray.count) {
            for (kWords in self.keyWordsMutableArray) {
                return ;
            }
        }
        
        [self.keyWordsMutableArray addObject:kWords];
        
        [self.recordView removeFromSuperview];
        
        NSUserDefaults * ud = [NSUserDefaults standardUserDefaults];
        [ud setObject:self.keyWordsMutableArray forKey:@"keyWords"];
        [ud synchronize];
        
    }];
    _searchView.sd_layout.heightIs(px(52)).widthIs(200);
    _searchView.layer.cornerRadius = 10;
    self.navigationItem.titleView = _searchView;
    _searchView.placeholder = @"大家都在搜: 育儿";
    _searchView.limitMaxStrLength = 20;
}

-(void)msgAction
{
    
}


@end
