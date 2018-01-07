//
//  KJConst.h
//  百思不得姐
//
//  Created by kouhanjin on 16/2/25.
//  Copyright © 2016年 khj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Masonry.h>


#define jsonMsg(json) ( [json[@"msg"] isEqualToString:@"ok"])

#define jsonCode(json) ([json[@"code"] integerValue] == 1)

#define isIOS10 ([[UIDevice currentDevice].systemVersion floatValue] >= 10.0)
#define dicTypeJson(json)  [json[@"data"] isKindOfClass:[NSDictionary class]]

#define kIntToString(num) [NSString stringWithFormat:@"%ld",num]

#define kSwitchKey @"switchKey"


/** 手机号位数 */
UIKIT_EXTERN NSInteger const telMaxLength;

/** QQ号位数 */
UIKIT_EXTERN NSInteger const QQMaxLength;

/** 身份证位数 */
UIKIT_EXTERN NSInteger const IDCardMaxLength;

/** 密码位数 */
UIKIT_EXTERN NSInteger const pwdMaxLength;

/** 验证码位数 */
UIKIT_EXTERN NSInteger const codeMaxLength;

/** 名字最大位数 */
UIKIT_EXTERN NSInteger const nameMaxLength;


/** 简介最大位数 */
UIKIT_EXTERN NSInteger const synopsisMaxLength;



/** 金额最大位数 */
UIKIT_EXTERN NSInteger const amountMaxLength;

/** 银行位数 */
UIKIT_EXTERN NSInteger const bankMaxLength;

/** 银行卡号位数 */
UIKIT_EXTERN NSInteger const bankcardMaxLength;

/** 按钮高度 */
UIKIT_EXTERN NSInteger const btnHeight;

/** 导航栏高度 */
UIKIT_EXTERN NSInteger const navHeight;



/** 底部视图高度 */
UIKIT_EXTERN NSInteger const bottomViewH;

/** 底部视图出现时间 */
UIKIT_EXTERN CGFloat const bottomDuration;


/******************* 接口相关 **************************/
//** 版本更新 */
UIKIT_EXTERN  NSString *const versionUpDateUrl;
//** 上传图片 */
UIKIT_EXTERN  NSString *const upLoadPhotoUrl;
//** 个人中心 */
//** 家庭成员档案显示 */
UIKIT_EXTERN  NSString *const getPartyFamily;
//** 获取个人资料 */
UIKIT_EXTERN  NSString *const getUserInfoUrl;
//** 积分记录 */
UIKIT_EXTERN NSString *const getJifenRecordUrl;

//** 修改密码 */
UIKIT_EXTERN  NSString *const updatePwdUrl;
//** 找回密码(重置密码) */
UIKIT_EXTERN  NSString *const resetPwdUrl;
//** 验证手机验证码 */
UIKIT_EXTERN  NSString *const validatorResetPwdCodeUrl;

//** 注册 */
UIKIT_EXTERN  NSString *const registUrl;
//** 获取验证码 */
UIKIT_EXTERN  NSString *const getRegisterCodeUrl;
//** 登录 */
UIKIT_EXTERN  NSString *const loginUrl;
//** 用户忘记密码 */
UIKIT_EXTERN  NSString *const forget_psdLoginUrl;
//**第三方登录 */
UIKIT_EXTERN NSString *const getPartyweixinUrl;
//** 家庭成员档案添加 */
UIKIT_EXTERN NSString *const updateUserInfoUrlUrl;
//** 家庭成员档案添加*/
UIKIT_EXTERN NSString *const partySelUrl;
//**家庭成员档案显示  家庭成员健康列表*/
UIKIT_EXTERN NSString *const getPartyFamily_jk;
//**用户基本资料修改*/
UIKIT_EXTERN NSString *const savePartyData;
//**用户基本资料添加*/
UIKIT_EXTERN NSString *const getPartyData;
//**用户修改个人资料或者完善个人资料得积分*/
UIKIT_EXTERN NSString *const getUserinfo_jfParty;
//**用户修改头像和用户设置*/
UIKIT_EXTERN NSString *const getUser_szParty;
//**用户修改个人资料或者完善个人资料得积分*/
UIKIT_EXTERN NSString *const getMy_serviceParty;
//**根据用户ID 查询个人资料*/
UIKIT_EXTERN NSString *const getPartyuser_info;
//**我的问诊*/
UIKIT_EXTERN NSString *const getMyAskingData;
//**所有科室*/
UIKIT_EXTERN NSString *const getPartyDepartment;
//**查询科室下面所有医生*/
UIKIT_EXTERN NSString *const searchPartyDepartment;
//**意见收集*/
UIKIT_EXTERN NSString *const FeedbackParty;
//**用户收藏文章列表*/
UIKIT_EXTERN NSString *const collectionParty;
UIKIT_EXTERN NSString *const searchDoctorParty;
//**名医会诊_医生详情*/
UIKIT_EXTERN NSString *const getDoctor_details;
//**所有医院*/
UIKIT_EXTERN NSString *const getHospitalParty;
//**用户健康史添加*/
UIKIT_EXTERN NSString *const submitUser_jksParty;
//**用户健康史显示*/
UIKIT_EXTERN NSString *const getUser_jksParty;
//**用户健康史添加*/
UIKIT_EXTERN NSString *const savejksParty;
//**名医会诊_问诊首页*/
UIKIT_EXTERN NSString *const askingParty;
//**热门专家咨询详情 */
UIKIT_EXTERN NSString *const getvoice_detailsParty;
//**热门专家咨询点赞*/
UIKIT_EXTERN NSString *const getvoice_numParty;
//**名医会诊_问诊_患者好评*/
UIKIT_EXTERN NSString *const getPraiseParty;
//**名医会诊列表和详情*/
UIKIT_EXTERN NSString *const getActivityParty;
//**语音急诊用户提问*/
UIKIT_EXTERN NSString *const getVoiceParty;
//**院后指导*/
UIKIT_EXTERN NSString *const getGuidanceParty;
//**私人医生*/
UIKIT_EXTERN NSString *const getPrivateDoctorParty;
//**电话咨询*/
UIKIT_EXTERN NSString *const getPartytel;
//** 打赏*/
UIKIT_EXTERN NSString *const getPartyGift;
//**主题活动-活动介绍*/
UIKIT_EXTERN NSString *const getPackageParty;
//**儿童安全指南 新闻列表显示 */
UIKIT_EXTERN NSString *const getBabySecurityScience;
//**儿童用药指南 新闻列表显示 */
UIKIT_EXTERN NSString *const getbabyMedicationScience;
//**健康咨询列表显示 */
UIKIT_EXTERN NSString *const gethealthScience;

//**视频列表显示 */
UIKIT_EXTERN NSString *const getVideoScience;
//**热点话题列表显示 */
UIKIT_EXTERN NSString *const getHotScience;
//**文章详情查看 */
UIKIT_EXTERN NSString *const getXiangQingScience;
//**用户收藏文章 */
UIKIT_EXTERN NSString *const scwzParty;
//**用户收藏视频列表 */
UIKIT_EXTERN  NSString *const scVideo_listParty;
//**用户收藏视频*/
UIKIT_EXTERN  NSString *const scspParty;
//**论坛 */
//**标题列表显示 */
UIKIT_EXTERN NSString *const getForumTitle;
//** 全部页面列表 */
UIKIT_EXTERN NSString *const getAllForum;
//**所有热门群组列表显示 */
UIKIT_EXTERN NSString *const getHotqzForum;
//**所有推荐话题 列表显示 */
UIKIT_EXTERN NSString *const getAllTopicForum;
//**点击群组查看属于这个群组的帖子列表 */
UIKIT_EXTERN NSString *const getQz_tzForum;
//**所有回复 */
UIKIT_EXTERN NSString *const getAllJchfForum;
//**帖子详情 */
UIKIT_EXTERN NSString *const gettzxqForum;
//**活动标题到教育标题页面话题列表和群组列表的显示*/
UIKIT_EXTERN NSString *const getActivityForum;
//**用户回复帖子*/
UIKIT_EXTERN NSString *const setUserForum;
//**用户给评论点赞*/
UIKIT_EXTERN NSString *const sendYhdzForum;
//**发帖*/
UIKIT_EXTERN NSString *const sendUser_ftForum;
//**首页 */
//**轮播图 */
UIKIT_EXTERN NSString *const getPlayParty;
//**用户每日签到 */
UIKIT_EXTERN NSString *const signJifen;
//**热门专家咨询，精品热帖，热门科普*/
UIKIT_EXTERN  NSString *const getHomeAllForum;
//**热门专家咨询更多*/
UIKIT_EXTERN NSString *const getHot_detailsParty;
//**健康评估测试类型*/
UIKIT_EXTERN NSString *const getcheshi_typ;
//**健康评估测试题目*/
UIKIT_EXTERN NSString *const getHomePagecheshi;
//**健康评估测试题提交后的答案评估*/
UIKIT_EXTERN NSString *const getPingguHomePage;
//**微信支付*/
UIKIT_EXTERN NSString *const getWxpay;
//**给专家评论*/
UIKIT_EXTERN NSString *const getdoctor_commentParty;


