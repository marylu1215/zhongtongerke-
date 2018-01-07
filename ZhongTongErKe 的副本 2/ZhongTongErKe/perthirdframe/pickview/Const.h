//
//  Const.h
//  AiYuanTai
//
//  Created by cdyqkj on 16/6/23.
//  Copyright © 2016年 sima. All rights reserved.
//

#ifndef Const_h
#define Const_h



#define YYSRGBColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]


#define YYSGlobalColor [UIColor colorWithRed:126/255.0 green:205/255.0  blue:238/255.0 alpha:1]



#define YYSScreenW  [UIScreen mainScreen].bounds.size.width
#define YYSScreenH  [UIScreen mainScreen].bounds.size.height

#define JUDGEISLOGIN if(!TOKEN){\
YYSLoginController *login = [[YYSLoginController alloc] init];\
[self.navigationController pushViewController:login animated:YES];\
return ;\
}

/** 适配*/
#define YYS_X_FROM6(x) ([UIScreen mainScreen].bounds.size.width/375.0 * (x))
//获取token
#define TOKEN [[NSUserDefaults standardUserDefaults] objectForKey:@"token"]
//域名
#define BASE_URL_TEST @"http://zy.b6ss.com/public/"

//图片域名
#define BASE_PICTURE_URL [NSString stringWithFormat:@"%@uploads",BASE_URL_TEST]
//登录URL
#define LOGIN_URL [NSString stringWithFormat:@"%@/login",BASE_URL_TEST]
//注册URL
#define REGISTER_URL [NSString stringWithFormat:@"%@/register",BASE_URL_TEST]

//个人资料URL
#define ZILIAO_URL [NSString stringWithFormat:@"%@/getUser",BASE_URL_TEST]


//获取验证码URL
#define SEND_CODE_URL [NSString stringWithFormat:@"%@/getMessage",BASE_URL_TEST]

//获取游戏类型URL
#define GET_GAME_TYPE_URL [NSString stringWithFormat:@"%@/category",BASE_URL_TEST]


//密码重置URL
#define FORGET_PASSWORD_URL [NSString stringWithFormat:@"%@/editMessage",BASE_URL_TEST]
//密码找回URL
#define MODIFY_PASSWORD_URL [NSString stringWithFormat:@"%@/ModifyPass",BASE_URL_TEST]
//首页轮播图URL
#define HOME_ICON_URL [NSString stringWithFormat:@"%@/home",BASE_URL_TEST]

//首页新闻列表URL
#define HOME_NEWS_LISTS_URL [NSString stringWithFormat:@"%@/home",BASE_URL_TEST]

//附近的人URL
#define NEAR_PEOPLE_URL [NSString stringWithFormat:@"%@/people",BASE_URL_TEST]

//附近的店铺URL
#define NEAR_SHOP_URL [NSString stringWithFormat:@"%@/nearby_store",BASE_URL_TEST]
//店铺URL
#define SHOP_ICON_URL [NSString stringWithFormat:@"%@/store",BASE_URL_TEST]
//房间列表URL
#define SHOP_LISTS_URL [NSString stringWithFormat:@"%@/room",BASE_URL_TEST]

//上传头像URL
#define UPDATE_ICON_URL [NSString stringWithFormat:@"%@/head",BASE_URL_TEST]
//修改名称URL
#define UPDATE_NAME_URL [NSString stringWithFormat:@"%@/apellation",BASE_URL_TEST]
//修改个性签名URL
#define UPDATE_GEXIN_URL [NSString stringWithFormat:@"%@/sign",BASE_URL_TEST]
//修改性别URL
#define UPDATE_SEX_URL [NSString stringWithFormat:@"%@/sex",BASE_URL_TEST]
//修改擅长类型URL
#define UPDATE_SHANCHANG_URL [NSString stringWithFormat:@"%@/judgeSki",BASE_URL_TEST]

//密码修改URL
#define EXCHGE_PWD_URL [NSString stringWithFormat:@"%@/pass",BASE_URL_TEST]
//获取积分和余额URL
#define GET_YUE_JIFEN_URL [NSString stringWithFormat:@"%@/secret",BASE_URL_TEST]
//用户反馈URL
#define GIVE_ADVICE_URL [NSString stringWithFormat:@"%@/feedback",BASE_URL_TEST]

//提现URL
#define TIXIAN_URL [NSString stringWithFormat:@"%@/cash",BASE_URL_TEST]

//签到URL
#define QIANDAO_URL [NSString stringWithFormat:@"%@/report",BASE_URL_TEST]
//附近预约URL
#define YUYUE_URL [NSString stringWithFormat:@"%@/about",BASE_URL_TEST]
//获取所有等级URL
#define GET_ALL_LEVEL_URL [NSString stringWithFormat:@"%@/level",BASE_URL_TEST]
//新建约局URL
#define CREAT_YUJU_URL [NSString stringWithFormat:@"%@/build",BASE_URL_TEST]
//历史对局URL
#define HISTORY_YUJU_URL [NSString stringWithFormat:@"%@/list",BASE_URL_TEST]

//检测积分支付URL
#define CHECK_JIFEN_URL [NSString stringWithFormat:@"%@/action_int",BASE_URL_TEST]

//积分支付URL
#define PAY_JIFEN_URL [NSString stringWithFormat:@"%@/add_inter",BASE_URL_TEST]
//积分支付新建约局
#define JIFEN_CREAT_URL [NSString stringWithFormat:@"%@/integral_about",BASE_URL_TEST]

//详情对局URL
#define DETAIL_YUEJU_URL [NSString stringWithFormat:@"%@/bureau",BASE_URL_TEST]

//加入对局URL
#define ADD_YUEJU_URL [NSString stringWithFormat:@"%@/addAbout",BASE_URL_TEST]

//开始对局URL
#define BEGIN_YUEJU_URL [NSString stringWithFormat:@"%@/begin",BASE_URL_TEST]

//退出对局URL
#define EXIT_YUEJU_URL [NSString stringWithFormat:@"%@/out",BASE_URL_TEST]
//解散对局URL
#define DISMISS_YUEJU_URL [NSString stringWithFormat:@"%@/dissolution",BASE_URL_TEST]
//结束对局URL
#define END_YUEJU_URL [NSString stringWithFormat:@"%@/complete",BASE_URL_TEST]
//好友列表
#define FRIENDSLIST_URL [NSString stringWithFormat:@"%@/friend",BASE_URL_TEST]
//获取个人信息
#define GET_INFO_URL [NSString stringWithFormat:@"%@/personal",BASE_URL_TEST]
//拜师收徒
#define ADD_MASTE_URL [NSString stringWithFormat:@"%@/add_master",BASE_URL_TEST]
//师徒通过与删除
#define PASS_DETELE_URL [NSString stringWithFormat:@"%@/pass_master",BASE_URL_TEST]
//师徒列表
#define SHITU_LIST_URL [NSString stringWithFormat:@"%@/master",BASE_URL_TEST]
//师徒列表
#define MY_YU_JU_URL [NSString stringWithFormat:@"%@/me_about",BASE_URL_TEST]
//评价队友
#define EVALUATE_URL [NSString stringWithFormat:@"%@/evaluate",BASE_URL_TEST]
//举报玩家
#define JUBAO_URL [NSString stringWithFormat:@"%@/accusation",BASE_URL_TEST]

//取消支付
#define CANCEL_PAY_URL [NSString stringWithFormat:@"%@/del_pay",BASE_URL_TEST]
#endif /* Const_h */
