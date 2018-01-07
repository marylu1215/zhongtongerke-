//
//  KJUploadImage.m
//  MagicFinger
//
//  Created by khj on 16/10/12.
//  Copyright © 2016年 zeenc. All rights reserved.
//

#import "KJUploadImage.h"
#import "ICNavigationController.h"


static KJUploadImage *kjUploadImage = nil;

@interface KJUploadImage ()

@end

@implementation KJUploadImage
+ (KJUploadImage *)shareUploadImage {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        kjUploadImage = [[KJUploadImage alloc] init];
    });
    return kjUploadImage;
}

- (void)showActionSheetInFatherViewController:(UIViewController *)fatherVC
                                     delegate:(id<KJUploadImageDelegate>)aDelegate {
    kjUploadImage.uploadImageDelegate = aDelegate;
    _fatherViewController = fatherVC;
    
    if (self.sheetStyle == ActionSheetStyleCustom) {
        [self.actionSheet show];
    }else
    {
        self.sheet.delegate = self;
        [self.sheet showInView:fatherVC.view];
    }
    
}

#pragma mark - UIActionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == SheetPhotoStylePhoto) {
        if (self.isPopView) {
            [self popViewWithTag:SheetPhotoStylePhoto];
        }else
        {
            [self fromPhotos];
        }
        
    }else if (buttonIndex == SheetPhotoStyleTakePic) {
        if (self.isPopView) {
            [self popViewWithTag:SheetPhotoStyleTakePic];
        }else
        {
            [self createPhotoView];
        }
        
    }else if (buttonIndex == SheetPhotoStyleTHistoryPhoto)
    {
        [self historyPicVC];
    }
}

#pragma mark - 弹窗
- (void)popViewWithTag:(NSInteger)tag
{
    CustomIOSAlertView *alertView = [[CustomIOSAlertView alloc] init];
    alertView.tag = tag;
    // Add some custom content to the alert view
    
    [alertView setContainerView:[self createAlertView]];
    
    // Modify the parameters
    [alertView setButtonTitles:[NSMutableArray arrayWithObjects:@"取消", @"确定", nil]];

    // You may use a Block, rather than a delegate.
    [alertView setOnButtonTouchUpInside:^(CustomIOSAlertView *alertView, int buttonIndex) {
        
        if (buttonIndex == 0) {
            [alertView close];
        }
        
        if (!self.pathStr && buttonIndex == 1) {
            [MBProgressHUD showError:@"请输入图片名"];
            return;
        }
        
        if (alertView.tag == SheetPhotoStylePhoto && buttonIndex == 1) {
            [self fromPhotos];
        }else if (alertView.tag == SheetPhotoStyleTakePic && buttonIndex == 1) {
            [self createPhotoView];
        }
        [alertView close];
    }];
    
    [alertView setUseMotionEffects:true];
    
    // And launch the dialog
    [alertView show];
}

- (UIView *)createAlertView
{
    UIView *writeView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth -  2 * px(40), 110)];
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = @"图片命名";
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.frame = CGRectMake(0, 0, writeView.width, 50);
    [writeView addSubview:titleLabel];
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(titleLabel.frame), writeView.width, 0.5)];
    lineView.backgroundColor = [UIColor grayColor];
    [writeView addSubview:lineView];
    
    UIView *centerView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(lineView.frame), writeView.width, 60)];
    [writeView addSubview:centerView];
    
    UITextField *textField = [[UITextField alloc] init];
    [centerView addSubview:textField];
    textField.placeholder = @"输入名字";
    textField.font = font(15);
    CGFloat textFieldH = 40;
    CGFloat textFieldX = 30;
    textField.frame = CGRectMake(textFieldX, (centerView.height - textFieldH) * 0.5, centerView.width - 2 * textFieldX, textFieldH);
    textField.borderStyle = UITextBorderStyleRoundedRect;
    self.textField = textField;
    // 监听文本框文字的改变
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFiledEditDidChanged:) name:UITextFieldTextDidChangeNotification object:textField];
    
    return writeView;
}

-(void)textFiledEditDidChanged:(NSNotification *)obj{
    UITextField *textField = (UITextField *)obj.object;
    textField.text = @"";
    //限制字数
//    [textField textField:textField maxStrLength:200];
  
    self.pathStr = textField.text;
}
-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

#pragma mark - LCActionSheet Delegate
- (void)lcactionSheet:(LCActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    switch (buttonIndex) {
        case (SheetPhotoStylePhoto + 1):
            [self fromPhotos];
            break;
        case (SheetPhotoStyleTakePic + 1):
            [self createPhotoView];
            break;
        case (SheetPhotoStyleTHistoryPhoto + 1):
            
            break;
            
        default:
            break;
    }
}

#pragma mark - 上传历史
- (void)historyPicVC
{
    if (self.historyPicBlock) {
        self.historyPicBlock(_fatherViewController);
    }
}

#pragma mark - 头像(相机和从相册中选择)
- (void)createPhotoView {
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        UIImagePickerController *imagePC = [[UIImagePickerController alloc] init];
        imagePC.sourceType                = UIImagePickerControllerSourceTypeCamera;
        imagePC.delegate                  = self;
        imagePC.allowsEditing             = self.allowsEditing;
        [_fatherViewController presentViewController:imagePC
                                            animated:YES
                                          completion:^{
                                          }];
    }else {
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                         message:@"该设备没有照相机"
                                                        delegate:nil
                                               cancelButtonTitle:@"确定"
                                               otherButtonTitles:nil];
        [alert show];
    }
}
//图片库方法(从手机的图片库中查找图片)
- (void)fromPhotos {
    UIImagePickerController *imagePC = [[UIImagePickerController alloc] init];
    imagePC.sourceType                = UIImagePickerControllerSourceTypePhotoLibrary;
    imagePC.delegate                  = self;
    imagePC.allowsEditing             = self.allowsEditing;
    _imagePickerVC = imagePC;
    
    imagePC.navigationBar.tintColor = [UIColor whiteColor];
    imagePC.navigationBar.translucent = NO;
    
    
    [_fatherViewController presentViewController:imagePC
                                        animated:YES
                                      completion:^{
                                      }];
}

-(void)popViewController
{
    [_imagePickerVC popViewControllerAnimated:YES];
}

#pragma mark - UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    [picker dismissViewControllerAnimated:YES completion:^{
    }];
    UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
    if (!self.allowsEditing) {
        image = [info objectForKey:UIImagePickerControllerOriginalImage];
    }
    
    /**
     *  上传用户头像
     */
    if (self.uploadImageDelegate && [self.uploadImageDelegate respondsToSelector:@selector(uploadImageToServerWithImage:pathStr:)]) {
        [self.uploadImageDelegate uploadImageToServerWithImage:image pathStr:self.pathStr];
    }
}



@end
