//
//  ICNavigationController.m
//  MagicFinger
//
//  Created by 瀚宇科技 on 16/4/27.
//  Copyright © 2016年 zeenc. All rights reserved.
//

#import "ICNavigationController.h"
@interface ICNavigationController ()<UIGestureRecognizerDelegate>
@end
@implementation ICNavigationController

+ (void)initialize
{
    UINavigationBar *bar = [UINavigationBar appearance];
    // 设置字体属性
    [bar setTitleTextAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:18],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    NSMutableDictionary *itemAttrs = [NSMutableDictionary dictionary];
    itemAttrs[NSFontAttributeName] = font(16);
    itemAttrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
    [item setTitleTextAttributes:itemAttrs forState:UIControlStateNormal];
    
    [item setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]} forState:UIControlStateDisabled];
    
    [bar setTintColor:[UIColor colorWithRed:(float)63/255.0 green:(float)230/255.0 blue:(float)216/255.0 alpha:1.000]];
    
  
    [bar setShadowImage:[UIImage new]];

    
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.interactivePopGestureRecognizer.delegate = self;
}
#pragma mark - UIGestureRecognizerDelegate
-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    
    return self.childViewControllers.count > 1;
}


- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        _button = button;
       
       
        UIImage *btnImage = [UIImage imageNamed:index_backImageName];
    
        btnImage = [btnImage  imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
        
        [button setImage:btnImage  forState:UIControlStateNormal];
       
        
        button.titleLabel.font=[UIFont boldSystemFontOfSize:15];
        button.size = button.currentImage.size;
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        button.titleEdgeInsets=UIEdgeInsetsMake(0, 5, 0, 0);
       
        [button addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

- (void)back:(UIButton *)btn
{
    if (btn.tag == 2222) {
        
    }else
    {
        [self popViewControllerAnimated:YES];
    }
    
}

@end
