//
//  SearchRecordView.m
//  ZhongTongErKe
//
//  Created by khj on 2017/6/2.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SearchRecordView.h"
#import "ResultTableViewCell.h"
#import "HotReTableCell.h"
#import "SearchTitleView.h"

@interface SearchRecordView ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic ,strong) UITableView *searchRecordTableView;

@property (nonatomic ,strong) NSArray *leftTitleArr;

@property (nonatomic ,strong) NSArray *rightTitleArr;

@property (nonatomic ,strong) NSMutableArray *searchRecordArray;

@end

@implementation SearchRecordView

-(NSMutableArray *)searchRecordArray
{
    if (!_searchRecordArray) {
        
        _searchRecordArray = [NSMutableArray new];
    }
    return _searchRecordArray;
}

-(id)initWithFrame:(CGRect)frame searchRecordArray:(NSArray *)searchRecordArray  AndhotReArray:(NSArray *)hotReArray
{
    if (self = [super initWithFrame:frame]) {
        
        [self addSubview:self.searchRecordTableView];
        self.searchRecordTableView.sd_layout.topSpaceToView(self,0).bottomSpaceToView(self,0).widthIs(kScreenWidth);
        
        self.hotReArray = hotReArray;
        [self.searchRecordArray addObjectsFromArray:searchRecordArray];
        self.leftTitleArr = @[@"搜索历史",@"热门推荐"];
        self.rightTitleArr = @[@"清除历史",@""];
        
        [self.searchRecordTableView reloadData];
    }
    
    return self;
}


#pragma mark - UITableViewDataSource代理
-(NSInteger )numberOfSectionsInTableView:(UITableView *)tableView
{
    if (self.searchRecordArray.count==0) {
        return 1;
    }
    else
    {
        return 2;
    }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.searchRecordArray.count==0) {
        return 1;
    }
    
    else
    {
        if (section==0) {
            return self.searchRecordArray.count;
        }
        else
        {
            return 1;
        }
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    if (self.searchRecordArray.count==0) {
        
       HotReTableCell *cell = [HotReTableCell cellWithTableView:tableView];
        
        cell.hotReNSArray = self.hotReArray;
        
        cell.btnClickBlock = ^ (UIButton *btn)
        {
            
                if (self.backHotBlock) {
                    self.backHotBlock(btn.currentTitle);
                }
                
        };
        
        return cell;
    }
    
    else
    {
        if (indexPath.section ==0) {
           
            ResultTableViewCell *cell = [ResultTableViewCell cellWithTableView:tableView];
            cell.titleStr = self.searchRecordArray[indexPath.row];
            
            cell.deleteBlock = ^()
            {
                [self.searchRecordArray removeObjectAtIndex:indexPath.row];
                NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
                [ud setObject:self.searchRecordArray forKey:@"keyWords"];
                [ud synchronize];
                [self.searchRecordTableView reloadData];
            };
            return cell;
        }
        else
        {
            HotReTableCell *cell = [HotReTableCell cellWithTableView:tableView];
            
            cell.hotReNSArray = self.hotReArray;
            
            cell.btnClickBlock = ^ (UIButton *btn)
            {
                
                if (self.backHotBlock) {
                    self.backHotBlock(btn.currentTitle);
                }
                
            };
            
            return cell;
        }
    }
   
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.searchRecordArray.count) {
        
        if (self.backReBlock) {
            
            self.backReBlock(self.searchRecordArray[indexPath.row]);
        }
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return px(80);
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    if (self.searchRecordArray.count==0) {
      SearchTitleView *headerView = [[SearchTitleView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, px(80)) leftTitle:@"热门推荐" rightTitle:@""];
          return headerView;
    }
    else
    {
        SearchTitleView *headerView = [[SearchTitleView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, px(80)) leftTitle:self.leftTitleArr[section] rightTitle:self.rightTitleArr[section]];
        
        return headerView;
    }
    
}


- (UITableView *)searchRecordTableView
{
    if (_searchRecordTableView == nil) {
        
        _searchRecordTableView = [[UITableView alloc] init];
        _searchRecordTableView.delegate = self;
        _searchRecordTableView.dataSource  = self;
        _searchRecordTableView.backgroundColor = c255255255;
        _searchRecordTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    
    return _searchRecordTableView;
}

@end
