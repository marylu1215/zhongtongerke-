//
//  SSTabBarController.m
//  ZhongTongErKe
//
//  Created by Claf on 17/4/28.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSTabBarController.h"
#import "ICNavigationController.h"
#import "ForumModuleViewController.h"
#import "SSIndexViewController.h"
#import "SSInterrogationViewController.h"
#import "SSPolularViewController.h"
#import "SSMineViewController.h"

@interface SSTabBarController ()
@property (nonatomic,strong) NSMutableArray *subViewControllerArray;

- (void)_initializeApperance;
- (void)_tabBarSetItemsWithViewController:(UIViewController *)viewController title:(NSString *)title imageName:(NSString *)imageName;
@end

@implementation SSTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     [self _initializeApperance];
}

- (void)_initializeApperance{
    [self _tabBarSetItemsWithViewController:[[SSIndexViewController alloc]init] title:@"首页" imageName:@"sy"];
    [self _tabBarSetItemsWithViewController:[[SSInterrogationViewController alloc]init] title:@"问诊" imageName:@"Interrogation"];
    [self _tabBarSetItemsWithViewController:[[ForumModuleViewController alloc]init] title:@"论坛" imageName:@"forum"];
    [self _tabBarSetItemsWithViewController:[[SSPolularViewController alloc]init] title:@"科普" imageName:@"kp"];
    [self _tabBarSetItemsWithViewController:[[SSMineViewController alloc]init] title:@"我的" imageName:@"mine"];
    self.viewControllers = self.subViewControllerArray;
}
- (void)_tabBarSetItemsWithViewController:(UIViewController *)viewController title:(NSString *)title imageName:(NSString *)imageName{
    viewController.tabBarItem.title = title;
    [viewController.tabBarItem setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12], NSForegroundColorAttributeName:[UIColor colorWithRed:0.506 green:0.514 blue:0.514 alpha:1.000]} forState:0];
    [viewController.tabBarItem setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12], NSForegroundColorAttributeName:[UIColor colorWithRed:0.318 green:0.847 blue:0.804 alpha:1.000]} forState:4];
    [viewController.tabBarItem setImage:[[UIImage imageNamed:[NSString stringWithFormat:@"%@-Unchecked", imageName]]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [viewController.tabBarItem setSelectedImage:[[UIImage imageNamed:[NSString stringWithFormat:@"%@", imageName]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    ICNavigationController  *nvc = [[ICNavigationController alloc]initWithRootViewController:viewController];
    nvc.navigationBar.barTintColor = MAIN_COLOR;
    nvc.navigationBar.tintColor = [UIColor whiteColor];
    [nvc.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor], NSFontAttributeName:[UIFont systemFontOfSize:16]}];
    [self.subViewControllerArray addObject:nvc];
}

- (NSMutableArray *)subViewControllerArray{
    if (_subViewControllerArray == nil) {
        _subViewControllerArray = [NSMutableArray arrayWithCapacity:0];
    }
    return _subViewControllerArray;
}


@end
