//
//  yichuantestViewController.m
//  ZhongTongErKe
//
//  Created by 研发部 on 2017/9/12.
//  Copyright © 2017年 Claf. All rights reserved.
//

#import "yichuantestViewController.h"
#import <Masonry.h>
#import "CustomPickView.h"
#import "testViewController.h"
#import "ICConst.h"
#import "NSObject+Netwoking.h"
@interface yichuantestViewController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>
@property(nonatomic,strong)UITableView *onetableview;

@property(nonatomic,strong)UITextField *namefield;
@property(nonatomic,strong)UITextField *sexfield;
@property(nonatomic,strong)UITextField *datefield;
@property(nonatomic,strong)UITextField *babyheight;
@property(nonatomic,strong)UITextField *babyweight;
@property(nonatomic,strong)UITextField *fatherheight;
@property(nonatomic,strong)UITextField *fatherweight;
@property(nonatomic,strong)UITextField *motherfield;
@property(nonatomic,strong)UITextField *longheight;
@property (nonatomic , strong) CustomPickView *pick;
@property(nonatomic,strong)UILabel *sexLabel;
@property(nonatomic,strong)UILabel *babyheightLabel;

@property(nonatomic,strong)UILabel *babyweightLabel;

@property(nonatomic,strong)UILabel *fatherheightLabel;
@property(nonatomic,strong)UILabel *motherheightLabel;
@property(nonatomic,strong)UILabel *longheightLabel;
@property(nonatomic,strong)UILabel *datechooseLabel;

@property(nonatomic,strong)UIDatePicker *datepick;

@property(nonatomic,strong)NSArray *datearray;

@property(nonatomic,strong)NSArray *weightarray;

@property(nonatomic,strong)NSString *MBIstr;
@property(nonatomic,strong)NSString *biazhunshengao;
@property(nonatomic,strong)NSString *yichuashengao;
@property(nonatomic,strong)NSString *weightstr2;
@property(nonatomic,strong)NSString *bebei2;

@property(nonatomic,strong)NSString *feipang;

@end

@implementation yichuantestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"遗传身高自测";
    _onetableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStyleGrouped];
    _onetableview.delegate = self;
    _onetableview.dataSource = self;
    //_onetableview.backgroundColor = [UIColor colorWithRed:236.0/255 green:241.0/255 blue:238.0/255 alpha:1];
    //_onetableview.backgroundColor = MAIN_COLOR;
    _onetableview.backgroundColor = BACKGROUND_COLOR;
    _onetableview.separatorColor = [UIColor clearColor];
    [self.view addSubview:_onetableview];
    UIButton *btn = [[UIButton alloc]init];
    btn.backgroundColor = MAIN_COLOR;
    [btn setTitle:[NSString stringWithFormat:@"完成"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(clickfinish) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.height.mas_equalTo(60);
    }];
    
    _datepick = [[UIDatePicker alloc]init];
    _datepick.datePickerMode = UIDatePickerModeDate;
    _datepick.backgroundColor = [UIColor groupTableViewBackgroundColor];
    //[_datepick setDatePickerMode:UIDatePickerModeDate];

    [_datepick addTarget:self action:@selector(choosedata:) forControlEvents:UIControlEventValueChanged];
//    [self.view addSubview:_datepick];
    NSLocale *locale = [[NSLocale alloc]initWithLocaleIdentifier:@"zh_CN"];
    _datepick.locale = locale;
    
    //当前时间
//    NSDate *localDate = [NSDate date];
//    NSCalendar *gregorian = [[NSCalendar alloc]initWithCalendarIdentifier:NSGregorianCalendar];
//    NSDateComponents *offsetcom = [[NSDateComponents alloc]init];
    
    _datearray = @[@"90",@"91",@"92",@"93",@"94",@"95",@"96",@"97",@"98",@"99",@"100",@"101",@"102",@"103",@"104",@"105",@"106",@"107",@"108",@"109",@"110",@"111",@"112",@"113",@"114",@"115",@"116",@"117",@"118",@"119",@"120",@"121",@"123",@"124",@"125",@"126",@"127",@"128",@"129",@"130",@"131",@"132",@"133",@"134",@"135",@"136",@"137",@"138",@"139",@"140",@"141",@"142",@"143",@"145"];
    _weightarray = @[@"31",@"32",@"33",@"34",@"35",@"36",@"37",@"38",@"39",@"40",@"41",@"42",@"43",@"44",@"45",@"46",@"47",@"48",@"49",@"50",@"51",@"52",@"53",@"54",@"55",@"56",@"57",@"58",@"59",@"60",@"61",@"61",@"62",@"63",@"64",@"65",@"66",@"67",@"68",@"69"];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 8;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(void)clickfinish{
    NSLog(@"点击完成");
//    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
//    NSString *str = @"女";
//    NSString *twostr = @"1990";
     //NSString *strtwo = @"120.0";
    params[@"sex"]=_sexLabel.text;
    params[@"year"]=_datefield.text;
    params[@"shengao"]=_babyheightLabel.text;
    params[@"tizhong"]=_babyweightLabel.text;
    params[@"f_shengao"]=_fatherheightLabel.text;
    params[@"m_shengao"]=_motherheightLabel.text;
    
    NSString *urlstr = @"http://yf.xnetyy.com/index.php?s=/Admin/HomePage/shengao";
//
    [NSObject POST:urlstr parameters:params progress:^(NSProgress *downloadProgress) {
        
    } completionHandler:^(id responseObj, NSError *error) {
        NSLog(@"响应:responseobject:%@",responseObj);
        if ([responseObj[@"code"]integerValue]==1) {

            [MBProgressHUD showSuccess:@"资料提交成功"];
            
            _MBIstr = responseObj[@"bmi"];
            _feipang = responseObj[@"tizhoang_jg"];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                //NSLog(@"延迟2.0秒后打印出来的日志！");
                testViewController *testview = [[testViewController alloc]init];
                testview.namestr = _namefield.text;
                testview.sexstr = _sexLabel.text;
                testview.yearstr = _datefield.text;
                testview.babyheightstr = _babyheightLabel.text;
                testview.babyweightstr = _babyweightLabel.text;
                testview.bmistr = _MBIstr;
                testview.adultstr =_motherheightLabel.text;
                testview.tizhoang_jg = _feipang;
                


                [self.navigationController pushViewController:testview animated:YES];
            });
            
            
        }else{
            //[MBProgressHUD showError:@"填写完整资料才能提交哦!"];
           // [MBProgressHUD showError:responseObj[@"code"]];
                         
        }
        
        
    }];
    
      }
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [UITableViewCell new];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (indexPath.section==0&&indexPath.row==0) {

        
        UIImageView *imageview = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"name"]];
        [cell.contentView addSubview:imageview];
        [imageview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.centerY.mas_equalTo(cell.contentView.mas_centerY);
            make.size.mas_equalTo(CGSizeMake(25, 25));
        }];
        
        UILabel *label = [[UILabel alloc]init];
        label.text = @"宝贝姓名";
        label.textColor = TITLE_COLOR;
        //label.textColor = [UIColor blackColor];
        label.textAlignment = NSTextAlignmentLeft;
        label.font = [UIFont systemFontOfSize:14];
        [cell.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(imageview.mas_right).offset(10);
            make.centerY.mas_equalTo(imageview.mas_centerY);
            make.size.mas_equalTo(CGSizeMake(80, 14));
        }];
        
        _namefield = [[UITextField alloc]init];
        _namefield.textColor = [UIColor lightGrayColor];
        _namefield.font = [UIFont systemFontOfSize:14];
        _namefield.placeholder = @"请输入宝贝姓名";
        _namefield.delegate = self;
        _namefield.textColor = TITLE_COLOR;
        _namefield.textAlignment = NSTextAlignmentCenter;
        [cell.contentView addSubview:_namefield];
        [_namefield mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-20);
            make.centerY.mas_equalTo(cell.contentView.mas_centerY);
            make.width.mas_equalTo(100);
        }];
        
    }else if (indexPath.section==1&&indexPath.row==0){
        UIImageView *imageview = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"sex"]];
        [cell.contentView addSubview:imageview];
        [imageview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.centerY.mas_equalTo(cell.contentView.mas_centerY);
            make.size.mas_equalTo(CGSizeMake(25, 25));
        }];
        
        UILabel *label = [[UILabel alloc]init];
        label.text = @"宝贝性别";
        label.textColor = TITLE_COLOR;
        //label.textColor = [UIColor blackColor];
        label.textAlignment = NSTextAlignmentLeft;
        label.font = [UIFont systemFontOfSize:14];
        [cell.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(imageview.mas_right).offset(10);
            make.centerY.mas_equalTo(imageview.mas_centerY);
            make.size.mas_equalTo(CGSizeMake(80, 14));
        }];
//
//        _sexfield = [[UITextField alloc]init];
//        _sexfield.textColor = [UIColor lightGrayColor];
//        _sexfield.font = [UIFont systemFontOfSize:14];
//        _sexfield.placeholder = @"请选择宝贝姓别";
//        _sexfield.delegate = self;
//        [cell.contentView addSubview:_sexfield];
//        [_sexfield mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.right.mas_equalTo(-20);
//            make.centerY.mas_equalTo(cell.contentView.mas_centerY);
//            make.width.mas_equalTo(100);
//        }];
        
        UIView *view = [[UIView alloc]init];
        view.backgroundColor = [UIColor whiteColor];
       
        [view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickSex)]];

        [cell.contentView addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-20);
            make.centerY.mas_equalTo(cell.contentView.mas_centerY);
            make.width.mas_equalTo(100);
        }];
        _sexLabel = [[UILabel alloc]init];
        
        _sexLabel.text = @"男";
        _sexLabel.textAlignment = NSTextAlignmentCenter;
        _sexLabel.textColor = TITLE_COLOR;
        [view addSubview:_sexLabel];
        [_sexLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        

        
    }else if (indexPath.section==2&&indexPath.row==0){
        UIImageView *imageview = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"day"]];
        [cell.contentView addSubview:imageview];
        [imageview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.centerY.mas_equalTo(cell.contentView.mas_centerY);
            make.size.mas_equalTo(CGSizeMake(25, 25));
        }];
        
        UILabel *label = [[UILabel alloc]init];
        label.text = @"出生日期";
        label.textColor = TITLE_COLOR;
        //label.textColor = [UIColor blackColor];
        label.textAlignment = NSTextAlignmentLeft;
        label.font = [UIFont systemFontOfSize:14];
        [cell.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(imageview.mas_right).offset(10);
            make.centerY.mas_equalTo(imageview.mas_centerY);
            make.size.mas_equalTo(CGSizeMake(80, 14));
        }];
        _datefield = [[UITextField alloc]init];
        _datefield.textColor = [UIColor lightGrayColor];
        _datefield.font = [UIFont systemFontOfSize:14];
        _datefield.placeholder = @"请选择出生日期";
        _datefield.delegate = self;
        _datefield.textColor = [UIColor blackColor];
        _datefield.inputView = _datepick;
        [cell.contentView addSubview:_datefield];
        [_datefield mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-20);
            make.centerY.mas_equalTo(cell.contentView.mas_centerY);
            make.width.mas_equalTo(100);
        }];
        
//        UIView *view = [[UIView alloc]init];
//        view.backgroundColor = [UIColor whiteColor];
//        
//        [view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickdate)]];
//        
//        [cell.contentView addSubview:view];
//        [view mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.right.mas_equalTo(-20);
//            make.centerY.mas_equalTo(cell.contentView.mas_centerY);
//            make.width.mas_equalTo(100);
//        }];
        
//        _datechooseLabel = [[UILabel alloc]init];
//        
//        _datechooseLabel.text = @"1990-0";
//        _datechooseLabel.textAlignment = NSTextAlignmentCenter;
//        _datechooseLabel.textColor = TITLE_COLOR;
//        [view addSubview:_datechooseLabel];
//        [_datechooseLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.edges.mas_equalTo(0);
//        }];
        
        
        
           }else if (indexPath.section==3&&indexPath.row==0){
        UIImageView *imageview = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"high"]];
        [cell.contentView addSubview:imageview];
        [imageview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.centerY.mas_equalTo(cell.contentView.mas_centerY);
            make.size.mas_equalTo(CGSizeMake(25, 25));
        }];
        
        UILabel *label = [[UILabel alloc]init];
        label.text = @"宝贝身高";
        label.textColor = TITLE_COLOR;
        //label.textColor = [UIColor blackColor];
        label.textAlignment = NSTextAlignmentLeft;
        label.font = [UIFont systemFontOfSize:14];
        [cell.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(imageview.mas_right).offset(10);
            make.centerY.mas_equalTo(imageview.mas_centerY);
            make.size.mas_equalTo(CGSizeMake(80, 14));
        }];


               UIView *view = [[UIView alloc]init];
               view.backgroundColor = [UIColor whiteColor];
               
               [view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickbabyheight)]];
               
               [cell.contentView addSubview:view];
               [view mas_makeConstraints:^(MASConstraintMaker *make) {
                   make.right.mas_equalTo(-20);
                   make.centerY.mas_equalTo(cell.contentView.mas_centerY);
                   make.width.mas_equalTo(100);
               }];

               _babyheightLabel = [[UILabel alloc]init];
              // _babyheightLabel.backgroundColor = [UIColor redColor];
               _babyheightLabel.text = @"cm";
               _babyheightLabel.textAlignment = NSTextAlignmentCenter;
               _babyheightLabel.textColor = TITLE_COLOR;
               [view addSubview:_babyheightLabel];
               [_babyheightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.mas_equalTo(0);
                                 }];
               
//               UILabel *limi = [[UILabel alloc]init];
//               limi.text = @"cm";
//               //limi.textColor = [UIColor blackColor];
//               //limi.textColor = TITLE_COLOR;
//               limi.textColor = [UIColor lightGrayColor];
//               limi.font = [UIFont systemFontOfSize:14];
//               [view addSubview:limi];
//               [limi mas_makeConstraints:^(MASConstraintMaker *make) {
//                   make.left.mas_equalTo(_babyheightLabel.mas_right).offset(-20);
//                   make.centerY.mas_equalTo(_babyheightLabel.mas_centerY);
//                   make.size.mas_equalTo(CGSizeMake(30, 14));
//               }];

        
    }else if (indexPath.section==4&&indexPath.row==0){
        UIImageView *imageview = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"kg"]];
        [cell.contentView addSubview:imageview];
        [imageview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.centerY.mas_equalTo(cell.contentView.mas_centerY);
            make.size.mas_equalTo(CGSizeMake(25, 25));
        }];
        
        UILabel *label = [[UILabel alloc]init];
        label.text = @"宝贝体重";
        label.textColor = TITLE_COLOR;
        //label.textColor = [UIColor blackColor];
        label.textAlignment = NSTextAlignmentLeft;
        label.font = [UIFont systemFontOfSize:14];
        [cell.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(imageview.mas_right).offset(10);
            make.centerY.mas_equalTo(imageview.mas_centerY);
            make.size.mas_equalTo(CGSizeMake(80, 14));
        }];

//        _babyweight = [[UITextField alloc]init];
//        _babyweight.textColor = [UIColor lightGrayColor];
//        _babyweight.font = [UIFont systemFontOfSize:14];
//        _babyweight.placeholder = @"请选择宝贝体重";
//        _babyweight.delegate = self;
//        [cell.contentView addSubview:_babyweight];
//        [_babyweight mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.right.mas_equalTo(-20);
//            make.centerY.mas_equalTo(cell.contentView.mas_centerY);
//            make.width.mas_equalTo(100);
//        }];
//
        UIView *view = [[UIView alloc]init];
        view.backgroundColor = [UIColor whiteColor];
        
        [view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickbabyweight)]];
        
        [cell.contentView addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-20);
            make.centerY.mas_equalTo(cell.contentView.mas_centerY);
            make.width.mas_equalTo(100);
        }];
        
        _babyweightLabel = [[UILabel alloc]init];
        
        _babyweightLabel.text = @"kg";
        _babyweightLabel.textAlignment = NSTextAlignmentCenter;
        _babyweightLabel.textColor = TITLE_COLOR;
        [view addSubview:_babyweightLabel];
        [_babyweightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];

    }else if (indexPath.section==5&&indexPath.row==0){
        UIImageView *imageview = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"father"]];
        [cell.contentView addSubview:imageview];
        [imageview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.centerY.mas_equalTo(cell.contentView.mas_centerY);
            make.size.mas_equalTo(CGSizeMake(25, 25));
        }];
        
        UILabel *label = [[UILabel alloc]init];
        label.text = @"父亲身高";
        label.textColor = TITLE_COLOR;
        //label.textColor = [UIColor blackColor];
        label.textAlignment = NSTextAlignmentLeft;
        label.font = [UIFont systemFontOfSize:14];
        [cell.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(imageview.mas_right).offset(10);
            make.centerY.mas_equalTo(imageview.mas_centerY);
            make.size.mas_equalTo(CGSizeMake(80, 14));
        }];
        
//        _fatherheight = [[UITextField alloc]init];
//        _fatherheight.textColor = [UIColor lightGrayColor];
//        _fatherheight.font = [UIFont systemFontOfSize:14];
//        _fatherheight.placeholder = @"请选择父亲身高";
//        _fatherheight.delegate = self;
//        [cell.contentView addSubview:_fatherheight];
//        [_fatherheight mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.right.mas_equalTo(-20);
//            make.centerY.mas_equalTo(cell.contentView.mas_centerY);
//            make.width.mas_equalTo(100);
//        }];

        UIView *view = [[UIView alloc]init];
        view.backgroundColor = [UIColor whiteColor];
        
        [view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickfatherheight)]];
        
        [cell.contentView addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-20);
            make.centerY.mas_equalTo(cell.contentView.mas_centerY);
            make.width.mas_equalTo(100);
        }];
        
        _fatherheightLabel = [[UILabel alloc]init];
        
        _fatherheightLabel.text = @"cm";
        _fatherheightLabel.textAlignment = NSTextAlignmentCenter;
        _fatherheightLabel.textColor = TITLE_COLOR;
        [view addSubview:_fatherheightLabel];
        [_fatherheightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];



    }else if (indexPath.section==6&&indexPath.row==0){
        UIImageView *imageview = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"mother"]];
        [cell.contentView addSubview:imageview];
        [imageview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.centerY.mas_equalTo(cell.contentView.mas_centerY);
            make.size.mas_equalTo(CGSizeMake(25, 25));
        }];
        
        UILabel *label = [[UILabel alloc]init];
        label.text = @"成年后身高";
        label.textColor = TITLE_COLOR;
        //label.textColor = [UIColor blackColor];
        label.textAlignment = NSTextAlignmentLeft;
        label.font = [UIFont systemFontOfSize:14];
        [cell.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(imageview.mas_right).offset(10);
            make.centerY.mas_equalTo(imageview.mas_centerY);
            make.size.mas_equalTo(CGSizeMake(80, 14));
        }];

        
//        _motherfield = [[UITextField alloc]init];
//        _motherfield.textColor = [UIColor lightGrayColor];
//        _motherfield.font = [UIFont systemFontOfSize:14];
//        _motherfield.placeholder = @"请选择母亲身高";
//        _motherfield.delegate = self;
//        [cell.contentView addSubview:_motherfield];
//        [_motherfield mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.right.mas_equalTo(-20);
//            make.centerY.mas_equalTo(cell.contentView.mas_centerY);
//            make.width.mas_equalTo(100);
//        }];
        
        UIView *view = [[UIView alloc]init];
        view.backgroundColor = [UIColor whiteColor];
        
        [view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickmotherheight)]];
        
        [cell.contentView addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-20);
            make.centerY.mas_equalTo(cell.contentView.mas_centerY);
            make.width.mas_equalTo(100);
        }];
        
        _motherheightLabel = [[UILabel alloc]init];
        
        _motherheightLabel.text = @"cm";
        _motherheightLabel.textAlignment = NSTextAlignmentCenter;
        _motherheightLabel.textColor = TITLE_COLOR;
        [view addSubview:_motherheightLabel];
        [_motherheightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];


    }else if (indexPath.section==7&&indexPath.row==0){
        UIImageView *imageview = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"hope"]];
        [cell.contentView addSubview:imageview];
        [imageview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.centerY.mas_equalTo(cell.contentView.mas_centerY);
            make.size.mas_equalTo(CGSizeMake(25, 25));
        }];
        
        UILabel *label = [[UILabel alloc]init];
        label.text = @"期望身高";
        label.textColor = TITLE_COLOR;
        //label.textColor = [UIColor blackColor];
        label.textAlignment = NSTextAlignmentLeft;
        label.font = [UIFont systemFontOfSize:14];
        [cell.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(imageview.mas_right).offset(10);
            make.centerY.mas_equalTo(imageview.mas_centerY);
            make.size.mas_equalTo(CGSizeMake(80, 14));
        }];
      
        UIView *view = [[UIView alloc]init];
        view.backgroundColor = [UIColor whiteColor];
        
        [view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clicklongheight)]];
        
        [cell.contentView addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-20);
            make.centerY.mas_equalTo(cell.contentView.mas_centerY);
            make.width.mas_equalTo(100);
        }];
        
        _longheightLabel = [[UILabel alloc]init];
        
        _longheightLabel.text = @"cm";
        _longheightLabel.textAlignment = NSTextAlignmentCenter;
        _longheightLabel.textColor = TITLE_COLOR;
        [view addSubview:_longheightLabel];
        [_longheightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];

    }
    return cell;
}
-(void)clickdate{
    
//    _pick = [[CustomPickView alloc]initWithFrame:[UIScreen mainScreen].bounds];
//    [_pick showDatePick:_datechooseLabel.text select:^(id content) {
//        _datechooseLabel.text = content;
//    } disSelect:^(id content) {
//        
//    }];
//
    
   }
-(void)choosedata:(UIDatePicker *)sender{
    NSDate *selectedDate = sender.date;
   NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    formatter.dateFormat = @"yyyy-MM-dd";
    NSString *dateString = [formatter stringFromDate:selectedDate];
    _datefield.text = dateString;
}

//(clickbabyheight)
-(void)clicklongheight{
    _pick = [[CustomPickView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [_pick showPick:_babyheight.text data:_datearray valueChange:^(NSString *str, NSInteger component) {
        
    } select:^(id content) {
        _longheightLabel.text = content;
    } disSelect:^(id content) {
        
    }];
 
}
-(void)clickmotherheight{
    _pick = [[CustomPickView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [_pick showPick:_babyheight.text data:_datearray valueChange:^(NSString *str, NSInteger component) {
        
    } select:^(id content) {
        _motherheightLabel.text = content;
    } disSelect:^(id content) {
        
    }];

}
-(void)clickbabyheight{
    _pick = [[CustomPickView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [_pick showPick:_babyheight.text data:_datearray valueChange:^(NSString *str, NSInteger component) {
        
    } select:^(id content) {
        _babyheightLabel.text = content;
    } disSelect:^(id content) {
        
    }];
}
//clickfatherheight
-(void)clickfatherheight{
    _pick = [[CustomPickView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [_pick showPick:_babyheight.text data:_datearray valueChange:^(NSString *str, NSInteger component) {
        
    } select:^(id content) {
        _fatherheightLabel.text = content;
    } disSelect:^(id content) {
        
    }];

}
-(void)clickSex{
    NSLog(@"点击姓别");
    
    _pick = [[CustomPickView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [_pick showPick:_sexLabel.text data:@[@"男",@"女"] valueChange:^(NSString *str, NSInteger component) {
        
    } select:^(id content) {
        _sexLabel.text = content;
    } disSelect:^(id content) {
        
    }];
}
//clickbabyweight
-(void)clickbabyweight{
    _pick = [[CustomPickView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [_pick showPick:_babyweight.text data:_weightarray valueChange:^(NSString *str, NSInteger component) {
        
    } select:^(id content) {
        _babyweightLabel.text = content;
    } disSelect:^(id content) {
        
    }];

}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.15;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.15;
}

-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *view  = [[UIView alloc]init];
    view.backgroundColor = [UIColor clearColor];
    return view;
    
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view  = [[UIView alloc]init];
    view.backgroundColor = [UIColor clearColor];
    return view;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}


@end
