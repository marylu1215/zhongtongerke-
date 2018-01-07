//
//  SSHospitalListController.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/19.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSHospitalListController.h"
#import "SSHospitalDetailController.h"
#import "ChooseTableToolView.h"
#import "SSHospitalListCell.h"
#import <AMapLocationKit/AMapLocationManager.h>
#import <AMapSearchKit/AMapSearchAPI.h>
#import "Hospital.h"
#import "SearchNoBtnBar.h"

@interface SSHospitalListController ()<UITableViewDelegate,UITableViewDataSource,AMapLocationManagerDelegate,AMapSearchDelegate>

@property (nonatomic,strong) UITableView *tableView;
//** 下拉选择框 */
@property (nonatomic, weak) ChooseTableToolView *chooseView;
//** 下拉选择框 */
@property (nonatomic, strong) NSMutableArray *hospitalMuArr;

@property (nonatomic, strong) AMapLocationManager *locationManager;
@property (nonatomic, strong) AMapSearchAPI *mapSearch;
/**
 *  维度
 */
@property (nonatomic, assign) double latitude;
/**
 *  经度
 */
@property (nonatomic, assign) double longitude;

/**
 *  地址
 */
@property (nonatomic, copy) NSString *address;

@property (nonatomic, assign) NSInteger pageNum;
@property (nonatomic, strong) NSMutableDictionary *params;
@property (nonatomic, strong) NSMutableArray *tableDataArrOfArr;


@end

@implementation SSHospitalListController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
  
    [self.view addSubview:self.tableView];
    //设置导航栏
    [self setNaviBar];
    [self addChooseView];
    // 开启持续定位
    [self configLocationManager];
     [self loadAllAdmini];
  
}

- (void)setUpRefresh
{
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadAllHospital)];
    
    // 自动改变透明度
    self.tableView.mj_header.automaticallyChangeAlpha = YES;
    // 开始刷新
    [self.tableView.mj_header beginRefreshing];
    
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreHospital)];
    self.tableView.mj_footer.automaticallyChangeAlpha = YES;
}


//**所有科室 */
- (void)loadAllAdmini
{
    
    NSMutableArray *adNameArr = [NSMutableArray array];
    
    
    for (Administrative *administrative in self.adminiArray)
    {
        [adNameArr addObject:administrative.department];
    }
    
    self.tableDataArrOfArr[1] = adNameArr;
    
}


-(void)setNaviBar
{

    SearchNoBtnBar *search = [[SearchNoBtnBar alloc]initWithSearchBarEditDidChange:^(NSString *text) {
        //文字变化
        [self loadDataWithKeyWords:text];
    } SearchBegin:^(NSString *kWords) {
//        //点击搜索
        [self loadDataWithKeyWords:kWords];
    }];
   self.navigationItem.titleView = search;
    search.sd_layout.heightIs(px(52)).widthIs(200);
     search.layer.cornerRadius = 6;
    search.placeholder = @"大家都在搜: 医院，疾病,科室";
    search.limitMaxStrLength = 20;

}

- (void)addChooseView{
    
    ChooseTableToolView *chooseView = [[ChooseTableToolView alloc]initWithBtnArray:@[@"成都",@"科室",@"距离"] tableDataArrOfArr:self.tableDataArrOfArr];
    self.chooseView = chooseView;
    chooseView.backgroundColor = c255255255;
    chooseView.frame = CGRectMake(0,0, kScreenWidth, 44);
    [self.view addSubview:chooseView];
    __weak typeof(self) weakSelf = self;
    
    chooseView.selectCellModelBlock = ^(NSInteger tag ,NSInteger cellIndex){
        
        if (tag == 0) {//选择地点
            
           
        }
        else if (tag == 1){//选择科室
            
            weakSelf.administrative = self.adminiArray[cellIndex];
            
        }
        else if (tag==2)//距离排序
        {
            
        }
        
      [weakSelf.tableView.mj_header beginRefreshing];
       
    };
}


-(void)loadDataWithKeyWords:(NSString *)keyStr
{
   
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"name"] = keyStr;
    [MBProgressHUD showMessage:@"数据加载中..."];
    
    [HttpTool postWithURL:searchDoctorParty params:params success:^(id json) {
        ICLog(@"json menu:%@",json);
        
        if (jsonMsg(json)) {
            
            [self.hospitalMuArr removeAllObjects];
            NSArray *tempArr = [Hospital mj_objectArrayWithKeyValuesArray:json[@"data"]];
            [self.hospitalMuArr addObjectsFromArray:tempArr];
            [self.tableView reloadData];
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
-(void)loadAllHospital
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    self.pageNum = 1;
    params[@"p"] = @(self.pageNum);
    params[@"id"] = self.administrative.cid;
    params[@"address"] = self.address;
    self.params = params;
    
    [MBProgressHUD showMessage:@"数据加载中..."];
    
    [HttpTool postWithURL:getHospitalParty params:params success:^(id json) {
        ICLog(@"json menu:%@",json);
        if (self.params != params) return;
        
        if (jsonMsg(json)) {
            
            // 转模型
            [self.hospitalMuArr removeAllObjects];
            NSArray *tempArr = [Hospital mj_objectArrayWithKeyValuesArray:json[@"data"]];
            [self.hospitalMuArr addObjectsFromArray:tempArr];
            [self.tableView reloadData];
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
- (void)loadMoreHospital
{
    
    [self.tableView.mj_header endRefreshing];
    NSInteger page = self.pageNum + 1;
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    params[@"p"] = @(page);
    params[@"id"] = self.administrative.cid;
    params[@"address"] = self.address;
    self.params = params;
    
    [HttpTool postWithURL: getAllJchfForum params:params success:^(id json) {
        ICLog(@"json menu:%@",json);
        if (self.params != params) return;
        
        if (jsonMsg(json)) {
            
            // 转模型
            NSArray *tempArr = [Hospital mj_objectArrayWithKeyValuesArray:json[@"data"]];
            [self.hospitalMuArr addObjectsFromArray:tempArr];
            
            // 刷新表格
            [self.tableView reloadData];
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
    
    if (self.hospitalMuArr.count <= 0) {
        self.tableView.mj_footer.hidden = YES;
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return px(16);
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return CGFLOAT_MIN;
}
#pragma mark --delegate datasource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.hospitalMuArr.count;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return px(168);
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    SSHospitalListCell *listCellcell = [SSHospitalListCell cellWithTableView:tableView];
    listCellcell.hospital = self.hospitalMuArr[indexPath.section];
    return listCellcell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    SSHospitalDetailController *detaiVC = [[SSHospitalDetailController alloc]init];
    
    detaiVC.hospital = self.hospitalMuArr[indexPath.section];
    
    [self.navigationController pushViewController:detaiVC  animated:YES];
}
- (void)configLocationManager
{
    self.locationManager = [[AMapLocationManager alloc] init];
    // 设定定位的最小更新距离
    self.locationManager.distanceFilter = 500;
    [self.locationManager setDelegate:self];
    //设置不允许系统暂停定位
    [self.locationManager setPausesLocationUpdatesAutomatically:NO];
    //设置允许在后台定位
    [self.locationManager setAllowsBackgroundLocationUpdates:YES];
    
    [self.locationManager startUpdatingLocation];
    
    self.mapSearch = [[AMapSearchAPI alloc] init];
    self.mapSearch.delegate = self;
}

- (void)amapLocationManager:(AMapLocationManager *)manager didUpdateLocation:(CLLocation *)location
{
    ICLog(@"location:{lat:%f; lon:%f; accuracy:%f;monitoredRegions:%@}", location.coordinate.latitude, location.coordinate.longitude, location.horizontalAccuracy,self.locationManager.monitoredRegions);
    
    self.latitude = location.coordinate.latitude;
    self.longitude = location.coordinate.longitude;
    AMapReGeocodeSearchRequest *regeo = [[AMapReGeocodeSearchRequest alloc] init];
    regeo.location = [AMapGeoPoint locationWithLatitude:location.coordinate.latitude longitude:location.coordinate.longitude];
    regeo.requireExtension = YES;
    
    [self.mapSearch AMapReGoecodeSearch:regeo];
    
}

#pragma mark - AMapSearchDelegate
/* 逆地理编码回调. */
- (void)onReGeocodeSearchDone:(AMapReGeocodeSearchRequest *)request response:(AMapReGeocodeSearchResponse *)response
{
    if (response.regeocode != nil)
    {
     
      self.address = response.regeocode.formattedAddress;
        
        [self setUpRefresh];
        
    }
}

- (void)AMapSearchRequest:(id)request didFailWithError:(NSError *)error
{
    ICLog(@"erroe:%@",error);
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 44, kScreenWidth, kScreenHeight-NavBar_Height-44) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
       
    }
    return _tableView;
}

-(NSMutableArray *)hospitalMuArr
{
    if (!_hospitalMuArr) {
        
        _hospitalMuArr = [NSMutableArray new];
    }
    return   _hospitalMuArr;
}

#pragma mark - lazy
- (NSMutableArray *)tableDataArrOfArr{
    if (!_tableDataArrOfArr) {
        _tableDataArrOfArr = [NSMutableArray arrayWithArray:@[@[],@[],@[]]];
    }
    return _tableDataArrOfArr;
}
@end
