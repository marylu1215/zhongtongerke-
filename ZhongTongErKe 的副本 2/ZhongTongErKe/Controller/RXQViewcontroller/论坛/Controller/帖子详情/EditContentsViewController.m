//
//  EditContentsViewController.m
//  ZhongTongErKe
//
//  Created by khj on 2017/7/12.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "EditContentsViewController.h"
#import "UIBarButtonItem+Common.h"
#import "EditContentsView.h"
#import "HotGroup.h"
#import "ActionSheetView.h"
#import "UserTool.h"

@interface EditContentsViewController ()

@property (nonatomic, strong) NSMutableArray *imageUrlMuArr;
@property (nonatomic ,strong) NSArray *hotGroupArray;
@property (nonatomic ,strong) HotGroup *hotGroup;
@property (nonatomic ,weak) EditContentsView *headerView;
@property(nonatomic ,strong) NSMutableArray *enIStrMuArr;

@end

@implementation EditContentsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.title = @"编辑内容";
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTitle:@"发表" target:self action:@selector(editAction) font:font(Font15) color:c255255255 highlightColor:c255255255];
    
    EditContentsView *headerView = [[EditContentsView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, px(610))];
    
    __weak typeof (self) weakSelf = self;
    headerView.selectBlock = ^()
    {
        
        [ weakSelf showActionSheetViewWithTaskModelArray:self.hotGroupArray];
    };
    self.headerView = headerView;
    [self.view addSubview:headerView];
    
}


-(void)editAction
{
    if (!self.headerView.titleTextField.text.length) {
        
        [MBProgressHUD showError:@"请输入标题!"];
        return;
    }
    
    if (!self.headerView.descView.descriptionTV.text.length) {
        
        [MBProgressHUD showError:@"请输入帖子内容!"];
        return;
    }
    
    if (!self.hotGroup.cid.length) {
        
        [MBProgressHUD showError:@"请选择群组!"];
        return;
        
    }
    
    if (self.headerView.photos.count) {
        
        for (UIImage *image in self.headerView.photos) {
        
        NSData *data = UIImageJPEGRepresentation(image, 1.0f);
        
        NSString *encodedImageStr = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
        [self.enIStrMuArr addObject:encodedImageStr];
        
        }
       
    }
    
    [self  submitPost];
    
}

-(void) submitPost
{
    

    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"title"] = self.headerView.titleTextField.text;
    params[@"content"] = self.headerView.descView.descriptionTV.text;
    params[@"qz_id"] = self.hotGroup.cid;
    params[@"username"] = [UserTool user].userid;
    params[@"img"] = [self.enIStrMuArr componentsJoinedByString:@"|"];
    
    [MBProgressHUD showMessage:@"帖子发表中..."];
    
    [HttpTool postWithURL:sendUser_ftForum params:params success:^(id json) {
        
        ICLog(@"json menu:%@",json);
        
        if (jsonMsg(json))
        {
            
            [MBProgressHUD showSuccess:@"成功,审核中...."];
            [self.navigationController popViewControllerAnimated:YES];
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
-(void)loadData
{
    kshowMessage(@"数据加载中");
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    [HttpTool postWithURL:getHotqzForum params:params success:^(id json) {
        
        
        
        if (jsonMsg(json)) {
            
            self.hotGroupArray = [HotGroup mj_objectArrayWithKeyValuesArray:json[@"data"]];
        }
        kHideHUDAll;
        
    } failure:^(NSError *error) {
        netWorkError;
        kHideHUDAll;
    }];
}

#pragma mark  弹出视图
- (void)showActionSheetViewWithTaskModelArray:(NSArray *)taskModelArray
{
    
   ActionSheetView *sheet = [[ActionSheetView alloc] initWithList:taskModelArray height:0 type: ActionSheetViewTypeHotGroup];
    
    __weak typeof (self) weakSelf = self;

    sheet.selectRowAtIndex = ^(NSInteger index)
    {
        weakSelf.hotGroup  = weakSelf.hotGroupArray[index];
       
    };

    [sheet showInView:nil];
}

-(NSMutableArray *)enIStrMuArr
{
    if (!_enIStrMuArr) {
        
        _enIStrMuArr = [NSMutableArray new];
    }
    return _enIStrMuArr;
}


@end
