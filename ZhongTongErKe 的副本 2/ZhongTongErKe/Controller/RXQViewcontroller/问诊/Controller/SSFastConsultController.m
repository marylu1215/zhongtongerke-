//
//  SSFastConsultController.m
//  ZhongTongErKe
//
//  Created by Claf on 17/5/10.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "SSFastConsultController.h"
#import "SSChooseHealthFileController.h"
#import "UIBarButtonItem+Common.h"
#import "KJPlaceholderTextView.h"
#import "SelectPicOrTextView.h"
#import "KJUploadImage.h"
#import "FamilyGroup.h"

@interface SSFastConsultController ()<KJUploadImageDelegate>

@property (nonatomic,strong) KJPlaceholderTextView *textView;

@end

@implementation SSFastConsultController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.title = @"快速咨询";
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTitle:@"下一步" target:self action:@selector(nextStepButtoTaped:) font: font( Font15) color:  c255255255 highlightColor:c255255255];
    
}

- (void)viewWillDisappear:(BOOL)animated{
    self.tabBarController.tabBar.hidden = NO;
    
}
- (void)viewWillAppear:(BOOL)animated{
    self.tabBarController.tabBar.hidden = YES;
}

#pragma mark --private
- (void)setUP{
    
    self.textView = [[KJPlaceholderTextView  alloc]init];
    _textView.font = [UIFont systemFontOfSize:12*kScreenHeightScale];
    _textView.textColor =REMARK_COLOR;
    _textView.placeholder = @"请详细描述您的症状、疾病和身体情况，便于医生更准确的分析。";
    [self.view addSubview: self.textView];
     self.textView.sd_layout.widthIs(kScreenWidth).heightIs(158).topSpaceToView(self.view,0) ;

    SelectPicOrTextView *selectView = [[SelectPicOrTextView alloc]init];
    selectView.backgroundColor = [UIColor whiteColor];
    selectView.btnSelectBlock =^(UIButton *btn)
    {
        switch (btn.tag) {
            case 0:
                
                break;
                
            case 1:
                [self choosePhoto];
                break;
                
            default:
                break;
        }
    };
    
    [self.view addSubview:selectView ];
    selectView.sd_layout.widthIs(kScreenWidth).heightIs(px(100)).bottomSpaceToView(self.view,0);
}

//选择照片
-(void)choosePhoto{
    [self.view endEditing:YES];
    
    KJUPLOAD_IMAGE.sheetStyle = ActionSheetStyleSystem;
    KJUPLOAD_IMAGE.isPopView = NO;
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:nil
                                                       delegate:nil
                                              cancelButtonTitle:@"取消"
                                         destructiveButtonTitle:nil
                                              otherButtonTitles:@"相册", @"拍照", nil];
    KJUPLOAD_IMAGE.sheet = sheet;
    KJUPLOAD_IMAGE.allowsEditing = YES;
    [KJUPLOAD_IMAGE showActionSheetInFatherViewController:self delegate:self];
}

//实现代理方法即可
#pragma mark - KJUploadImageDelegate
- (void)uploadImageToServerWithImage:(UIImage *)image pathStr:(NSString *)pathStr{
    
  
}


- (void)nextStepButtoTaped:(UIButton *)sender{
   
 
    [self.navigationController pushViewController:[[SSChooseHealthFileController alloc]init] animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
    
}



@end
