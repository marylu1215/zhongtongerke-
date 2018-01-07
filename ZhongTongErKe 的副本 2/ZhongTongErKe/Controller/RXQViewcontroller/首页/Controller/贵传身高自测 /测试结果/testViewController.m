//
//  testViewController.m
//  ZhongTongErKe
//
//  Created by 研发部 on 2017/9/12.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "testViewController.h"
#import <Masonry.h>
#import "fourLabel.h"
#import "fourbtn.h"
#import "childrenView.h"
#import "childrenbigView.h"
#import "adultbigview.h"
#import "adultview.h"
#import "secondfileView.h"
#import "totalLabel.h"
#import "beizierx.h"
#import "chatlistViewController.h"
#import "chatViewController.h"
#define SCREEN_W  [UIScreen mainScreen].bounds.size.width
#define SCREEN_H  [UIScreen mainScreen].bounds.size.height

@interface testViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)fourLabel *forlabel;
@property(nonatomic,strong)fourbtn *forbtn;

@property(nonatomic,strong)childrenView *childview;

@property(nonatomic,strong)childrenbigView *bigview;

@property(nonatomic,strong)adultbigview *adultbigview;
@property(nonatomic,strong)adultview *adultview;

@property(nonatomic,strong)secondfileView *fiveviewone;
@property(nonatomic,strong)secondfileView *fiveviewtwo;
@property(nonatomic,strong)secondfileView *fiveviewthree;
@property(nonatomic,strong)secondfileView *fiveviewfour;
@property(nonatomic,strong)totalLabel *totalLabel;

@property (strong,nonatomic)beizierx *bezierView;
@property (strong,nonatomic)NSMutableArray *x_names;
@property (strong,nonatomic)NSMutableArray *targets;





@end

@implementation testViewController

/**
 *  X轴值
 */
-(NSMutableArray *)x_names{
    if (!_x_names) {
        _x_names = [NSMutableArray arrayWithArray:@[@"标准身高",@"遗传身高",@"体重",@"BMI"]];
    }
    return _x_names;
}
/**
 *  Y轴值
 */
-(NSMutableArray *)targets{
    if (!_targets) {
        
        NSString *str1 = @"10";
        NSString *str2 = @"30";
        NSString *str3 = @"40";
        NSString *str4 = @"50";
        
        NSInteger num1 = [str1 integerValue];
        NSInteger num2 = [str2 integerValue];
        NSInteger num3 = [str3 integerValue];
        NSInteger num4 = [str4 integerValue];
        
        NSNumber *nub = @(num1);
        NSNumber *nub2 = @(num2);
        NSNumber *nub3 = @(num3);
        NSNumber *nub4 = @(num4);
        
       // NSArray *array = [NSArray arrayWithObjects:num1,num2,num3,num4, nil];
    
        _targets = [NSMutableArray arrayWithArray:@[@20,@50,@20,@40]];
        
        //_targets = [NSMutableArray ar];
        
        _targets = [NSMutableArray arrayWithArray:@[nub,nub2,nub3,nub4]];
    }
    return _targets;
}


//-(NSMutableArray *)targets{
//    if (!_targets) {
//        NSString *str = @"20";
//        //NSNumber *num2 = @20;
//        NSString *str2 = @"40";
//        NSString *str3 = @"50";
//        NSString *str4 = @"60";
////        NSNumber *num3 = @30;
////        NSNumber *num4 = @40;
//        _targets = [NSMutableArray arrayWithArray:@[str,str2,str3,str4]];
//    }
//    return _targets;
//}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"遗传身高自测";
//
    
    
//    @property(nonatomic,strong)NSString *namestr;
//    @property(nonatomic,strong)NSString *sexstr;
//    @property(nonatomic,strong)NSString *yearstr;
//    
//    @property(nonatomic,strong)NSString *babyheightstr;
//    @property(nonatomic,strong)NSString *adultheightstr;
//    
//    @property(nonatomic,strong)NSString *babyweightstr;
//    @property(nonatomic,strong)NSString *bmistr;
    
    
//    @property(nonatomic,strong)NSString *biazhunshengao;
//    @property(nonatomic,strong)NSString *yichuashengao;
//    @property(nonatomic,strong)NSString *weightstr2;
//    @property(nonatomic,strong)NSString *bebei2;
    
   // NSLog(@"targets:%@",self.targets);
    //NSLog(@"righttargets:%@",self.targets2);
    
    
    NSLog(@"年龄:%@",_yearstr);
    NSLog(@"姓别:%@",_sexstr);
    NSLog(@"年纪:%@",_yearstr);
    NSLog(@"宝身高:%@",_babyheightstr);
    NSLog(@"成年人身高:%@",_adultheightstr);
    NSLog(@"宝贝体重:%@",_babyweightstr);
    NSLog(@"bmi:%@",_bmistr);
    NSLog(@"姓名:%@",_namestr);
    
    
    
    _onetableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStyleGrouped];
    _onetableview.delegate = self;
    _onetableview.dataSource = self;
    _onetableview.backgroundColor = BACKGROUND_COLOR;
    _onetableview.separatorColor = [UIColor clearColor];
    _onetableview.showsVerticalScrollIndicator  = NO;
    [self.view addSubview:_onetableview];
    
    
    UIButton *btn = [[UIButton alloc]init];
    btn.backgroundColor = MAIN_COLOR;
    [btn setTitle:[NSString stringWithFormat:@"咨询"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(clickzixun) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.height.mas_equalTo(60);
    }];

}
-(void)clickzixun{
    NSLog(@"咨询");
    chatViewController *chatview = [[chatViewController alloc]init];
    chatview.conversationType = ConversationType_PRIVATE;
    chatview.targetId = @"123";
    chatview.title = @"专家咨询";
    [self.navigationController pushViewController:chatview animated:YES];
//    chatlistViewController *chatlist = [[chatlistViewController alloc]init];
//    [self.navigationController pushViewController:chatlist animated:YES];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
        if (indexPath.section==0) {
            UITableViewCell *cell = [UITableViewCell new];
            cell.selectionStyle = UITableViewCellEditingStyleNone;
        UIImageView *imageview = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"底"]];
        [cell.contentView addSubview:imageview];
        [imageview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.right.mas_equalTo(0);
            make.top.mas_equalTo(0);
            make.height.mas_equalTo(613/2);
        }];
       // int a = 101;
        int b = 102;
            
           // int a = _yearstr;
            NSString *paastr = _babyheightstr;
            
            int a = [paastr intValue];
            
        if (a < b) {
            NSLog(@"输出a < b ");
            _childview = [[childrenView alloc]init];
            NSString *strone = _babyheightstr;
            //NSString *strone = @"123";
            NSString *strtwo = @"cm";
            NSString *heightstr = [NSString stringWithFormat:@"%@%@",strone,strtwo];
            _childview.oneLabel.text = heightstr;
            [imageview addSubview:_childview];
            [_childview mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerX.mas_equalTo(imageview.mas_centerX).multipliedBy(0.4);
                make.bottom.mas_equalTo(imageview.mas_bottom).offset(-10);
                make.height.mas_equalTo(154);
            }];

            _bigview = [[childrenbigView alloc]init];
            [imageview addSubview:_bigview];
            [_bigview mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerX.mas_equalTo(imageview.mas_centerX).multipliedBy(0.8);
                make.bottom.mas_equalTo(imageview.mas_bottom).offset(-10);
                make.height.mas_equalTo(164);
            }];
        }else{
            //NSLog(@"条件不满足");
            
            _bigview = [[childrenbigView alloc]init];
            NSString *strone = _babyheightstr;
            NSString *strtwo = @"cm";
            NSString *heightstr = [NSString stringWithFormat:@"%@%@",strone,strtwo];
            _childview.oneLabel.text = heightstr;
            [imageview addSubview:_bigview];
            [_bigview mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerX.mas_equalTo(imageview.mas_centerX).multipliedBy(0.4);
                make.bottom.mas_equalTo(imageview.mas_bottom).offset(-10);
                make.height.mas_equalTo(164);

            }];
            
            _childview = [[childrenView alloc]init];
            [imageview addSubview:_childview];
            [_childview mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerX.mas_equalTo(imageview.mas_centerX).multipliedBy(0.8);
                make.bottom.mas_equalTo(imageview.mas_bottom).offset(-10);
                make.height.mas_equalTo(154);

            }];
        }
            int c = 160;
            //int b =
            NSString *strone = _adultstr;
            int d = [strone intValue];
        if (d  > c ) {
            _adultbigview = [[adultbigview alloc]init];
            NSString *strone = _adultstr;
            NSString *strtwo = @"cm";
            NSString *adultstr = [NSString stringWithFormat:@"%@%@",strone,strtwo];
            _adultbigview.oneLabel.text =adultstr;
            [imageview addSubview:_adultbigview];
            [_adultbigview mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerX.mas_equalTo(imageview.mas_centerX).multipliedBy(1.2);
                make.bottom.mas_equalTo(imageview.mas_bottom).offset(-10);
                make.height.mas_equalTo(230);
            }];
            
            _adultview = [[adultview alloc]init];
            [imageview addSubview:_adultview];
            [_adultview mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerX.mas_equalTo(imageview.mas_centerX).multipliedBy(1.7);
                make.bottom.mas_equalTo(imageview.mas_bottom).offset(-10);
                make.height.mas_equalTo(215);
            }];
            //return cell;
            
        }else{
//            UITableViewCell *cell = [UITableViewCell new];
//            cell.selectionStyle = UITableViewCellEditingStyleNone;

            _adultview = [[adultview alloc]init];
            NSString *strone = _adultstr;
            NSString *strtwo = @"cm";
            NSString *strcm = [NSString stringWithFormat:@"%@%@",strone,strtwo];
            _adultview.oneLabel.text = strcm;
            [imageview addSubview:_adultview];
            [_adultview mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerX.mas_equalTo(imageview.mas_centerX).multipliedBy(1.2);
                make.bottom.mas_equalTo(imageview.mas_bottom).offset(-10);
                make.height.mas_equalTo(215);
            }];
            
            _adultbigview = [[adultbigview alloc]init];
            [imageview addSubview:_adultbigview];
            [_adultbigview mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerX.mas_equalTo(imageview.mas_centerX).multipliedBy(1.7);
                make.bottom.mas_equalTo(imageview.mas_bottom).offset(-10);
                make.height.mas_equalTo(230);
            }];
                  }
        
        self.forbtn = [[fourbtn alloc]init];
        self.forbtn.topLabel.text = @"宝贝";
        self.forbtn.bottomLabel.text = @"当前身高";
        [cell.contentView addSubview:self.forbtn];
        [self.forbtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(imageview.mas_bottom).offset(1);
            make.centerX.mas_equalTo(imageview.mas_centerX).multipliedBy(0.4);
            make.size.mas_equalTo(CGSizeMake(80, 40));
        }];
        
        fourbtn *fivebtn = [[fourbtn alloc]init];
        
        fivebtn.topLabel.text = @"儿童";
        fivebtn.bottomLabel.text = @"标准身高";
        [cell.contentView addSubview:fivebtn];
        [fivebtn mas_makeConstraints:^(MASConstraintMaker *make) {
             make.top.mas_equalTo(imageview.mas_bottom).offset(1);
            make.centerX.mas_equalTo(imageview.mas_centerX).multipliedBy(0.8);
            //make.size.mas_equalTo(self.forbtn);
            make.size.mas_equalTo(CGSizeMake(80, 40));
        }];
        
        fourbtn *sixbtn = [[fourbtn alloc]init];
        sixbtn.topLabel.text = @"成年后";
        sixbtn.bottomLabel.text = @"遗传身高";
        [cell.contentView addSubview:sixbtn];
        [sixbtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(imageview.mas_bottom).offset(1);
            make.centerX.mas_equalTo(imageview.mas_centerX).multipliedBy(1.2);
            //make.size.mas_equalTo(self.forbtn);
            make.size.mas_equalTo(CGSizeMake(80, 40));
        }];
        
        fourbtn *sevenbtn = [[fourbtn alloc]init];
        sevenbtn.topLabel.text = @"成年后";
        sevenbtn.bottomLabel.text = @"标准身高";
        [cell.contentView addSubview:sevenbtn];
        [sevenbtn mas_makeConstraints:^(MASConstraintMaker *make) {
            //make.centerX.mas_equalTo();
            make.top.mas_equalTo(imageview.mas_bottom).offset(1);
            make.centerX.mas_equalTo(imageview.mas_centerX).multipliedBy(1.7);
            //make.size.mas_equalTo(self.forbtn);
            make.size.mas_equalTo(CGSizeMake(80, 40));
        }];
            return cell;
    }else if (indexPath.section==1){
        UITableViewCell *cell = [UITableViewCell new];
        cell.selectionStyle = UITableViewCellEditingStyleNone;

        UIView *view = [[UIView alloc]init];
        view.backgroundColor =BACKGROUND_COLOR;
        [cell.contentView addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.top.mas_equalTo(30);
            make.right.mas_equalTo(-10);
            make.bottom.mas_equalTo(-10);
        }];
        
        UILabel *label = [[UILabel alloc]init];
        label.textColor = TITLE_COLOR;
        label.text = @"数据状况";
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:16];
        [cell.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(cell.contentView.mas_centerX);
            make.top.mas_equalTo(5);
            make.size.mas_equalTo(CGSizeMake(80, 17));
        }];

        
        _fiveviewone = [[secondfileView alloc]init];
        //_fiveviewone.backgroundColor = [UIColor redColor];
        NSString *strone = _babyheightstr;
        int a = [_babyheightstr intValue];
        int b = 94;
        
        int  c = a - b;
        
        
        NSString  *strtwo = @"cm";
        NSString *babystr = [NSString stringWithFormat:@"%@%@",strone,strtwo];
        _fiveviewone.middleLabel.text = babystr;
        if (c >0) {
            //int abs(int c);
            int ab = abs(c);
            NSString *strvalue = [NSString stringWithFormat:@"%d",ab];
            NSString *strone = @"高于儿童标准";
            NSString *strtwo = [NSString stringWithFormat:@"%@%@ cm",strone,strvalue];
            _fiveviewone.downLabel.text = strtwo;
        }else{
             int ab = abs(c);
            NSString *strvalue = [NSString stringWithFormat:@"%d",ab];
            NSString *strone = @"低于儿童标准";
            NSString *strtwo = [NSString stringWithFormat:@"%@%@ cm",strone,strvalue];
            _fiveviewone.downLabel.text = strtwo;
        }
        [view addSubview:_fiveviewone];
        [_fiveviewone mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(1);
            make.top.mas_equalTo(1);
            //make.size.mas_equalTo(CGSizeMake(40, 40));
            make.right.mas_equalTo(view.mas_centerX);
            make.bottom.mas_equalTo(view.mas_centerY);
        }];
    

        _fiveviewtwo = [[secondfileView alloc]init];
        _fiveviewtwo.onview.image = [UIImage imageNamed:@"normal"];
        _fiveviewtwo.upLabel.text = @"遗传身高";
        int d = [_adultstr intValue];
         NSString *s = @"158";
        int stwo = [s intValue];
        
        int f = d -stwo;
        
        int abc = abs(f);
        NSString *strfirst = _adultstr;
        NSString *strsecond = @"cm";
        NSString *urlstir = [NSString stringWithFormat:@"%@%@",strfirst,strsecond];
        _fiveviewtwo.middleLabel.text = urlstir;
        if (f < 0) {
            NSString *strone = @"低于标准身高";
           
            NSString *twostr = [NSString stringWithFormat:@"%dcm",abc];
            
            NSString *urlstring = [NSString stringWithFormat:@"%@%@",strone,twostr];
            _fiveviewtwo.downLabel.text = urlstring;
        }else{
            NSString *strone = @"高于标准身高";
             NSString *twostr = [NSString stringWithFormat:@"%dcm",abc];
            NSString *urlstring = [NSString stringWithFormat:@"%@%@",strone,twostr];
            _fiveviewtwo.downLabel.text = urlstring;
        }
        //_fiveviewtwo.downLabel.text = @"低于标准身高2.6cm";
        [view addSubview: _fiveviewtwo];
        [_fiveviewtwo mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_fiveviewone.mas_right);
            make.right.mas_equalTo(view.mas_right).offset(-1);
            make.top.mas_equalTo(_fiveviewone.mas_top);
            make.bottom.mas_equalTo(_fiveviewone.mas_bottom);
        }];
        
        _fiveviewthree = [[secondfileView alloc]init];
        _fiveviewthree.onview.image = [UIImage imageNamed:@"normal"];
        _fiveviewthree.upLabel.text = @"体重";
        NSString *weightone = _babyweightstr;
        NSString *weighttwo = @"kg";
        NSString *weightstr = [NSString stringWithFormat:@"%@%@",weightone,weighttwo];
        //_fiveviewthree.middleLabel.text = @"kg";
        _fiveviewthree.middleLabel.text = weightstr;
        
        //_fiveviewthree.downLabel.text = @"体重达到标准体重";
        NSString *onstr = @"当前体重属于";
        NSString *lastr = _tizhoang_jg;
        NSString *birstr = [NSString stringWithFormat:@"%@%@",onstr,lastr];
         _fiveviewthree.downLabel.text = birstr;
        _fiveviewthree.downLabel.textAlignment = NSTextAlignmentCenter;
        [view addSubview:_fiveviewthree];
        [_fiveviewthree mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_fiveviewtwo.mas_bottom).offset(1);
            make.left.mas_equalTo(_fiveviewone.mas_left);
            make.bottom.mas_equalTo(view.mas_bottom).offset(-1);
            make.right.mas_equalTo(_fiveviewone.mas_right);
        }];
        _fiveviewfour = [[secondfileView alloc]init];
        _fiveviewfour.onview.image = [UIImage imageNamed:@"fat"];
        _fiveviewfour.upLabel.text = @"BMI";
        NSNumber *num = _bmistr;
        NSString *str = [NSString stringWithFormat:@"%@",num];
        _fiveviewfour.middleLabel.text = str;
        NSString *onone = @"当前BMI指数属于";
        NSString *twoone = _tizhoang_jg;
        NSString *lastone = [NSString stringWithFormat:@"%@%@",onone,twoone];
        _fiveviewfour.downLabel.text = lastone;
        [view addSubview:_fiveviewfour];
        [_fiveviewfour mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_fiveviewtwo.mas_bottom);
            make.bottom.mas_equalTo(_fiveviewthree.mas_bottom);
            make.right.mas_equalTo(view.mas_right).offset(-1);
            //make.bottom.mas_equalTo(_fiveviewthree.mas_bottom);
            //make.right.mas_equalTo(_fiveviewthree.mas_right);
            make.left.mas_equalTo(_fiveviewthree.mas_right);
        }];
        return cell;
    }else if (indexPath.section==2){
        UITableViewCell *cell = [UITableViewCell new];
        cell.selectionStyle = UITableViewCellEditingStyleNone;

        cell.contentView.backgroundColor = [UIColor whiteColor];
        //    //1.初始化
        _bezierView = [beizierx initWithFrame:CGRectMake(15, 15, SCREEN_W-30, 280)];
        //_bezierView.center = cell.contentView.center;
       // _bezierView = [[beizierx alloc]init];
        _bezierView.backgroundColor = [UIColor clearColor];
        [cell.contentView addSubview:_bezierView];
//        [_bezierView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.mas_equalTo(10);
//            make.left.mas_equalTo(10);
//            make.right.mas_equalTo(-10);
//            make.height.mas_equalTo(280);
//        }];
        //
        
        UILabel *labeltwo = [[UILabel alloc]init];
        labeltwo.text = @"注:遗传在生长发育中占重要因素，(据统计占比60%),由于受环境、饮食、个体差异等不确定因素的影响，因此该测试结果仅供参考。";
        labeltwo.textAlignment = NSTextAlignmentLeft;
        labeltwo.numberOfLines =3;
        labeltwo.textColor = TITLE_COLOR;
        labeltwo.font = [UIFont systemFontOfSize:16];
        [cell.contentView addSubview:labeltwo];
        [labeltwo mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(15);
            make.right.mas_equalTo(-15);
            make.top.mas_equalTo(295);
            
        }];
        
        //    //3.柱状图
        [self drawBaseChart];
        return cell;

    }
    UITableViewCell *cell = [UITableViewCell new];
    cell.contentView.backgroundColor = [UIColor whiteColor];
    return cell;
}

//画柱状图
-(void)drawBaseChart{
    [_bezierView drawBarChartViewWithX_Value_Names:self.x_names TargetValues:self.targets];
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section==0) {
        return 40;
    }
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
       return 1;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *view = [[UIView alloc]init];
    if (section==0) {
        
        view.backgroundColor =[UIColor clearColor];
    }
    view.backgroundColor = [UIColor whiteColor];
    return view;
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    _onetableview.contentSize = CGSizeMake(self.view.frame.size.width, 1100);
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc]init];
    if (section==0) {
        _nameLabel = [[UILabel alloc]init];
        
        NSString *strone = @"姓名:  ";
        NSString *strtwo = _namestr;
        NSString *namestr = [NSString stringWithFormat:@"%@%@",strone,strtwo];
        _nameLabel.text = namestr;
        _nameLabel.textColor = TITLE_COLOR;
        _nameLabel.textAlignment = NSTextAlignmentLeft;
        _nameLabel.font = [UIFont systemFontOfSize:16];
        [view addSubview:_nameLabel];
        [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.top.mas_equalTo(15);
            make.size.mas_equalTo(CGSizeMake(100, 16));
            
        }];
        
                    _sexLabel = [[UILabel alloc]init];
        NSString *sexonestr = @"性别:  ";
        NSString *sextwostr = _sexstr;
        NSString *sexstr = [NSString stringWithFormat:@"%@%@",sexonestr,sextwostr];
                    //_sexLabel.text = @"姓别: 女";
        _sexLabel.text = sexstr;
                    _sexLabel.textColor = TITLE_COLOR;
                    _sexLabel.textAlignment = NSTextAlignmentCenter;
                    _sexLabel.font = [UIFont systemFontOfSize:16];
                    [view addSubview:_sexLabel];
        [_sexLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(view.mas_centerX);
            make.centerY.mas_equalTo(_nameLabel.mas_centerY);
            make.size.mas_equalTo(CGSizeMake(80, 16));
        }];
        _ageLabel = [[UILabel alloc]init];
        NSString *yearstrone = @"年龄: ";
        //NSString *yearstrtwo = _yearstr;
         //计算年龄
        NSString *birth = _yearstr;
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
          [dateFormatter setDateFormat:@"yyyy-MM-dd"];
        
         //生日
        
          NSDate *birthDay = [dateFormatter dateFromString:birth];
        //当前时间
        NSString *currentDateStr = [dateFormatter stringFromDate:[NSDate date]];
          NSDate *currentDate = [dateFormatter dateFromString:currentDateStr];
          NSLog(@"currentDate %@ birthDay %@",currentDateStr,birth);
        NSTimeInterval time=[currentDate timeIntervalSinceDate:birthDay];
        int age = ((int)time)/(3600*24*365);
        NSLog(@"year %d",age);
        int aage = abs(age);
        NSString *yearstr = [NSString stringWithFormat:@"%d",aage];
        
        
        NSString *yeartwostr = [NSString stringWithFormat:@"%@%@",yearstrone,yearstr];
        
       // NSString *yearstr = [NSString stringWithFormat:@"%@%@",yearstrone,yearstrtwo];
        _ageLabel.text = yeartwostr;
        _ageLabel.textColor = TITLE_COLOR;
        _ageLabel.textAlignment = NSTextAlignmentRight;
        _ageLabel.font = [UIFont systemFontOfSize:16];
        [view addSubview:_ageLabel];
        [_ageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-20);
            make.centerY.mas_equalTo(_sexLabel.mas_centerY);
            make.size.mas_equalTo(CGSizeMake(80, 16));
        }];
        
    }
    return view;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        return 613/2+48;
    }else if (indexPath.section==1){
        
        return 210;
        
    }else if (indexPath.section==2){
        return 370;
    }
    return 200;
}

@end
