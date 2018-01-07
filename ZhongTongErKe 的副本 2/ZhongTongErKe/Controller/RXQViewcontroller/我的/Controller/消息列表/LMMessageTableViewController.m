#import "LMMessageTableViewController.h"
#import "LMMessageCell.h"
#import "LMMEssage.h"
//#import "IWAccountTool.h"
//#import "LMDate.h"
@interface LMMessageTableViewController ()
{
    int  pageNum;
    
    int  pageingDate;
}
@property(nonatomic,strong)NSMutableArray *messageArray;

@property(nonatomic,assign)int rollCount;
@end

@implementation LMMessageTableViewController


-(NSMutableArray *)messageArray
{
    if (!_messageArray) {
        _messageArray=[NSMutableArray new];
    }
    return _messageArray;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"消息列表";
    
//    //上拉加载最近数据
//    [self.tableView addHeaderWithTarget:self action:@selector(headerRereshing)];
//    //下拉加载更多数据
//    [self.tableView addFooterWithTarget:self action:@selector(footerRereshing)];
//    
    //获取消息列表
    [self getAllMessage];
}

-(void)getAllMessage
{
    [self.messageArray addObjectsFromArray:[LMMEssage getAllMessage]];
    
    [self.tableView reloadData];
    
//    
//    NSString *serverURL=[NSString stringWithFormat:@"%@/api/oauth/get/message/list",Service_url];
//    //  @"http://apit.zeenc.com/api/oauth/get/message/list";
//    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
//    
//    //取出token
//    [manager.requestSerializer setValue: [IWAccountTool account].token forHTTPHeaderField:@"token"];
//    
//    NSMutableDictionary *params=[NSMutableDictionary dictionary];
//    
//    params[@"pageNum"]=[NSString stringWithFormat:@"%d",pageNum];
//    
//    //@(pageNum);
//    params[@"pagingDate"]=[NSString stringWithFormat:@"%d",pageingDate];
//    [manager setResponseSerializer:[AFHTTPResponseSerializer serializer]];
//    [manager POST:serverURL parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
//        NSLog(@"%@",dic);
//        NSString *code=[NSString stringWithFormat:@"%d",[dic[@"code"]intValue]];
//        if ([code isEqualToString:@"200"]) {
//            
//            NSLog(@"%@",dic);
//            
//            NSDictionary *data=dic[@"data"];
//            NSArray  * listArray=data[@"list"];
//            NSMutableArray *messageArray=[NSMutableArray new];
//            for (NSDictionary *infoDic in listArray) {
//                LMMEssage *message=[LMMEssage messageWithJSON:infoDic];
//                [messageArray addObject:message];
//                
//            }
//            [self.messageArray addObjectsFromArray:messageArray];
//            [self.tableView reloadData];
//            NSNumber *myRollCount =dic[@"data"][@"rollCount"];
//            _rollCount=[myRollCount intValue];
//            pageNum=_rollCount;
//            
//            pageingDate=[dic[@"data"][@"pagingDate"]intValue];
//            
//            
//            [self.tableView headerEndRefreshing];
//            [self.tableView footerEndRefreshing];
//        }
//        
//        
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        [self.tableView headerEndRefreshing];
//        [self.tableView footerEndRefreshing];
//        
//        NSLog(@"%@",error);
//    }];
//    
}
//下拉刷新
//-(void)headerRereshing
//{
//    pageNum=0;
//    [self.messageArray removeAllObjects];
//    [self.tableView reloadData];
//    [self getAllMessage];
//}


//上拉加载更多
//-(void)footerRereshing
//{
//    pageNum++;
//    [self getAllMessage];
//    if (pageNum >= self.rollCount) {//超出总数不让再刷新
//        self.tableView.footerPullToRefreshText = @"没有更多的数据";
//        self.tableView.footerRefreshingText = @"没有更多的数据";
//        self.tableView.footerReleaseToRefreshText = @"没有更多的数据";
//        [self.tableView footerEndRefreshing];
//        return;
//    }
//
//    
//}
-(void)ActionBack
{
    [self.navigationController popViewControllerAnimated:YES];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return self.messageArray.count;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
    LMMessageCell *cell=[LMMessageCell cellWithTableView:tableView];
    
    LMMEssage *msg=self.messageArray[indexPath.row];
    
    cell.message=msg;
    

//    if (msg.readflag) {
//        
//        cell.messageView.backgroundColor=c230230230;
//        cell.userInteractionEnabled=NO;
//    }
//    
    return cell;

}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    LMMessageCell *cell =  (LMMessageCell *)[self tableView:tableView cellForRowAtIndexPath:indexPath];
    return cell.bounds.size.height+20;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    LMMessageCell *cell=[tableView cellForRowAtIndexPath:indexPath];
//    
//    
//    cell.messageView.backgroundColor=c230230230;
//    
//    [self getReadmessage:indexPath.row];
}
-(void)getReadmessage:(NSInteger)index;
{
//    NSString *serverURL=[NSString stringWithFormat:@"%@/api/oauth/read/message",Service_url];
//    // @"http://apit.zeenc.com/api/oauth/read/message";
//    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
//    
//    //取出token
//    [manager.requestSerializer setValue: [IWAccountTool account].token forHTTPHeaderField:@"token"];
//    
//    NSMutableDictionary *params=[NSMutableDictionary dictionary];
//    
//    LMMEssage *message=self.messageArray[index];
//    
//    params[@"mid"]=message.mid;
//    
//    [manager setResponseSerializer:[AFHTTPResponseSerializer serializer]];
//    [manager POST:serverURL parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
//        NSString *code=[NSString stringWithFormat:@"%d",[dic[@"code"]intValue]];
//        if ([code isEqualToString:@"200"]) {
//            
//            [UIView animateWithDuration:1.0 animations:^{
//                [MBProgressHUD showMessage:@"消息已读"];
//                
//            } completion:^(BOOL finished) {
//                [MBProgressHUD hideHUD];
//                
//                message.readflag=YES;
//                
//                [self.tableView reloadData];
//                
//            }];
//            
//        }
//        
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        
//        
//        NSLog(@"%@",error);
//    }];
//    
}
@end
