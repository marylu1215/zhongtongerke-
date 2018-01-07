//
//  KJConst.m
//  百思不得姐
//
//  Created by kouhanjin on 16/2/25.
//  Copyright © 2016年 khj. All rights reserved.
//

#import <UIKit/UIKit.h>

NSString *const kUserCookie = @"kUserCookie";
NSString *const kExpiresDate = @"expiresDate";

//******************  腾讯云存储*************************/
NSString *const kMagAPPID = @"10064982";
NSString *const kMagSecretID = @"AKIDtqoUez6Q9b1tQPbawHRDMoVNmWcJieQ5";
NSString *const kMagSecretKey = @"BmNBciLYAfMU86esvVJjVC1nmDHFFmNU";
NSString *const kPersistenceId = @"magicfinger";

/** 用户登录数据 */
NSString *const loginData = @"ic_login_data";

/** tabbar图片名字 */
NSString *const homeImageName = @"gongzuo";
NSString *const homeSelectedImageName = @"gongzuoSel";

NSString *const msgImageName = @"xiaoxi";
NSString *const msgSelectedImageName = @"xiaoxiSel";

NSString *const mfCloudImageName = @"qiaoshou";
NSString *const mfCloudSelectedImageName = @"qiaoshouSel";

NSString *const mineImageName = @"geren";

NSString *const mineSelectedImageName = @"gerenSel";

NSInteger const remarkMaxLength = 200;

/** 手机号位数 */
NSInteger const telMaxLength = 11;

/** QQ号位数 */
NSInteger const QQMaxLength = 12;

/** 身份证位数 */
NSInteger const IDCardMaxLength = 18;

/** 密码位数 */
NSInteger const pwdMaxLength = 20;

/** 验证码位数 */
NSInteger const codeMaxLength = 4;

/** 名字最大位数 */
NSInteger const nameMaxLength = 5;

/** 科目最大位数 */
NSInteger const subjectMaxLength = 8;

/** 职位最大位数 */
NSInteger const jobMaxLength = 8;

/** 简介最大位数 */
NSInteger const synopsisMaxLength = 500;

/** 坍落度最大位数 */
NSInteger const slumpMaxLength = 5;

/** 方量最大位数 */
NSInteger const quantityMaxLength = 20;

/** 金额最大位数 */
NSInteger const amountMaxLength = 8;

/** 银行位数 */
NSInteger const bankMaxLength = 15;

/** 银行卡号位数 */
NSInteger const bankcardMaxLength = 20;

/** 按钮高度 */
NSInteger const btnHeight = 44;

/** 导航栏高度 */
NSInteger const navHeight = 64;

/** 租赁公司留言通知 */
NSString *const companyWordNoti = @"companyWord";

/** 底部视图高度 */
NSInteger const bottomViewH = 50;

/** 底部视图出现时间 */
CGFloat const bottomDuration = 0.25;


/******************* 接口相关 **************************/
//** 版本更新 */
NSString *const versionUpDateUrl  =  @"";

//** 上传图片 */
NSString *const upLoadPhotoUrl = @"/api/auth/upload/img";

//** 个人中心 */
//** 获取个人资料 */
NSString *const getUserInfoUrl = @"/app/user/getUserInfo";
//** 积分记录 */
NSString *const getJifenRecordUrl = @"/Jifen/record";

//** 修改密码 */
NSString *const updatePwdUrl = @"/Login/modify_psd";
//** 找回密码(重置密码) */
NSString *const resetPwdUrl = @"";
//** 验证手机验证码 */
NSString *const validatorResetPwdCodeUrl = @"";
//** 注册 */
NSString *const registUrl = @"/Login/phone_regist";
//** 获取验证码*/
NSString *const getRegisterCodeUrl = @"/Login/message";
//** 登录 */
NSString *const loginUrl = @"/Login/login";
//** 用户忘记密码 */
NSString *const forget_psdLoginUrl = @"/Login/forget_psd";
//**第三方登录 */
NSString *const getPartyweixinUrl = @"/Party/weixin";

//** 家庭成员档案添加*/
NSString *const updateUserInfoUrlUrl = @"/Party/addfamily";
//** 用户基本资料显示*/
NSString *const partySelUrl = @"/Party/sel";
//**家庭成员档案显示 */
NSString *const getPartyFamily = @"/Party/family";
//**家庭成员档案显示  家庭成员健康列表*/
NSString *const getPartyFamily_jk = @"/Party/family_jk";
//**用户基本资料修改*/
NSString *const savePartyData = @"/Party/savedata";
//**用户基本资料添加*/
NSString *const getPartyData = @"/Party/data";
//**用户修改个人资料或者完善个人资料得积分*/
NSString *const getUserinfo_jfParty = @"/Party/userinfo_jf";
//**用户修改头像和用户设置*/
NSString *const getUser_szParty = @"/Party/user_sz";
//**我的服务*/
NSString *const getMy_serviceParty = @"/Party/my_service";
//**根据用户ID 查询个人资料*/
NSString *const getPartyuser_info = @"/Party/user_info";

//**我的问诊*/
NSString *const getMyAskingData = @"/Party/my_asking";

//** 问诊 */
//**所有科室*/
NSString *const getPartyDepartment = @"/Party/department";
//**查询科室下面所有医生*/
NSString *const searchPartyDepartment = @"/Party/searchDepartment";
//**意见收集*/
NSString *const FeedbackParty = @"/Party/feedback";
//**用户收藏文章列表*/
NSString *const collectionParty = @"/Party/collection";
//**搜索医生或者科室*/
NSString *const searchDoctorParty = @"/Party/searchDoctor";
//**名医会诊_医生详情*/
NSString *const getDoctor_details = @"/Party/doctor_details";
//**所有医院*/
NSString *const getHospitalParty = @"/Party/hospital";

//**用户健康史添加*/
NSString *const submitUser_jksParty = @"/Party/user_jks";
//**用户健康史显示*/
NSString *const getUser_jksParty = @"/Party/jks_list";
//**用户健康史修改*/
NSString *const savejksParty = @"/Party/savejks";
//**名医会诊_问诊首页*/
NSString *const askingParty = @"/Party/asking";
//**名医会诊_问诊_患者好评*/
NSString *const getPraiseParty = @"/Party/praise";
//**名医会诊列表和详情*/
NSString *const getActivityParty = @"/Party/activity";
//**语音急诊用户提问*/
NSString *const getVoiceParty = @"/Party/voice";
//**院后指导*/
NSString *const getGuidanceParty = @"/Party/guidance";
//**私人医生*/
NSString *const getPrivateDoctorParty = @"/Party/privateDoctor";
//**电话咨询*/
NSString *const getPartytel = @"/Party/tel";
//**打赏*/
NSString *const getPartyGift = @"/Party/gift";
//**主题活动-活动介绍*/
NSString *const getPackageParty = @"/Party/package";
//** 科普 */
//**儿童安全指南 新闻列表显示 */
NSString *const getBabySecurityScience = @"/Science/babySecurity";
//**儿童用药指南 新闻列表显示 */
NSString *const getbabyMedicationScience = @"/Science/babyMedication";
//**健康咨询列表显示 */
NSString *const gethealthScience = @"/Science/health";
//**热门专家咨询详情 */
NSString *const getvoice_detailsParty = @"/Party/voice_details";
//**热门专家咨询点赞*/
NSString *const getvoice_numParty = @"/Party/voice_num";

//**视频列表显示 */
NSString *const getVideoScience = @"/Science/video_list";
//**热点话题列表显示 */
NSString *const getHotScience = @"/Science/hot";
//**文章详情查看 */
NSString *const getXiangQingScience = @"/Science/xiangqing";
//**用户收藏文章 */
NSString *const scwzParty = @"/Party/scwz";
//**用户收藏视频列表 */
NSString *const scVideo_listParty = @"/Party/video_list";
//**用户收藏视频*/
NSString *const scspParty = @"/Party/scsp";

//**论坛 */
//**标题列表显示 */
NSString *const getForumTitle = @"/Forum/title";
//** 全部页面列表 */
NSString *const getAllForum = @"/Forum/all";
//**所有热门群组列表显示 */
NSString *const getHotqzForum = @"/Forum/hotqz";
//**所有推荐话题 列表显示 */
NSString *const getAllTopicForum = @"/Forum/all_topic";
//**点击群组查看属于这个群组的帖子列表 */
NSString *const getQz_tzForum = @"/Forum/qz_tz";
//**所有回复 */
NSString *const getAllJchfForum = @"/Forum/jchf";
//**帖子详情 */
NSString *const gettzxqForum = @"/Forum/tzxq";
//**活动标题到教育标题页面话题列表和群组列表的显示*/
NSString *const getActivityForum = @"/Forum/activity";
//**用户回复帖子*/
NSString *const setUserForum = @"/Forum/userhf";
//**用户给评论点赞*/
NSString *const sendYhdzForum = @"/Forum/yhdz";
//**发帖*/
NSString *const sendUser_ftForum = @"/Forum/user_ft";

//**首页 */
//**轮播图 */
NSString *const getPlayParty = @"/Party/play";
//**用户每日签到 */
NSString *const signJifen = @"/Jifen/sign";
//**热门专家咨询，精品热帖，热门科普 */
NSString *const getHomeAllForum = @"/HomePage/index";
//**热门专家咨询更多*/
NSString *const getHot_detailsParty = @"/Party/hot_details";
//**健康评估测试类型*/
NSString *const getcheshi_typ = @"/HomePage/cheshi_type";
//**健康评估测试题目*/
NSString *const getHomePagecheshi = @"/HomePage/cheshi";
//**健康评估测试题提交后的答案评估*/
NSString *const getPingguHomePage = @"/HomePage/pinggu";
//**微信支付*/
NSString *const getWxpay = @"/Wxpay/pays";
//**给专家评论*/
NSString *const getdoctor_commentParty = @"/Party/doctor_comment";
//**身高测试*/
NSString *const height_test = @"s=/Admin/HomePage/shengao";

