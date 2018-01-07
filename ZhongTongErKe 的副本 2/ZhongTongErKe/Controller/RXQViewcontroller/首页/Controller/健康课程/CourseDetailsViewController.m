//
//  CourseDetailsViewController.m
//  ZhongTongErKe
//
//  Created by khj on 2017/6/18.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "CourseDetailsViewController.h"
#import "CourseDetailsView.h"
#import "PackageDetailViewController.h"

@interface CourseDetailsViewController ()

@end

@implementation CourseDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"课程详情";
    
    UIImageView *bannerImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed: DetailsbannerIconImageName]];
    [self.view addSubview:bannerImageView];
    bannerImageView.sd_layout.widthIs(bannerImageView.image.size.width)
    .heightIs(bannerImageView.image.size.height).topSpaceToView(self,0).centerXEqualToView(self.view);
    
    self.view.backgroundColor = [UIColor colorWithHexString:@"f1f0f0"];
    
    
    UIButton *bottomButton= [UIButton addBtnWithTitle:@"参与课程" WithBGImg:nil WithFont:Font13 WithTitleColor:c255255255 Target:self Action:@selector(joinAction)];
    bottomButton.backgroundColor = cHBColor;
    [self.view addSubview:bottomButton];
    bottomButton.sd_layout.widthIs(kScreenWidth).heightIs(px(100)).bottomSpaceToView(self.view,0);
}

-(void)joinAction
{
    PackageDetailViewController *detailVC = [PackageDetailViewController new];
    detailVC.course = self.course;
    
    [self.navigationController pushViewController:detailVC animated:YES];
}
-(void)loadData
{
    [super loadData];
    
    Course *course =   [Course mj_objectWithKeyValues:[XFModelTest sharedModelTest].courseDetailsDict[@"CourseDetails"]];
    
    NSArray *leftCourseArray = @[@"适应年龄",@"最佳课程频次",@"每节课时",@"课程形式",@"课程目标"];
    
    CourseDetailsView *detailsView = [[CourseDetailsView alloc]initWithFrame:CGRectMake(0, px(264), kScreenWidth,CGRectGetMaxY(detailsView.subviews.lastObject.frame)+px(30)) LeftcourseArray:leftCourseArray CourseInfo:course];
    [self.view addSubview:detailsView];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
