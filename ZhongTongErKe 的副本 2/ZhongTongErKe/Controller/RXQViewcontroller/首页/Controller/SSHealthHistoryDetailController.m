//
//  SSHealthHistoryDetailController.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/9.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSHealthHistoryDetailController.h"
#import "SShealthHistorHeadeTwor.h"
#import "SSHealthHistoryFooter.h"
#import "HealthHistoryView.h"
#import "Disease.h"
#import "BottomView.h"
#import "UserTool.h"
#import "HealthHistory.h"


@interface SSHealthHistoryDetailController ()

@property (nonatomic ,weak)  SSHealthHistoryFooter *footerView;
@property (nonatomic ,weak) BottomView *bottomView;
// 已选的疾病集合
@property (nonatomic, strong) NSMutableArray *selectDiseaseMutableArray;

@property (nonatomic, strong) HealthHistory *healthHistory;

@property (nonatomic, weak) SShealthHistorHeadeTwor *headerView;

@property (nonatomic ,strong) NSArray *diseaseArray;

@property (nonatomic ,assign) BOOL swicth;
@end

@implementation SSHealthHistoryDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   
     self.title = @"健康史";
    
    [self addFooterBtn];
    
    SShealthHistorHeadeTwor *headerView = [[SShealthHistorHeadeTwor alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, px(200))];
    __weak typeof (self) weakSelf = self;
    
    headerView.backSelectBlock = ^(UIButton *btn)
    {
        [weakSelf showViewWith:btn];
        
    };
    
    [self.view addSubview:headerView];
    self.headerView = headerView;
    
    
    SSHealthHistoryFooter *footerView = [[SSHealthHistoryFooter alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(headerView.frame), kScreenWidth, px(370)) withDiseaseArr:[Disease mj_objectArrayWithKeyValuesArray:[XFModelTest sharedModelTest].diseaseListDict[@"healthHistorys"]]];
    footerView.hidden = YES;
    [self.view addSubview:footerView];
    self.footerView = footerView;
 
    
    
    BottomView *bottomView = [[BottomView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(footerView.frame), kScreenWidth, px(116))];
    bottomView.hidden = YES;
    [self.view addSubview:bottomView];
    
    self.bottomView = bottomView;
    
    [self showJks_listParty];
    
}

- (void)viewWillAppear:(BOOL)animated{
 
    self.tabBarController.tabBar.hidden = YES;
}
- (void)viewWillDisappear:(BOOL)animated{
 
    self.tabBarController.tabBar.hidden = NO;
}

-(void)showViewWith:(UIButton *)btn
{
    switch (btn.tag) {
        case 0:
        {
     
            self.footerView.hidden = NO;
          
            [self changeState];
            
            if (!self.swicth) {
                
                self.bottomView.hidden = NO;
            }
     
        }
           
            break;
            
        case 1:
            
            self.footerView.hidden = YES;
            self.bottomView.hidden = YES;
         
            break;
        default:
            break;
    }
}

-(void)changeState
{
    
       __weak typeof(self) weakSelf = self;
    
    self.footerView.backDiseBlock = ^(UIButton *btn)
    {
        
        if ([btn.titleLabel.text isEqualToString:@"其他"]&&btn.selected) {
            
            self.bottomView.hidden = NO;
            self.swicth = NO;
        }
        else
        {
            self.bottomView.hidden = YES;
             self.swicth = YES;
        }
        
        if (btn.selected) {
            
            [weakSelf.selectDiseaseMutableArray addObject:btn.titleLabel.text];
            if ([btn.titleLabel.text isEqualToString:@"其他"]) {
                [weakSelf.selectDiseaseMutableArray removeAllObjects];
                [weakSelf.selectDiseaseMutableArray addObject:btn.titleLabel.text];
            }
        }
        else
        {
            [weakSelf.selectDiseaseMutableArray removeObject:btn.titleLabel.text];
        }
        
    };
}
-(void)submitAction
{
    
    if (self.healthHistory) {
        
        //** 修改*/
        
        if (!self.footerView.hidden&&!self.selectDiseaseMutableArray.count) {

            [MBProgressHUD showError:@"填写完整资料才能提交哦!"];
            return;
        }
        
        if ([self.selectDiseaseMutableArray containsObject:@"其他"]) {
            if (!self.bottomView.contentTextField.text.length) {
                [MBProgressHUD showError:@"填写完整资料才能提交哦!"];
                return;
            }
        }
        
        
        kshowMessage(@"提交中...");
        NSMutableDictionary *params = [NSMutableDictionary dictionary];
        params[@"id"] = [UserTool user].userid;
        if ([self.selectDiseaseMutableArray containsObject:@"其他"]) {
            params[@"jks"] =  self.bottomView.contentTextField.text;
        }
        
        else{
           params[@"jks"] =  [self.selectDiseaseMutableArray componentsJoinedByString:@","];
        }
       
        [HttpTool postWithURL:savejksParty params:params success:^(id json) {
            
           
            if (jsonMsg(json)) {
                [MBProgressHUD showSuccess:@"提交成功！"];
                [self.navigationController popViewControllerAnimated:YES];
            }
            
            else
            {
               
            }
            
        } failure:^(NSError *error) {
            
        }];
        
    }

    else
    {
        //** 添加 */
        if (!self.footerView.hidden&&!self.selectDiseaseMutableArray.count) {
            
            [MBProgressHUD showError:@"填写完整资料才能提交哦!"];
        }
        
        
        kshowMessage(@"提交中...");
        NSMutableDictionary *params = [NSMutableDictionary dictionary];
        params[@"id"] = [UserTool user].userid;
        params[@"jks"] = [self.selectDiseaseMutableArray componentsJoinedByString:@","];
        
        [HttpTool postWithURL:submitUser_jksParty params:params success:^(id json) {
            
                       if (jsonMsg(json)) {
                [MBProgressHUD showSuccess:@"提交成功！"];
                [self.navigationController popViewControllerAnimated:YES];
            }
            
            else
            {
             
            }
            
        } failure:^(NSError *error) {
            
        }];

    }
    
}
//用户健康史显示
-(void)showJks_listParty
{
    kshowMessage(@"数据获取中...");
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"id"] = [UserTool user].userid;
  
    [HttpTool postWithURL:getUser_jksParty params:params success:^(id json) {
        
      
        if (jsonMsg(json)) {
            
         self.headerView.healthHistory = self.healthHistory = [HealthHistory mj_objectWithKeyValues:json[@"data"]];
            
            if (self.healthHistory.jks.length)
            {
                 [self showViewWith:self.headerView.yesButton];
            }
           else
           {
               [self showViewWith:self.headerView.noButton];
           }
            
            if (self.healthHistory.jks.length) {
               
                self.diseaseArray = [NSString transFormStringToArr:self.healthHistory.jks];
            }
            
          self.footerView.diseaseArray = self.diseaseArray;
        }
        
        else
        {
           
        }
        
    } failure:^(NSError *error) {
        
    }];
}
-(void)addFooterBtn
{
    UIButton  *nextPageButton = [UIButton addBtnWithTitle:@"提交" WithBGImg:nil WithFont:Font13 WithTitleColor:c255255255 Target:self Action:@selector(submitAction)];
    nextPageButton.backgroundColor = MAIN_COLOR;
    nextPageButton.layer.cornerRadius = 5;
    nextPageButton.clipsToBounds = YES;
    [self.view addSubview: nextPageButton];
    
   nextPageButton.sd_layout.leftSpaceToView(self.view,px(30)).rightSpaceToView(self.view,px(30)).heightIs(px(50)).bottomSpaceToView(self.view,px(20));
}

- (NSMutableArray *)selectDiseaseMutableArray
{
    if (_selectDiseaseMutableArray == nil) {
        _selectDiseaseMutableArray = [NSMutableArray array];
    }
    
    return _selectDiseaseMutableArray;
}


@end
