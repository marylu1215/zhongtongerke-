//
//  SSBasicFileController.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/5.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSBasicFileController.h"
#import "SSBasicFileTableCell.h"
#import "SSBasicFileSectionView.h"
#import "SSBasicFileFooter.h"
#import "HealthHistory.h"


@interface SSBasicFileController ()<UITableViewDelegate,UITableViewDataSource,SSBasicFileTableCellDelegate>

@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic ,strong) NSArray *healthHistoryArray;

@end

@implementation SSBasicFileController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = [NSString stringWithFormat:@"%@的个人资料",self.familyGroup.nikename];
    
    [self.view addSubview:self.tableView];
    
    [self creatBottomView];
    
}
- (void)viewWillAppear:(BOOL)animated{
  
    self.tabBarController.tabBar.hidden = YES;
}
- (void)viewWillDisappear:(BOOL)animated{
  
    self.tabBarController.tabBar.hidden = NO;
}
-(void)loadData
{
 
    self.healthHistoryArray = [HealthHistory mj_objectArrayWithKeyValuesArray:[XFModelTest sharedModelTest].healthHistoryListDict[@"healthHistorys"]];
    [self.tableView reloadData];
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
 
}

-(void)creatBottomView
{
    UIView *bottomView = [[UIView alloc]init];
    [self.view addSubview:bottomView];
    bottomView.backgroundColor = BACKGROUND_COLOR;
    bottomView.sd_layout.widthIs(kScreenWidth).heightIs(px(100)).bottomSpaceToView(self.view,0);
    
    UIButton *submitBtn = [UIButton addBtnWithTitle:@"确认资料" WithBGImg:nil WithFont:Font13 WithTitleColor:c255255255 Target:self Action:@selector(submitAction)];
    submitBtn.backgroundColor = cHBColor;
    submitBtn.layer.cornerRadius =6;
    submitBtn.clipsToBounds = YES;
    [bottomView addSubview:submitBtn];
    submitBtn.sd_layout.widthIs(px(404)).heightIs(px(50)).centerXEqualToView(bottomView).centerYEqualToView(bottomView);
}

#pragma mark --delegate datasource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
   SSBasicFileTableCell *cell =  (SSBasicFileTableCell *)[self tableView:tableView cellForRowAtIndexPath:indexPath];
    return cell.bounds.size.height;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
   
    SSBasicFileSectionView *view = (SSBasicFileSectionView *)[self tableView:tableView viewForHeaderInSection:section];
    return  view.bounds.size.height;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    if (section == self.healthHistoryArray.count-1) {
        return px(30);
    }
    else
    {
        return CGFLOAT_MIN;
    }
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
   
    HealthHistory  *healthHistory = self.healthHistoryArray[section];
    SSBasicFileSectionView *view = [[SSBasicFileSectionView alloc]init];
    view.healthHistory = healthHistory;
    view.frame =CGRectMake(0, 0, kScreenWidth, CGRectGetMaxY(view.subviews.lastObject.frame));
    return view;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return self.healthHistoryArray.count;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
   HealthHistory  *healthHistory = self.healthHistoryArray[section];
     return healthHistory.problems.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  
    SSBasicFileTableCell *cell = [ SSBasicFileTableCell cellWithTableView:tableView];
    HealthHistory  *healthHistory = self.healthHistoryArray[indexPath.section];
    Problem *problem = healthHistory.problems[indexPath.row];
   
    NSLog(@"%@",problem.answerArray);
    
    cell.problem = problem;
    cell.delegate= self;
    cell.btnView.tag = indexPath.section*10+indexPath.row;
    return cell;
}

-(void)cell:(SSBasicFileTableCell *)cell actionWithButton:(SSBasicFileButton *)button view:(UIView *)view
{
   
    if (view.tag/10==0) {
        switch (view.tag%10) {
            case 0:
                self.eatHabit.diet_rice = button.titleLabel.text;
                break;
                
            case 1:
                 self.eatHabit.diet_meat = button.titleLabel.text;
                break;
                
            case 2:
                 self.eatHabit.diet_fruits = button.titleLabel.text;
                break;
                
            case 3:
                 self.eatHabit.diet_fish = button.titleLabel.text;
                break;
                
            case 4:
                 self.eatHabit.diet_sugar = button.titleLabel.text;
                break;
                
            case 5:
                 self.eatHabit.diet_oil = button.titleLabel.text;
                break;
                
            case 6:
                 self.eatHabit.diet_smoked = button.titleLabel.text;
                break;
                
            case 7:
                 self.eatHabit.diet_contrast = button.titleLabel.text;
                break;
                
            default:
                break;
        }
       
    }
    
    if (view.tag/10==1) {
        switch (view.tag%10) {
            case 0:
                
                self.smoke.is_smoke =  button.titleLabel.text ;
                break;
                
            case 1:
                self.smoke.smoke_year = button.titleLabel.text;
                break;
            default:
                break;
        }
        
    }

    
    if (view.tag/10==2) {
        switch (view.tag%10) {
            case 0:
                self.drink.hejiu  = button.titleLabel.text ;
                break;
            default:
                break;
        }
        
    }

    
    if (view.tag/10==3) {
        switch (view.tag%10) {
            case 0:
                self.physical.work_nature = button.titleLabel.text;
                break;
                
            case 1:
                self.physical.vehicle = button.titleLabel.text;
                break;
                
            case 2:
                self.physical.work = button.titleLabel.text;
                break;
                
            case 3:
                self.physical.sports = button.titleLabel.text;
                break;
            default:
                break;
        }
        
    }

    
}


-(void)submitAction
{

    [self checkInfo];

}
-(void)checkInfo
{
    
    NSString *urlPath;
    
    if (!self.addOrRevise) {
        
        urlPath = getPartyData;
        if (!self.eatHabit.diet_rice.length) {
            
            [MBProgressHUD showError:@"请选择饮食习惯-谷类"];
            return;
            
        }
        if (!self.eatHabit.diet_meat.length) {
            [MBProgressHUD showError:@"请选择肉类"];
            return;
        }
        if (!self.eatHabit.diet_fruits.length) {
            [MBProgressHUD showError:@"请选择蔬菜水果"];
            return;
        }
        if (!self.eatHabit.diet_fish.length) {
            [MBProgressHUD showError:@"请选择鱼类"];
            return;
        }
        if (!self.eatHabit.diet_sugar.length) {
            [MBProgressHUD showError:@"请选择甜品"];
            return;
        }
        if (!self.eatHabit.diet_oil.length) {
            [MBProgressHUD showError:@"请选择油炸食品"];
            return;
        }
        if (!self.eatHabit.diet_smoked.length) {
            [MBProgressHUD showError:@"请选择烟熏食品"];
            return;
        }
        if (!self.eatHabit.diet_contrast.length) {
            [MBProgressHUD showError:@"请选择烟熏食品"];
            return;
        }
        if (!self.smoke.is_smoke.length) {
            [MBProgressHUD showError:@"请选择饮食对比"];
            return;
        }
        if (!self.smoke.smoke_year.length) {
            [MBProgressHUD showError:@"请选择烟龄"];
            return;
        }
        if (!self.drink.hejiu.length) {
            [MBProgressHUD showError:@"请选择喝酒情况"];
            return;
        }
        
        if (!self.physical.work_nature.length) {
            [MBProgressHUD showError:@"请选择工作性质"];
            return;
        }
        if (!self.physical.vehicle.length) {
            [MBProgressHUD showError:@"请选择交通工具"];
            return;
        }
        if (!self.physical.sports.length) {
            [MBProgressHUD showError:@"请选择体育锻炼"];
            return;
        }
        if (!self.physical.work.length) {
            [MBProgressHUD showError:@"请选择干家务活的时间"];
            return;
        }

    }
    else
    {
        urlPath = savePartyData;
    }
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"userid"] = self.familyGroup.cid;
    params[@"rice"] = self.eatHabit.diet_rice;
    params[@"meat"] = self.eatHabit.diet_meat;
    params[@"fruits"] = self.eatHabit.diet_fruits;
    params[@"fish"] = self.eatHabit.diet_fish;
    params[@"sugar"] = self.eatHabit.diet_sugar;
    params[@"oil"] = self.eatHabit.diet_oil;
    params[@"smoked"] = self.eatHabit.diet_smoked;
    params[@"contrast"] = self.eatHabit.diet_contrast;
    params[@"smoke"] = self.smoke.is_smoke;
    params[@"year"] = self.smoke.smoke_year;
    params[@"drink"] = self.drink.hejiu;
    params[@"nature"] = self.physical.work_nature;
    params[@"vehicle"] = self.physical.vehicle;
    params[@"sports"] = self.physical.sports;
    params[@"work"] = self.physical.work;
    
    kshowMessage(@"数据提交中...");
    
    [HttpTool postWithURL:urlPath params:params success:^(id json) {
        
        ICLog(@"json menu:%@",json);
        
        if (jsonMsg(json)) {
            
            [self.navigationController popViewControllerAnimated:YES];
            
        }
        
        else
        {
            
            [MBProgressHUD showError:json[@"msg"]];
            
        }
        
        kHideHUDAll;
        
    } failure:^(NSError *error) {
        netWorkError;
        kHideHUD;
    }];


}

#pragma mark --lazyload

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-NavBar_Height-TabBar_Height) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}
@end
