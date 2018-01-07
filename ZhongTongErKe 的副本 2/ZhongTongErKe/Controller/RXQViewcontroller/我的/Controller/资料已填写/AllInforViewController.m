//
//  AllInforViewController.m
//  ZhongTongErKe
//
//  Created by khj on 2017/6/4.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "AllInforViewController.h"
#import "AllInforView.h"
#import "TouchScrollView.h"
#import "UIBarButtonItem+Common.h"
#import "SSBasicFileController.h"
#import "UserTool.h"
#import "EatHabit.h"
#import "Drink.h"
#import "Smoke.h"
#import "Physical.h"

@interface AllInforViewController ()
// ** 主视图 */
@property (nonatomic,strong) TouchScrollView *mainSV;

//** 饮食习惯 */
@property (nonatomic, strong) AllInforView *eaHabitView;
//** 吸烟情况  */
@property (nonatomic, strong) AllInforView *smoView;
//** 饮酒情况  */
@property (nonatomic, strong) AllInforView *drinView;
//**体育活动 */
@property (nonatomic, strong) AllInforView *phyView;

@property (nonatomic, strong) EatHabit *eatHabit;
@property (nonatomic, strong)  Smoke *smoke;
@property (nonatomic, strong)  Physical *physical;
@property (nonatomic, strong)  Drink *drink;

@end

@implementation AllInforViewController

-(void)viewWillLayoutSubviews{
    
    self.mainSV.contentSize = CGSizeMake(kScreenWidth, CGRectGetMaxY(self.phyView .frame));
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self loadPartyData];
    self.tabBarController.tabBar.hidden = YES;
}


- (void)viewWillDisappear:(BOOL)animated{
  
    self.tabBarController.tabBar.hidden = NO;
}

-(void)loadPartyData
{
    kshowMessage(@"数据加载中");
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"userid"] = self.familyGroup.cid;
    
    [HttpTool postWithURL:partySelUrl params:params success:^(id json) {
        
              
        if (jsonMsg(json)) {
            
            [self creatViewWith:json];
            self.addOrRevise = YES;
        }
        kHideHUDAll;
        
    } failure:^(NSError *error) {
        netWorkError;
        kHideHUDAll;
    }];

}
-(void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = [NSString stringWithFormat:@"%@的个人资料", self.familyGroup.nikename];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithBtnTitle:@"编辑" target:self action:@selector(editAction)];
}

-(void)editAction
{
   
    SSBasicFileController *basicFileVC  = [SSBasicFileController new];
    basicFileVC.addOrRevise = self.addOrRevise;
    basicFileVC.eatHabit = self.addOrRevise?self.eatHabit:[EatHabit new];
    basicFileVC.smoke = self.addOrRevise?self.smoke:[Smoke new];
    basicFileVC.drink = self.addOrRevise?self.drink:[Drink new];
    basicFileVC.physical = self.addOrRevise?self.physical:[Physical new];
    basicFileVC.familyGroup = self.familyGroup;
    [self.navigationController pushViewController:basicFileVC animated:YES];
    
}
-(void)configUI
{
    [super configUI];
    

    self.mainSV = [[TouchScrollView  alloc]initWithFrame:self.view.frame];
    self.mainSV.backgroundColor = c255255255;
    [self.view addSubview:self.mainSV];
    
    self.eaHabitView = [[AllInforView alloc]initWithTitle:@"饮食习惯" SubTitle:@"一般情况下,你平均每周几天吃下列食物？每天大概吃多少?"  LeftArr:@[@"谷类(大米，面食，杂粮)",@"肉类(猪，牛，羊,家禽)",@"新鲜蔬菜和水果",@"鱼类和其他水产品",@"甜食(甜点，蛋糕,水果等",@"油炸食品",@"腌渍、熏类食品",@"你的口味和周围的人相比如何"]];
    [self.mainSV addSubview: self.eaHabitView];
    self.eaHabitView.sd_layout.widthIs(kScreenWidth).heightIs(CGRectGetMaxY(self.eaHabitView.subviews.lastObject.frame)).topSpaceToView(self.mainSV,0);
    
    // 吸烟情况
    self.smoView = [[AllInforView alloc]initWithTitle:@"吸烟情况" SubTitle:@"" LeftArr:@[@"您吸烟吗",@"烟龄"]];
    [self.mainSV addSubview:  self.smoView];
    self.smoView .sd_layout.widthIs(kScreenWidth).heightIs(CGRectGetMaxY( self.smoView.subviews.lastObject.frame)).topSpaceToView( self.eaHabitView,px(30));
    
    
    // 饮酒情况
    self.drinView = [[AllInforView alloc]initWithTitle:@"饮酒情况"SubTitle:@"" LeftArr:@[@"您饮酒吗"]];
    
    [self.mainSV addSubview:   self.drinView ];
    self.drinView.sd_layout.widthIs(kScreenWidth).heightIs(CGRectGetMaxY( self.drinView.subviews.lastObject.frame)).topSpaceToView( self.smoView,px(30));
    
    //体力活动及体育锻炼
    
    self.phyView = [[AllInforView alloc]initWithTitle:@"体力活动及体育锻炼"SubTitle:@"" LeftArr:@[@"您的工作性质",@"您上班的交通",@"干家务活",@"每周持续锻炼20分钟以上"] ];
    [self.mainSV addSubview: self.phyView ];
    self.phyView.sd_layout.widthIs(kScreenWidth).heightIs(CGRectGetMaxY( self.phyView.subviews.lastObject.frame)).topSpaceToView( self.drinView,px(30));
    
    [self.mainSV setupAutoContentSizeWithBottomView:self.phyView bottomMargin:(15 + 64)];
    

}

-(void)creatViewWith:(id)json
{
    self.eatHabit = [EatHabit mj_objectWithKeyValues:json[@"ysxg"]];
  self.smoke = [Smoke mj_objectWithKeyValues:json[@"is_xiyan"]];
  
    self.drink = [Drink mj_objectWithKeyValues:json[@"hejiu"]];
    self.physical =[ Physical mj_objectWithKeyValues:json[@"qita"]];
    
    self.eaHabitView.rightArr =  @[self.eatHabit.diet_rice.length?self.eatHabit.diet_rice:@"",self.eatHabit.diet_meat.length?self.eatHabit.diet_meat:@"",self.eatHabit.diet_fruits.length?self.eatHabit.diet_fruits:@"",self.eatHabit.diet_fish.length?self.eatHabit.diet_fish:@"",self.eatHabit.diet_sugar.length?self.eatHabit.diet_sugar:@"",self.eatHabit.diet_oil.length?self.eatHabit.diet_oil:@"",self.eatHabit.diet_smoked.length?self.eatHabit.diet_smoked:@"",self.eatHabit.diet_contrast.length?self.eatHabit.diet_contrast:@""];
    
    self.smoView.rightArr = @[self.smoke.is_smoke==0? @"不吸烟":@"吸烟",self.smoke.smoke_year.length?self.smoke.smoke_year:@""];

    self.drinView.rightArr = @[self.drink.hejiu==0? @"不喝酒":@"喝酒"];

    self.phyView.rightArr =  @[self.physical.work_nature.length?self.physical.work_nature:@"",self.physical.vehicle.length?self.physical.vehicle:@"",self.physical.work.length?self.physical.work:@"",self.physical.sports.length?self.physical.sports:@""];
}
@end
