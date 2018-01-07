//
//  SSWZJudgeSuccessController.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/17.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSWZJudgeSuccessController.h"
#import "UIBarButtonItem+Common.h"
#import "PurchaseTitleView.h"
#import "SSCouponViewController.h"
#import "PaymentModeCell.h"
#import "PayModel.h"
#import "PaymentTitleView.h"
#import "SSCompletePlanTableCell.h"
#import "SSVoiceQuestionController.h"
#import "UserTool.h"
#import "WXApi.h"
#import "PersonInfoController.h"
@interface SSWZJudgeSuccessController ()<UITableViewDelegate,UITableViewDataSource,PaymentModeCellDelegte>

@property (nonatomic ,strong) UITableView *tableView;

@property (assign, nonatomic) NSIndexPath *selectedIndexPath;

@property (nonatomic ,strong) NSArray *payModelArray;
@property (nonatomic ,assign) BOOL isSelect;
@end

@implementation SSWZJudgeSuccessController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.title = @"支付确认";
    
    [self.view addSubview:self.tableView];
    
    [self setHeadeView];
    
    [self setBottomView];
    
    //监听一个通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getOrderPayResult:) name:@"wx_pay" object:nil];
    

}
#pragma mark -支付结果回调
-(void)getOrderPayResult:(NSNotification *)notification
{
    if ([notification.object isEqualToString:@"success"])
    {
        if ([self.purchase.type isEqualToString:@"voice"])
        {
            
            SSVoiceQuestionController *vqVC =[SSVoiceQuestionController new];
            vqVC.doctor = self.doctor;
            
            [self.navigationController pushViewController:vqVC animated:YES];
            
        }
        
        else if ([self.purchase.type isEqualToString:@"activity"])
        {
            [self.navigationController popToRootViewControllerAnimated:YES];
            
        }
        else if ([self.purchase.type isEqualToString:@"gift"])
        {
            NSMutableDictionary *params = [NSMutableDictionary dictionary];
            params[@"id"] = self.purchase.cid;//评论ID
            params[@"doctorid"] = self.doctor.cid;
            params[@"service"] = @"gift";
            params[@"orderid"] = self.purchase.orderid;
            kshowMessage(@"打赏中...");
          
            [HttpTool postWithURL:getPartyGift params:params success:^(id json){
                
                ICLog(@"%@",json);
                
                 if (jsonCode(json)) {
                     
                     [MBProgressHUD showSuccess:@"打赏成功!"];
                     [self.navigationController popViewControllerAnimated:YES];
                     
                 }
                 kHideHUDAll;
             } failure:^(NSError *error) {
                 netWorkError;
                 kHideHUDAll;
             }];
 
        }
        
       else if ([self.purchase.type isEqualToString:@"tel"])
        {
            
            if ([UserTool user].mobile.length==0)
            {
                [self.navigationController pushViewController:[PersonInfoController new] animated:YES];
                
            }
            else
            {
                NSMutableDictionary *params = [NSMutableDictionary dictionary];
                params[@"userid"] = [UserTool user].userid;
                params[@"tel"] = [UserTool user].mobile;
                params[@"price"] = self.purchase.price;
                kshowMessage(@"数据提交中...");
                [HttpTool postWithURL:getPartytel params:params success:^(id json)
                 {
                     if (jsonCode(json)) {
                         
                         [MBProgressHUD showSuccess:@"提交成功!"];
                     }
                     kHideHUDAll;
                 } failure:^(NSError *error) {
                     netWorkError;
                     kHideHUDAll;
                 }];
                
            }

            }
            
    }
    
    else
    {
       
        [MBProgressHUD showError:@"支付失败"];
        
    }
}

- (void)viewWillAppear:(BOOL)animated{
  
    self.tabBarController.tabBar.hidden = YES;
}
- (void)viewWillDisappear:(BOOL)animated{
 
    self.tabBarController.tabBar.hidden = NO;
}

-(void)setHeadeView
{
    PurchaseTitleView *headerView = [[PurchaseTitleView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth,self.section?px(164):px(260)) section:self.section];
    headerView.purchase = self.purchase;
    __weak typeof (self) weakSelf = self;
    headerView.chooseBlock = ^()
    {
        [weakSelf.navigationController pushViewController:[SSCouponViewController new] animated:YES];
    };
    self.tableView.tableHeaderView = headerView;
}

-(void)setBottomView
{
    UIButton *bottomBtn = [UIButton addBtnWithTitle:@"确认支付" WithBGImg:nil WithFont:Font13 WithTitleColor:c255255255 Target:self Action:@selector(buyAction)];
    bottomBtn.backgroundColor = cHBColor;
    [self.view addSubview:bottomBtn];
    bottomBtn.sd_layout.widthIs(kScreenWidth).heightIs(px(100)).bottomSpaceToView(self.view ,0);
}

-(void)buyAction
{
    if (!self.isSelect) {
     
        [MBProgressHUD showError:@"请选择支付方式!"];
    }
    
    else
    {
        switch (self.selectedIndexPath.row) {
                case 0://支付宝
                
                break;
                
                case 1://微信
            {
                
    
                NSMutableDictionary *params = [NSMutableDictionary dictionary];
                params[@"userid"] = [UserTool user].userid;
                if ([self.purchase.type isEqualToString:@"activity"]) {
                     params[@"doctorid"] = @"0";
                     params[@"activityid"] = self.purchase.activityid;
                }
                else
                {
                     params[@"doctorid"] = self.doctor.cid;
                     params[@"activityid"] = @"0";
                }
               
                params[@"price"] = @"0.01";
                params[@"service"] = self.purchase.type;
                
                kshowMessage(@"数据加载中...");
                
                [HttpTool postWithURL:getWxpay params:params success:^(id json)
                 {
                     
                     ICLog(@"微信支付json%@",json);
                     
                     if (jsonCode(json))
                     {
                         [self payWithWeiXinJson:json];
                         
                     }
                     
                     kHideHUDAll;
                     
                 } failure:^(NSError *error) {
                     netWorkError;
                     kHideHUDAll;
                     
                 }];
             
                
            }
                
                break;
                
            default:
                break;
        }
        
    }
}
-(void)payWithWeiXinJson:(NSDictionary *)json
{
    //需要创建这个支付对象
    PayReq *req   = [[PayReq alloc] init];
    //由用户微信号和AppID组成的唯一标识，用于校验微信用户
    req.openID = json[@"x"][@"appid"];
    
    // 商家id，在注册的时候给的
    req.partnerId = json[@"x"][@"partnerid"];
    
    // 预支付订单这个是后台跟微信服务器交互后，微信服务器传给你们服务器的，你们服务器再传给你
    req.prepayId  = json[@"x"][@"prepayid"];
    
    // 根据财付通文档填写的数据和签名
    //这个比较特殊，是固定的，只能是即req.package = Sign=WXPay
    req.package   = json[@"x"][@"package"];
    
    // 随机编码，为了防止重复的，在后台生成
    req.nonceStr  = json[@"x"][@"noncestr"];
    
    // 这个是时间戳，也是在后台生成的，为了验证支付的
    NSString * stamp = json[@"x"][@"timestamp"];
    req.timeStamp = stamp.intValue;
    
    // 这个签名也是后台做的
    req.sign = json[@"x"][@"sign"];
    
    //发送请求到微信，等待微信返回onResp
    [WXApi sendReq:req];

}


-(void)loadData
{
     self.payModelArray = [PayModel mj_objectArrayWithKeyValuesArray:[XFModelTest sharedModelTest].payModleListDict[@"payModles"]];
    [self.tableView reloadData];
}
#pragma mark --datasource delegate

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return px(78);
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    PaymentTitleView *view = [[PaymentTitleView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, px(78))];
    return view;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.payModelArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return px(80);
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    PaymentModeCell *modelCell = [PaymentModeCell cellWithTableView:tableView];
    
    modelCell.payModel = self.payModelArray[indexPath.row];
    modelCell.delegate = self;
    modelCell.selectedIndexPath = indexPath;
    return modelCell;
}

-(void)handleSelectedButtonActionWithSelectedIndexPath:(NSIndexPath *)selectedIndexPath {
    
    self.isSelect = YES;
    PaymentModeCell *modelCelld  = [_tableView cellForRowAtIndexPath:_selectedIndexPath];
    [modelCelld.chooseButton setImage:[UIImage imageNamed:unchoose_fwgmImageName] forState:UIControlStateNormal];
    modelCelld.delegate = self;
    //记录当前选中的位置索引
    _selectedIndexPath = selectedIndexPath;
    
    //当前选择的打勾
     PaymentModeCell *cell = [_tableView cellForRowAtIndexPath:selectedIndexPath];
    [cell.chooseButton setImage:[UIImage imageNamed:choose_fwgmImageName] forState:UIControlStateNormal];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-NavBar_Height) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}


@end
