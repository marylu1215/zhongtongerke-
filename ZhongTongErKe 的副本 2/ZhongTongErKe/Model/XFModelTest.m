//
//  XFModelTest.m
//  MagicFinger
//
//  Created by xufeng on 16/5/20.
//  Copyright © 2016年 zeenc. All rights reserved.
//

#import "XFModelTest.h"


@implementation XFModelTest
+ (instancetype)sharedModelTest
{
    static XFModelTest *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[XFModelTest alloc] init];
    });
    return instance;
}

-(instancetype)init{
    if (self = [super init]) {
        
    }
    return self;
}

//** 今日课程 */
- (NSDictionary *)todayCoursesDict{
    NSDictionary *dict = @{
                           @"todayCourses" :@[
                                   
                                   @{
                                       @"title":@"PT-物理治疗",
                                       @"buyNum":@"已有254人购买"
                                    },
                                   @{
                                       @"title":@"PT-物理治疗",
                                       @"buyNum":@"已有254人购买"
                                    },
                                   @{
                                       @"title":@"PT-物理治疗",
                                       @"buyNum":@"已有254人购买"
                                    }
                                   
                                   ]
                           
                               };
    return dict;
    
}
//** 健康课程 */
-(NSDictionary *)healthCoursesDict
{
    NSDictionary *dict = @{
                           @"healthCourses" :@[
                                   
                                   @{
                                       @"title":@"PT-物理治疗",
                                       @"buyNum":@"已有254人购买",
                                       @"courseImageName":hhzlIconImageName,
                                       @"courseUrl":@""
                                       },
                                   @{
                                       @"title":@"OT-作业治疗",
                                       @"buyNum":@"已有254人购买",
                                       @"courseImageName":rzpdIconImageName,
                                       @"courseUrl":@""
                                       },
                                   @{
                                       @"title":@"ST-语言治疗",
                                       @"buyNum":@"已有254人购买",
                                       @"courseImageName":rzxlIconIconImageName,
                                       @"courseUrl":@""
                                    }
                                   
                                   ]
                           
                           };
    return dict;

}

-(NSDictionary *)courseDetailsDict
{
    NSDictionary *dict = @{
                           @"CourseDetails" :
                                   
                                   @{
                                       @"title":@"PT-物理治疗",
                                       @"buyNum":@"已有254人购买",
                                       @"courseImageName":hhzlIconImageName,
                                       @"courseUrl":@"",
                                       @"adaptiveAge":@"0-12岁",
                                       @"frequency":@"1-2节每天",
                                       @"period":@"30分钟",
                                       @"form":@"一对一",
                                       @"goal":@"促进孩子的功能发展，改善功能,促进孩子的功能发展，改善功能,促进孩子的功能发展，改善功能,促进孩子的功能发展，改善功能",
                                       @"primaryArray":@[@"先天性发育迟缓，脑积水，脑积水，脑积水，脑积水，脑积水，脑积水，脑积水，脑积水，脑积水",@"平衡功能差",@"脑性瘫痪"],
                                       @"state":@"已参与"
                                    }
                                   
                           };
    return dict;

}
//** 医生列表 */
- (NSDictionary *)doctorListDict
{
    NSDictionary *dict = @{
                           @"doctors" :@[
                                   
                                   @{
                                       @"headUrl":@"",
                                       @"name":@"熊悠哈",
                                       @"administrative":@"内分泌科主任",
                                       @"hospital":@"成都西南儿童医院",
                                       @"rankArray":@[@"中华医学会儿科专委会内分泌与遗传代谢专业委员",@"中华预防医学会小儿内分泌学组委员",@"中国医师协会秦春期医学学组委员"],
                                        @"level":@"内分泌科主任",
                                       @"skill":@"各种原因导致的儿童矮小症，肥胖症，性早熟(女孩和男孩乳房早熟和性早熟)，青春期发育迟缓或不发育，行啊与不良等"
                                       },
                                   @{
                                       @"headUrl":@"",
                                       @"name":@"熊悠哈",
                                       @"administrative":@"内分泌科主任",
                                       @"hospital":@"成都西南儿童医院",
                                       @"rankArray":@[@"中华医学会儿科专委会内分泌与遗传代谢专业委员"],
                                       @"level":@"内分泌科主任",
                                       @"skill":@"各种原因导致的儿童矮小症，肥胖症，性早熟(女孩和男孩乳房早熟和性早熟)，青春期发育迟缓或不发育，行啊与不良等"
                                       }

                                   
                                   ]
                           
                           };
    return dict;
}

- (NSDictionary *)hospitalDetailDict
{
    
    NSDictionary *dict = @{
                           @"hospitalDetai" :
                                   
                                   @{
                                       @"title":@"四川大学华西医学院",
                                       @"subTitle":@"West China Hospital of Sichuan University",
                                       @"nature":@"综合医院",
                                       @"insurance":@"医保",
                                       @"description":@"前身是英国、美国、加拿大等国的基督教会1892年在成都建立存仁、仁济医院；1914年私立华西协合大学成立医学院，将其作为教学医院。经过113年的建设，特别是改革开放以来的飞速发展，四川大学华西临床医学院/华西医院已成为学科门类齐全、师资力量雄厚、医疗技术精湛、诊疗设备先进、科研实力强大的综合性研究型临床医学院及教学医院；1990年被卫生部评定为三级甲等医院。是中国高等医学教育重要基地，西南地区疑难重症诊疗中心、医学科学研究中心，国家循证医学中心，国家新药、中药安全性评价中心。华西医院是中国规模庞大的医院之一，是中国西部疑难危急重症的国家级诊疗中心，在复旦大学2009年度和2010年度中国最佳专科声誉和最佳医院排行榜上，连续两年名列全国第二。",
                                       @"honInArray":@[@"西南地区疑难重症诊疗中心、医学科学研究中心，国家循证医学中心，国家新药、中药安全性评价中心。华西医院是中国规模庞大的医院之一，是中国西部疑难危急重症的国家级诊疗中心",@"1990年被卫生部评定为三级甲等医院。"],
                                       @"adress":@"四川省成都市武侯区国学巷37号"
                                 }
                                   
                           };
    return dict;

}

//** 健康评估 */
- (NSDictionary *)assessmentDict
{
    NSDictionary *dict = @{
                           @"assessments" :@[
                                   
                                   @{
                                       @"titleUrl":@"intelligence",
                                       @"title":@"儿童智力测试",
                                    },
                                   @{
                                       @"titleUrl":@"nutrition",
                                       @"title":@"儿童睡眠测试",
                                    },
                                   @{
                                       @"titleUrl":@"sleep",
                                       @"title":@"儿童营养测试",
                                    }
                                   
                                   ]
                           
                           };
    return dict;

}

//** 健康史 */
- (NSDictionary *)healthHistoryListDict
{
    NSDictionary *dict = @{
       @"healthHistorys" :@[
               
               @{
                @"title":@"饮食习惯",
                 @"subTitle":@"一般情况下,您平均每周吃下列食物?每天大概吃多少?",
                 @"problems":@[
                        @{
                           @"title":@"谷类(大米,面食,杂粮)",
                      @"answerArray":@[@"5-7天",@"3-4天",@"1-2天",@"<1天或不吃"]
                         },
                        @{
                            @"title":@"肉类(猪,牛,羊,家禽)",
                            @"answerArray":@[@"5-7天",@"3-4天",@"1-2天",@"<1天或不吃"]
                          },
                        @{
                            @"title":@"新鲜蔬菜和水果",
                            @"answerArray":@[@"5-7天",@"3-4天",@"1-2天",@"<1天或不吃"]
                          },
                        @{
                            @"title":@"鱼类或其他水产品",
                            @"answerArray":@[@"5-7天",@"3-4天",@"1-2天",@"<1天或不吃"]
                            },
                        @{
                            @"title":@"甜食(甜点、蛋糕、糖果等)",
                            @"answerArray":@[@"5-7天",@"3-4天",@"1-2天",@"<1天或不吃"]
                            },
                        @{
                            @"title":@"油炸食品",
                            @"answerArray":@[@"5-7天",@"3-4天",@"1-2天",@"<1天或不吃"]
                            },
                        @{
                            @"title":@"腌渍、熏类食品",
                            @"answerArray":@[@"5-7天",@"3-4天",@"1-2天",@"<1天或不吃"]
                            },
                        @{
                            @"title":@"你的口味和周围的人相比如何",
                            @"answerArray":@[@"很淡",@"略淡",@"相同",@"略咸",@"很咸"]
                            }
                        
                        
                        ]
               
                   },
               @{
                   @"title":@"吸烟情况",
                   @"problems":@[
                           @{
                               @"title":@"您吸烟吗",
                               @"answerArray":@[@"吸烟",@"不吸",@"已戒",]
                               },
                           @{
                               @"title":@"烟龄",
                               @"answerArray":@[@"1年以下",@"5年以上",@"10年以上",@"15年以上"]
                               },
                           
                           ]
                   
                   },
             
               @{
                   @"title":@"饮酒情况",
                   @"problems":@[
                           @{
                               @"title":@"您喝酒吗",
                               @"answerArray":@[@"喝酒",@"不喝酒",@"已戒",]
                               },
                           ]
                   
                   },

               @{
                   @"title":@"体力活动及体育锻炼",
                   @"problems":@[
                           @{
                               @"title":@"您的工作性质",
                               @"answerArray":@[@"静坐为主",@"轻度活动",@"体力劳动",]
                               },
                           @{
                               @"title":@"你上班的交通",
                               @"answerArray":@[@"步行或骑车",@"公交车或班车",@"自驾车"]
                               },
                           @{
                               @"title":@"干家务活",
                               @"answerArray":@[@"从不",@"偶尔",@"经常"]
                               },
                           @{
                               @"title":@"每周参加持续20分钟的体育锻炼",
                               @"answerArray":@[@"从不",@"偶尔",@"经常"]
                               },
                           
                           ]
                   
                   }
               
               ]
       
            };
    return dict;
}

//** 疾病 */
-(NSDictionary *)diseaseListDict
{
    NSDictionary *dict = @{
                   @"healthHistorys" :@[
                           
                   @{
                       @"title":@"高血压病"
                    },
                   @{
                       @"title":@"脑卒中",
                    },
                   @{
                       @"title":@"冠心病"
                    },
                   @{
                       @"title":@"外周血管病",
                    },
                   @{
                       @"title":@"心力衰竭"
                       },
                   @{
                       @"title":@"糖尿病",
                       },
                   @{
                       @"title":@"肥胖症"
                       },
                   @{
                       @"title":@"慢性肾脏疾病",
                    },
                   @{
                       @"title":@"慢性阻塞性肺病",
                       },
                   @{
                       @"title":@"骨质疏松"
                       },
                   @{
                       @"title":@"痛风",
                       },
                   @{
                       @"title":@"恶性肿瘤"
                       },
                   @{
                       @"title":@"风湿免疫性疾病"
                    },
                   @{
                       @"title":@"精神疾病"
                    },
                   @{
                       @"title":@"其他"
                    }
                   
                   ]
                   
                   };
    return dict;

}
//**支付方式*/
- (NSDictionary *)payModleListDict
{
    NSDictionary *dict = @{
                           @"payModles" :@[
                                   
                                   @{
                                       @"imageName":@"图层-2",
                                       @"title":@"支付宝支付",
                                        @"subTitle":@"推荐安装支付宝客户端的用户使用"
                                       },
                                   @{
                                       @"imageName":@"图层-1-fwgm",
                                       @"title":@"微信支付",
                                       @"subTitle":@"推荐安装微信5.0及以上版本的客户使用"                                    }
                                
                                   ]
                           
                           };
    return dict;

}

//**健康任务*/
-(NSDictionary *)healthTaskListDict
{
    NSDictionary *dict = @{
                           @"healthTasks" :@[
                                   
                           @{
                               @"tag":@"资料",
                               @"title":@"完善健康档案",
                               @"condition":@"健康完善任务达到30%",
                               @"integration":@"30积分"
                               },
                           @{
                               @"tag":@"签到",
                               @"title":@"每日签到",
                               @"condition":@"签到成功",
                               @"integration":@"30积分"                                   }
                           
                           ]
                   
                           };
    return dict;
}

@end
