//
//  KJUploadImage.h
//  MagicFinger
//
//  Created by khj on 16/10/12.
//  Copyright © 2016年 zeenc. All rights reserved.
//  相册选择照片/照相 工具类

#import <Foundation/Foundation.h>
#import "LCActionSheet.h"
#import "CustomIOSAlertView.h"

typedef NS_ENUM(NSInteger,ActionSheetStyle) {
    ActionSheetStyleSystem, // 系统样式
    ActionSheetStyleCustom // 自定义样式
};

typedef NS_ENUM(NSInteger,SheetPhotoStyle) {
    SheetPhotoStylePhoto, // 相册
    SheetPhotoStyleTakePic, // 拍照
    SheetPhotoStyleTHistoryPhoto // 上传历史
};

//把单例方法定义为宏
#define KJUPLOAD_IMAGE [KJUploadImage shareUploadImage]
//代理方法
@protocol KJUploadImageDelegate <NSObject>
@optional
- (void)uploadImageToServerWithImage:(UIImage *)image pathStr:(NSString *)pathStr;
@end
@interface KJUploadImage : NSObject< UIActionSheetDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate,LCActionSheetDelegate,CustomIOSAlertViewDelegate>
{
    UIViewController *_fatherViewController;
    UIImagePickerController *_imagePickerVC;
}

@property (nonatomic, weak) id <KJUploadImageDelegate> uploadImageDelegate;
@property (nonatomic, assign) ActionSheetStyle sheetStyle;
@property (nonatomic, strong) UIActionSheet *sheet;
@property (nonatomic, strong) LCActionSheet *actionSheet;
@property (nonatomic, weak) UITextField *textField;
@property (nonatomic, copy) NSString *pathStr;
@property(nonatomic, assign) BOOL allowsEditing;

/**
 *  是否有弹窗
 */
@property (nonatomic, assign) BOOL isPopView;
//单例方法
+ (KJUploadImage *)shareUploadImage;
//弹出选项的方法
- (void)showActionSheetInFatherViewController:(UIViewController *)fatherVC
                                     delegate:(id<KJUploadImageDelegate>)aDelegate;

@property (nonatomic, copy) void(^historyPicBlock)(UIViewController *viewVC);
@end
