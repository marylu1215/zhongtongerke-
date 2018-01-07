//
//  PostDetailViewController.m
//  ZhongTongErKe
//
//  Created by khj on 2017/6/6.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "PostDetailViewController.h"
#import "Invitation.h"
#import "PostDetailTableCell.h"
#import "PostDetailHeaderView.h"
#import "PostForumView.h"
#import "DetailsSectionView.h"
#import "Forum.h"
#import "UserTool.h"


@interface PostDetailViewController ()<UITableViewDelegate,UITableViewDataSource,UIWebViewDelegate>

@property (nonatomic ,strong) UITableView *tableView;
@property (nonatomic ,strong) PostForumView *postForumView;
@property (nonatomic, assign) NSInteger pageNum;
@property (nonatomic, strong) NSMutableDictionary *params;

@property (nonatomic ,strong)  UIWebView *webView;

@property (nonatomic ,strong) DetailsSectionView *detailView;
//**全部 */
@property (nonatomic ,strong) NSMutableArray *totalMuArr;
//** 一级评论 */
@property (nonatomic ,strong) NSMutableArray *commentMuArr;
//** 回复 */
@property (nonatomic ,strong) NSMutableArray *totalReplyMuArr;
//** 分区回复 */
@property (nonatomic ,strong) NSMutableArray *divReplyMuArr;

@property (nonatomic ,strong) Invitation *invitation;

@end

@implementation PostDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"帖子详情";
    
    [self.view addSubview:self.tableView];
    
    [self setTableHeaderView];
    [self setBottomView];
   
    [self setUpRefresh];

}

- (void)setUpRefresh
{
  
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadTzxqForum)];
   
    // 自动改变透明度
    self.tableView.mj_header.automaticallyChangeAlpha = YES;
    // 开始刷新
    [self.tableView.mj_header beginRefreshing];

    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreTzxqForum)];
    self.tableView.mj_footer.automaticallyChangeAlpha = YES;
}

-(void)setTableHeaderView
{
    
    _webView = [[UIWebView alloc] init];
    _webView.scrollView.bounces = NO;
    _webView.scrollView.showsHorizontalScrollIndicator = NO;
    _webView.backgroundColor = [UIColor redColor];
    _webView.scrollView.scrollEnabled = NO;
    [_webView sizeToFit];
    _webView.delegate = self;

    self.detailView = [[DetailsSectionView alloc]init];
    [_webView.scrollView addSubview:self.detailView];
    self.detailView.sd_layout.widthIs(kScreenWidth).heightIs(px(108)).topSpaceToView(_webView.scrollView,-px(108));
    
    [self.tableView setTableHeaderView:_webView];  //重设TableHeaderView
 
}


-(void)setBottomView
{
    
    self.postForumView = [[PostForumView alloc]init];
    
    __weak typeof (self) weakSelf = self;
    self.postForumView.sendBlock = ^()
    {
       
        [weakSelf UserReplyPost];
       
    };

    [self.view addSubview:self.postForumView];
    self.postForumView.sd_layout.widthIs(kScreenWidth).heightIs(px(108)).bottomSpaceToView(self.view ,0);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Table view data source

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.commentMuArr.count;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   
    Invitation *comInvitation = self.commentMuArr[section];
     NSDictionary *dic = self.divReplyMuArr[section];
        
    NSArray *replyArr = dic[comInvitation.cid];
    
    if (replyArr.count<=3) {
        return replyArr.count;
    }
    else if (comInvitation.seeMore)
    {
        return replyArr.count;
    }
    else
    {
        return 3;
    }

    
  
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    PostDetailTableCell  *cell =  (PostDetailTableCell *)[self tableView:tableView cellForRowAtIndexPath:indexPath];
    return cell.bounds.size.height;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return px(136);
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
 
    Invitation *comInvitation = self.commentMuArr[section];

    NSDictionary *dic = self.divReplyMuArr[section];
    
    NSArray *replyArr = dic[comInvitation.cid];
    
    if (replyArr.count>3) {
        
        return px(100);
    }
    else
    {
        return CGFLOAT_MIN;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    PostDetailHeaderView *headerView = [[PostDetailHeaderView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, px(136))];
    headerView.replyButton.tag = section;
     headerView.praiseButton.tag = section;
    __weak typeof (self) weakSelf = self;
    
    //回复
    headerView.repBlock = ^(UIButton *btn)
    {
        [weakSelf.postForumView.repTextField becomeFirstResponder];
        
       self.invitation = weakSelf.commentMuArr[btn.tag];
        
    };
    //点赞
    headerView.priseBlock = ^(UIButton *btn)
    {
       
        Invitation *invitation = weakSelf.commentMuArr[btn.tag];
        [self pushPraiseActionWith:invitation];
        
    };
    
    headerView.invitation = self.commentMuArr[section];
    
    return headerView;
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
    
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    Invitation *comInvitation = self.commentMuArr[section];
    NSDictionary *dic = self.divReplyMuArr[section];
     NSArray *replyArr = dic[comInvitation.cid];
    
    if (replyArr.count>3) {
        
        UIButton *moreBtn = [UIButton addBtnWithTitle:@"查看更多" WithBGImg:nil WithFont:Font13 WithTitleColor:cGrayWord Target:self Action:@selector(moreAction:)];
        moreBtn.sd_layout.widthIs(kScreenWidth).heightIs(px(100));
        moreBtn.tag = section;
        return moreBtn;
    }
    else
    {
        return nil;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
   PostDetailTableCell  *detailCell = [PostDetailTableCell cellWithTableView:tableView];
    Invitation *comInvitation = self.commentMuArr[indexPath.section];
    NSDictionary *dic = self.divReplyMuArr[indexPath.section];
    
    NSArray *replyArr = dic[comInvitation.cid];
    
    Invitation *replyInvitation  = replyArr[indexPath.row];
    detailCell.invitation = replyInvitation;
    
    return detailCell;
}


-(void)moreAction:(UIButton *)btn
{
    Invitation *comInvitation = self.commentMuArr[btn.tag];
   comInvitation.seeMore = YES;
    [self.tableView reloadData];
}

-(void)loadTzxqForum
{
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    self.pageNum = 1;
    params[@"id"] = self.forum.cid;
    self.params = params;
    params[@"p"] = @(self.pageNum);
    self.params = params;
    
    [MBProgressHUD showMessage:@"数据加载中..."];
    
    [HttpTool postWithURL:gettzxqForum params:params success:^(id json) {
        
        ICLog(@"json menu:%@",json);
        
        
        if (self.params != params) return;
        
        if (jsonMsg(json)) {
            
            
            self.postForumView.forum =  self.detailView.forum = [Forum mj_objectWithKeyValues:json[@"tzxq"]];
            
            if ( [json[@"tzxq"] isKindOfClass:[NSDictionary class]]) {
                
                [self.webView loadHTMLString:json[@"tzxq"][@"content"] baseURL:nil];
            }
            
            // 转模型
            [self.totalMuArr removeAllObjects];
            NSArray *tempArr = [Invitation mj_objectArrayWithKeyValuesArray:json[@"data"]];
            [self.totalMuArr addObjectsFromArray:tempArr];
            //**区分评论还是回复 */
            [self divCommentArrAndReplyArr:self.totalMuArr];
            
        }
        else
        {
            [MBProgressHUD showError:json[@"msg"]];
            
        }
        // 结束刷新
        [self.tableView.mj_header endRefreshing];
        kHideHUDAll;
    } failure:^(NSError *error) {
        if (self.params != params) return;
        
        [self.tableView.mj_header endRefreshing];
        netWorkError;
        kHideHUDAll;
    }];
    
}


- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    
    //HTML5的高度
    NSString *htmlHeight = [webView stringByEvaluatingJavaScriptFromString:@"document.body.scrollHeight"];
    //HTML5的宽度
    NSString *htmlWidth = [webView stringByEvaluatingJavaScriptFromString:@"document.body.scrollWidth"];
    //宽高比
    float i = [htmlWidth floatValue]/[htmlHeight floatValue];
    
    //webview控件的最终高度
    float height = kScreenWidth/i;
    
    _webView.scrollView.contentInset = UIEdgeInsetsMake(px(108), 0, 0, 0);
    self.webView.frame = CGRectMake(0, 0, kScreenWidth, height+px(108));
    //    //再次设置WebView高度（点）
    self.tableView.tableHeaderView = self.webView;
    
}

- (void)loadMoreTzxqForum
{
    
    [self.tableView.mj_header endRefreshing];
    NSInteger page = self.pageNum + 1;
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    params[@"p"] = @(page);
    self.params = params;
    
    [HttpTool postWithURL:getHotScience params:params success:^(id json) {
        ICLog(@"json menu:%@",json);
        if (self.params != params) return;
        
        if (jsonMsg(json)) {
            
            
            // 转模型
            NSArray *tempArr = [Invitation mj_objectArrayWithKeyValuesArray:json[@"data"]];
            [self.totalMuArr addObjectsFromArray:tempArr];
            
            [self divCommentArrAndReplyArr:self.totalMuArr];
            
            self.pageNum = page;
            
            // 监测footer状态
            [self checkFooterStatus];
            // 结束刷新
            [self.tableView.mj_footer endRefreshing];
            
        }
        
        else
        {
            [self.tableView.mj_footer endRefreshingWithNoMoreData];
        }
        
        kHideHUDAll;
    } failure:^(NSError *error) {
        if (self.params != params) return;
        
        // 结束刷新
        [self.tableView.mj_footer endRefreshing];
        netWorkError;
        kHideHUDAll;
    }];
    
    
}

- (void)checkFooterStatus
{
    
    if (self.totalMuArr.count <= 0) {
        self.tableView.mj_footer.hidden = YES;
    }
    
    
}

//点赞
-(void)pushPraiseActionWith:(Invitation *)invitation
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    //** 被点赞评论的ID
    params[@"plid"] = invitation.cid;

    [MBProgressHUD showMessage:@"点赞中..."];
    
    [HttpTool postWithURL:sendYhdzForum params:params success:^(id json) {
        
        ICLog(@"json menu:%@",json);
        
        if (jsonCode(json)) {
            
            [MBProgressHUD showSuccess:@"点赞成功"];
            
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
//**评论
-(void)UserReplyPost
{
    
    
    //** 用户回复帖子 */
    if (!self.postForumView.repTextField.text.length) {
        
        [MBProgressHUD showError:@"请输入内容!"];
    }
    
    else
    {
        NSMutableDictionary *params = [NSMutableDictionary dictionary];
        //** 帖子ID
        params[@"wzid"] = self.forum.cid;
        //评论人的ID
        params[@"plid"] = [UserTool user].userid;
        //评论人的用户名
        params[@"username"] =[UserTool user].username;
        //上级ID 默认为0
        params[@"sjid"] = self.invitation.cid.length?self.invitation.cid:@"0";
        
        params[@"content"] = self.postForumView.repTextField.text;
        
        [MBProgressHUD showMessage:@"数据提交中..."];
        
        [HttpTool postWithURL:setUserForum params:params success:^(id json) {
            
            ICLog(@"json menu:%@",json);
            
            if (jsonCode(json)) {
                
                // 马上进入刷新状态
                [self.tableView.mj_header beginRefreshing];
                self.postForumView.repTextField.text = @"";
                self.invitation = nil;
                [self.tableView reloadData];
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
    
    
}

-(void)divCommentArrAndReplyArr:(NSArray *)totalArr
{
    
    [self.commentMuArr removeAllObjects];
    [self.totalReplyMuArr removeAllObjects];
    [self.divReplyMuArr removeAllObjects];
    
    
    for (Invitation *invitation  in totalArr) {
        
        
      
        
        if ([invitation.parent_id  isEqualToString:@"0"]) {
            //**评论数组*/
            [self.commentMuArr addObject:invitation];
        }
        
        else
        {
            //**回复数组 */
            [self.totalReplyMuArr addObject:invitation];
        }
        
        
    }
    
    
    //** 创建分区数量的回复数组 */
    for (int index=0; index<self.commentMuArr.count; index++) {
        
        Invitation *invitation = self.commentMuArr[index];
        
        NSDictionary *dic = @{invitation.cid:[NSMutableArray new]};
        
        [self.divReplyMuArr addObject:dic];
        
        
    }
    
    
    if (self.totalReplyMuArr.count) {
        
        for (int index=0; index<self.totalReplyMuArr.count; index++) {
            
            Invitation *repInvitation = self.totalReplyMuArr[index];
            
            for (int jndex=0; jndex<self.commentMuArr.count; jndex++) {
                
                Invitation *comInvitation = self.commentMuArr[jndex];
                
                if ([repInvitation.parent_id isEqualToString: comInvitation.cid]) {
                    
                    NSDictionary *comDic = self.divReplyMuArr[jndex];
                    NSMutableArray *divMuArr = comDic[comInvitation.cid];
                    
                    [divMuArr addObject:repInvitation];
                    
                }
            }
        }
        
    }
    
    
    [self.tableView reloadData];
}


- (UITableView *)tableView{
    if (_tableView) return _tableView;
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth , kScreenHeight-NavBar_Height-TabBar_Height) style:UITableViewStyleGrouped];

    _tableView.backgroundColor = [UIColor colorWithHexString:@"ffffff"];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    return _tableView;
}

-(NSMutableArray *)totalMuArr
{
    if (!_totalMuArr) {
        
        _totalMuArr = [NSMutableArray new];
        
    }
    return _totalMuArr;
}

-(NSMutableArray *)commentMuArr
{
    if (!_commentMuArr) {
        
        _commentMuArr = [NSMutableArray new];
    }
    return _commentMuArr;
}

-(NSMutableArray *)totalReplyMuArr
{
    if (!_totalReplyMuArr) {
        
        _totalReplyMuArr = [NSMutableArray new];
    }
    return _totalReplyMuArr;
}

-(NSMutableArray *)divReplyMuArr
{
    if (!_divReplyMuArr) {
        
        _divReplyMuArr = [NSMutableArray new];
    }
    return _divReplyMuArr;
}
@end
