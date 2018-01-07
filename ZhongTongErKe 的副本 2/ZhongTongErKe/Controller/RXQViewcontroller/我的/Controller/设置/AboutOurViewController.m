//
//  AboutOurViewController.m
//  ZhongTongErKe
//
//  Created by khj on 2017/7/14.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "AboutOurViewController.h"

@interface AboutOurViewController ()

@end

@implementation AboutOurViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
     self.title = @"关于我们";
    

    UILabel *copyLabel =[[UILabel alloc]init];
    copyLabel.text=@"Copyright©2017 yilutongxing.All rights reserved";
    copyLabel.font=font(13);
    copyLabel.textColor=TITLE_COLOR;
    CGSize copyLabellSize  =[copyLabel.text sizeWithFont:font(13)];
    [self.view  addSubview:copyLabel];
    copyLabel.sd_layout.widthIs(copyLabellSize .width).heightIs(13).centerXEqualToView(self.view).bottomSpaceToView(self.view,px(10));
    
    
    UILabel *softwareLabel=[[UILabel alloc]init];
    softwareLabel.text=@"成都西南儿童医院有限公司 版权所有";
    softwareLabel.font=font(13);
    softwareLabel.textColor=TITLE_COLOR;
    CGSize softwareLabelSize  =[softwareLabel.text sizeWithFont:font(14)];
    [self.view addSubview:softwareLabel];
    softwareLabel.sd_layout.widthIs(softwareLabelSize.width).heightIs(14).centerXEqualToView(self.view).bottomSpaceToView(copyLabel,px(10));
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
