//
//  SSConfigDefine.h
//  ZhongTongErKe
//
//  Created by Claf on 17/4/28.
//  Copyright © 2017年 Claf. All rights reserved.
//

#ifndef SSConfigDefine_h
#define SSConfigDefine_h

#define kBaseWidth 375
#define kBaesHeight 667
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kScreenWidthScale kScreenWidth / kBaseWidth
#define kScreenHeightScale kScreenHeight / kBaesHeight

#define MAIN_COLOR [UIColor colorWithRed:(float)63/255.0 green:(float)230/255.0 blue:(float)216/255.0 alpha:1.000];//主色调

#define BACKGROUND_COLOR [UIColor colorWithRed:(float)241/255.0 green:(float)240/255.0 blue:(float)240/255.0 alpha:1.000]//背景颜色

#define LINE_COLOR [UIColor colorWithRed:(float)233/255.0 green:(float)233/255.0 blue:(float)233/255.0 alpha:1.000]//分割线颜色

#define TITLE_COLOR [UIColor colorWithRed:(float)51/255.0 green:(float)51/255.0 blue:(float)51/255.0 alpha:1.000]//正文字体颜色

#define REMARK_COLOR [UIColor colorWithRed:(float)170/255.0 green:(float)170/255.0 blue:(float)170/255.0 alpha:1.000]//最灰的颜色

#define S_COLOR [UIColor colorWithRed:(float)250/255.0 green:(float)133/255.0 blue:(float)137/255.0 alpha:1.000]//红色提示颜色





#endif /* SSConfigDefine_h */
