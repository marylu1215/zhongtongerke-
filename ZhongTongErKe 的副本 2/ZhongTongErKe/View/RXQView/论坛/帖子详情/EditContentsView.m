//
//  EditContentsView.m
//  ZhongTongErKe
//
//  Created by khj on 2017/7/12.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "EditContentsView.h"
#import "KJUploadImage.h"
//#import "SDPhotoBrowser.h"

@interface EditContentsView ()

<KJUploadImageDelegate,UITextFieldDelegate>

@property (nonatomic ,strong) UIButton *bgButton;
@property (nonatomic ,strong) UILabel *selectGroupLabel;
@property (nonatomic ,strong) UIImageView *rightImageView;

//** 包含添加图片数组 */
@property (nonatomic,strong) NSMutableArray *photoIVMuArr;

@end
@implementation EditContentsView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = BACKGROUND_COLOR;
        
        [self configUI];
    }
    return self;
}
-(void)configUI{
    
    [self creatHeaderView];
    
    //** 问题描述视图 */
    [self creatDescriptionView];
    //** 上传图片视图 */
    [self creatPhotoView];
    
}

-(void)creatHeaderView
{
    self.bgButton = [UIButton addBgBtnWithBGClor:c255255255 Target:self Action:@selector(selectActioin)];
    [self addSubview:self.bgButton];
    
    self.bgButton.sd_layout.widthIs(kScreenWidth).heightIs(px(80)).topSpaceToView(self,0);
    
    self.rightImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:goImageName]];
    [self.bgButton addSubview:self.rightImageView];
    self.rightImageView.sd_layout.widthIs(self.rightImageView.image.size.width).heightIs(self.rightImageView.image.size.height).centerYEqualToView(self.bgButton).rightSpaceToView(self.bgButton,px(30));
    
    
    self.selectGroupLabel = [UILabel addLabelWithText:@"选择群组" AndFont:Font13 AndAlpha:1.0 AndColor:cHBColor];
    [self.bgButton addSubview:self.selectGroupLabel];
    self.selectGroupLabel.sd_layout.leftSpaceToView(self.bgButton,px(20)).rightSpaceToView(self.rightImageView,0).centerYEqualToView(self.bgButton).heightIs(Font13);
    

    
}
#pragma mark  问题描述视图
- (void)creatDescriptionView
{
    
    self.titleTextField = [UITextField addTextFieldWithPlaceholder:@"标题(30字以内)" Font:Font13 TextColor:TITLE_COLOR TextAlignment:NSTextAlignmentLeft];
    // 监听文本框文字的改变
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFiledEditDidChanged:) name:UITextFieldTextDidChangeNotification object: self.titleTextField];
    [self addSubview:self.titleTextField]; //** 填写想法 */
    self.titleTextField.delegate = self;
   self.titleTextField.sd_layout.leftSpaceToView(self,px(20)).rightSpaceToView(self,0).topSpaceToView(self.bgButton,0).heightIs(px(60));
    
    _descView = [[DescriptionView alloc]initWithPlaceholder:@"敬请您的想法吧!" maxLength:500];
    [self addSubview:_descView];
    _descView.sd_layout.leftSpaceToView(self,0).rightSpaceToView(self,0).topSpaceToView(self.titleTextField,0).heightIs(px(300));
    [_descView updateLayout];
}
#pragma mark 上传图片视图
- (void)creatPhotoView
{
    //图片：
    _PhotoBgView = [TouchScrollView new];
    _PhotoBgView.backgroundColor = c255255255;
    [self addSubview:_PhotoBgView];
    _PhotoBgView.showsHorizontalScrollIndicator = NO;
    _PhotoBgView.showsVerticalScrollIndicator = NO;
   
    _addPhotoIV = [[PhotoImageView alloc]initWithImage:[UIImage imageNamed:rectangleImageName]];
    _addPhotoIV.bgBtn.enabled = NO;
    [self.PhotoBgView addSubview:_addPhotoIV];
    [self.photoIVMuArr addObject:_addPhotoIV];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickAddPhotoIV)];
    [_addPhotoIV addGestureRecognizer:tap];
    _addPhotoIV.userInteractionEnabled = YES;
    
   
    _PhotoBgView.sd_layout.leftSpaceToView(self,0).rightSpaceToView(self,0).topSpaceToView(_descView,0).heightIs(px(200));
    
    _addPhotoIV.sd_layout.leftSpaceToView(_PhotoBgView,15).widthIs(_addPhotoIV.image.size.width).heightIs(_addPhotoIV.image.size.height).centerYEqualToView(_PhotoBgView);
}
#pragma mark - 添加新的照片
-(void)clickAddPhotoIV{
    ICLog(@"clickAddPhotoBtn");
    [self choosePhoto];
    
}
-(void)addNewPhotoIV:(UIImage *)newImage{
    
    PhotoImageView *iv = [[PhotoImageView alloc]init];
    iv.userInteractionEnabled = YES;
    iv.image = newImage;
    [self.PhotoBgView addSubview:iv];
    
    if (self.photoIVMuArr.count > 0) {
        [self.photoIVMuArr insertObject:iv atIndex:1];
        self.PhotoBgView.contentSize=CGSizeMake(self.photoIVMuArr.count * 83 + 30 - 3, 0);
    }
    
    ICLog(@"%ld",self.photoIVMuArr.count);
    
}
//重新计算Frame
- (void)setupPhotoIVFrame
{
    CGFloat btnWidth = 80;
    CGFloat btnHeight = 80;
    CGFloat btnX = px(30);
    CGFloat btnY = 0;
    
    [self.photos removeAllObjects];
    
    
    for (int i = 0; i < self.photoIVMuArr.count; i++) {
        // 行号
        
     PhotoImageView *iv = self.photoIVMuArr[i];
        
        iv.sd_layout.leftSpaceToView(_PhotoBgView,btnX+((btnWidth) + 3)*i).widthIs(btnWidth).topSpaceToView(_PhotoBgView,btnY).heightIs(btnHeight);
        
        iv.bgBtn.tag = i;
        
        UIImage *image  = iv.image;
        if (iv.bgBtn.tag) {//不是添加IV
            [self.photos addObject:image];
            [iv.bgBtn addTarget:self action:@selector(imageClick:) forControlEvents:UIControlEventTouchUpInside];
        }
        
    }
}
#pragma mark  放大系统图片
- (void)imageClick:(UIButton *)btn
{
//    SDPhotoBrowser *photoBrowser = [SDPhotoBrowser new];
//    photoBrowser.delegate = self;
//    
//    photoBrowser.hasAddButton = YES;
//    photoBrowser.hideReverse = YES;
//    photoBrowser.currentImageIndex = btn.tag - 1;// 标记点击的是哪一张图片
//    photoBrowser.hiddenDeleteBtn = NO;
//    
//    photoBrowser.imageCount = self.photos.count;
//    
//    photoBrowser.sourceImagesContainerView = self.PhotoBgView;
//    
//    [photoBrowser show];
    
    NSLog(@"点击放大系统图片");
    
}
#pragma mark - 选择图片
-(void)choosePhoto{
    [self endEditing:YES];
    
    KJUPLOAD_IMAGE.sheetStyle = ActionSheetStyleSystem;
    KJUPLOAD_IMAGE.isPopView = NO;
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:nil
                                                       delegate:nil
                                              cancelButtonTitle:@"取消"
                                         destructiveButtonTitle:nil
                                              otherButtonTitles:@"相册", @"拍照", nil];
    KJUPLOAD_IMAGE.sheet = sheet;
    KJUPLOAD_IMAGE.allowsEditing = YES;
    [KJUPLOAD_IMAGE showActionSheetInFatherViewController:[self viewController] delegate:self];
}

//实现代理方法即可
#pragma mark - KJUploadImageDelegate
- (void)uploadImageToServerWithImage:(UIImage *)image pathStr:(NSString *)pathStr{
    //添加新的照片
    [self addNewPhotoIV:image];
    //设置frame
    [self setupPhotoIVFrame];
}

#pragma mark - lazy
-(NSMutableArray *)photoIVMuArr{
    if (!_photoIVMuArr) {
        _photoIVMuArr = [NSMutableArray array];
    }
    return _photoIVMuArr;
}

- (NSMutableArray *)photos{
    if (!_photos) {
        _photos = [NSMutableArray array];
    }
    return _photos;
}

#pragma mark  SDPhotoBrowserDelegate

//// 返回临时占位图片（即原来的小图）
//- (UIImage *)photoBrowser:(SDPhotoBrowser *)browser placeholderImageForIndex:(NSInteger)index
//{
//    return self.photos[index];
//}

- (void)deletePhotoForIndex:(NSInteger)index
{
    
    UIImageView *imageView = self.photoIVMuArr[index + 1];
    [imageView removeFromSuperview];
    
    [self.photoIVMuArr removeObjectAtIndex:index + 1];
    
    ICLog(@"%ld",self.photoIVMuArr.count);
    
    [self setupPhotoIVFrame];
    
    self.PhotoBgView.contentSize = CGSizeMake(self.photoIVMuArr.count * 83 + 30 - 3, 0);
    
}

-(void)selectActioin
{
    if (self.selectBlock) {
    
        self.selectBlock();
    }
}


-(void)textFiledEditDidChanged:(NSNotification *)obj{
    UITextField *textField = (UITextField *)obj.object;
    
    [textField textField:textField maxZhHansStrLength:30];

}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if ([string isEqualToString:@""]) {
        return YES;
    }
    
    if (![NSString stringContainsEmoji:string]) {
        return NO;
    }
    return YES;
}


-(void)dealloc{
    
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}


@end
