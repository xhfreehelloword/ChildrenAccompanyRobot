//
//  LogoinViewController.m
//  ChildrenAccompanyRobot
//
//  Created by aviccxzx on 17/6/28.
//  Copyright © 2017年 aviccxzx. All rights reserved.
//

#import "LogoinViewController.h"
#import "singViewController.h"
#import "forgetPassViewController.h"


@interface LogoinViewController (){
    UIImageView *_iconImage;
    UITextField *_UserNameTF;
    UITextField *_passWordTF;
    UIButton *_forgetPassWord;      // 忘记密码
    UIButton *_signUpUser;          // 注册
    UIButton *_loginBtn;            // 登录
    UIButton *_Readclause;          // 阅读条款???放在哪里
}

#define kUIIconTop 100              // 头像到顶部
#define kUIIconWH  80               // 头像宽高
#define kUIUserToIconTop 50         // 用户名到头像
#define kUITop 30                   // 到顶部
#define kUILeft 50
#define kUIright -50
#define kUIHeight 50
#define kUIMargen 10

//-----------------------------------------------------------

#define kUIFont32XP [UIFont systemFontOfSize:16]

@end

@implementation LogoinViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationController setNavigationBarHidden:YES];
    
    // 背景
    UIImageView *bgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"WechatIMG14"]];
    bgView.frame = self.view.frame;
    UIBlurEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleRegular];
    UIVisualEffectView *VeffectV = [[UIVisualEffectView alloc] initWithEffect:effect];
    VeffectV.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
//    VeffectV.alpha = 0.9;
    [bgView addSubview:VeffectV];
    [self.view addSubview:bgView];
    
    
    [self setUpUI];
}

- (void)loginBtnClick:(UIButton *)ssender {
    NSLog(@"登    录");
}

- (void)touchupinsidesignUpUserBtn
{
    NSLog(@"注册新用户");
    
    singViewController *singVC = [[singViewController alloc] init];
//    [self.navigationController popToViewController:singVC animated:YES];
    [self.navigationController pushViewController:singVC animated:YES];
    
}

- (void)touchupinsideforgetPassWordBtn
{
    NSLog(@"忘记密码");
}

- (void)lookPassWord:(UIButton *)sender // 显示密码
{
    sender.highlighted = !sender.highlighted;
    _passWordTF.secureTextEntry = !_passWordTF.secureTextEntry;
}

- (void)retractKeyboard // view结束编辑状态
{[self.view endEditing:YES];}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setUpUI {
    
    UITapGestureRecognizer *topGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(retractKeyboard)];
    topGes.numberOfTapsRequired = 1;
    topGes.numberOfTouchesRequired = 1;
    [self.view addGestureRecognizer:topGes];
    
    _iconImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Snip20170621_11"]];
    [self.view addSubview:_iconImage];
    [_iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(kUIIconTop);
        make.width.height.mas_equalTo(kUIIconWH);
        make.centerX.mas_equalTo(self.view.mas_centerX);
    }];
    
    
    _UserNameTF = [self getUpTextFieldWithPlaceholder:@"请输入手机号" andTextFieldImage:@""];
    _UserNameTF.keyboardType = UIKeyboardTypePhonePad;
    [_UserNameTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_iconImage.mas_bottom).mas_offset(kUIUserToIconTop);
        make.left.mas_equalTo(kUILeft);
        make.right.mas_equalTo(kUIright);
        make.height.mas_equalTo(kUIHeight);
    }];
    
    _passWordTF = [self getUpTextFieldWithPlaceholder:@"密码" andTextFieldImage:@""];
    _passWordTF.secureTextEntry = YES;
    //    _passWordTF.keyboardType = UIKeyboardTypeNamePhonePad;
    [_passWordTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_UserNameTF.mas_bottom).mas_offset(kUITop);
        make.left.mas_equalTo(kUILeft);
        make.right.mas_equalTo(kUIright);
        make.height.mas_equalTo(kUIHeight);
    }];
    UIButton *LookPassBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    LookPassBtn.frame = CGRectMake(0, 0, 30, 20);
    [LookPassBtn setBackgroundColor:kColorRandom];
    [LookPassBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    [LookPassBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateHighlighted];
    _passWordTF.rightView = LookPassBtn;
    _passWordTF.rightViewMode = UITextFieldViewModeAlways;
    [LookPassBtn addTarget:self action:@selector(lookPassWord:) forControlEvents:UIControlEventTouchUpInside];
    
    _forgetPassWord = [UIButton buttonWithType:UIButtonTypeCustom];
    [_forgetPassWord setTitle:@"忘记密码" forState:UIControlStateNormal];
    _forgetPassWord.titleLabel.font = kUIFont32XP;
    _forgetPassWord.highlighted = NO;
    [self.view addSubview:_forgetPassWord];
    [_forgetPassWord mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_passWordTF.mas_bottom).mas_offset(kUIMargen);
        make.left.mas_equalTo(_passWordTF.mas_left);
    }];
    [_forgetPassWord addTarget:self action:@selector(touchupinsideforgetPassWordBtn) forControlEvents:UIControlEventTouchUpInside];
    
    _signUpUser = [UIButton buttonWithType:UIButtonTypeCustom];
    [_signUpUser setTitle:@"新用户注册" forState:UIControlStateNormal];
    _signUpUser.titleLabel.font = kUIFont32XP;
    _signUpUser.highlighted = NO;
    [self.view addSubview:_signUpUser];
    [_signUpUser mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_forgetPassWord.mas_top);
        make.right.mas_equalTo(_passWordTF.mas_right);
    }];
    [_signUpUser addTarget:self action:@selector(touchupinsidesignUpUserBtn) forControlEvents:UIControlEventTouchUpInside];
    
    _loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_loginBtn setTitle:@"登  录" forState:UIControlStateNormal];
    _loginBtn.highlighted = NO;
    [self.view addSubview:_loginBtn];
    [_loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_forgetPassWord.mas_bottomMargin);
        make.centerX.mas_equalTo(self.view);
        make.height.mas_equalTo(80);
        make.width.mas_equalTo(150);
    }];
    [_loginBtn addTarget:self action:@selector(loginBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (UITextField *)getUpTextFieldWithPlaceholder:(NSString *)placeholder andTextFieldImage:(NSString *)imageStr {
    UITextField *textField = [[UITextField alloc] init];
    
    [self.view addSubview:textField];
    textField.backgroundColor = kColorFEFFFF;
    //    textField.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    textField.borderStyle = UITextBorderStyleNone;
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    textField.font = [UIFont systemFontOfSize:22];
    textField.placeholder = placeholder;
    
    // MARK: - 默认字体的颜色，大小（placeholder）.
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSForegroundColorAttributeName] = kColor9EF1FC;
    dict[NSFontAttributeName] = [UIFont systemFontOfSize:22];
    NSAttributedString *attributed = [[NSAttributedString alloc] initWithString:textField.placeholder attributes:dict];
    [textField setAttributedPlaceholder:attributed];
    
    // MARK: - 裁剪圆角
    //    CGRect rect = textField.frame;
    //    CGSize radio = CGSizeMake(5, 5);
    //    UIRectCorner rectcorner = UIRectCornerAllCorners;
    //    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:rectcorner cornerRadii:radio];
    //    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    //    maskLayer.path = path.CGPath;
    //    maskLayer.frame = textField.bounds;
    //    textField.layer.mask = maskLayer;
    textField.layer.cornerRadius = 25;
    textField.clipsToBounds = YES;
    textField.layer.masksToBounds = YES;
    
    UIImageView *iconImage = [[UIImageView alloc] init];
    iconImage.image = [UIImage imageNamed:imageStr];
    iconImage.frame = CGRectMake(0, 0, 50, 50);
    iconImage.backgroundColor = kColorRandom;
    [textField addSubview:iconImage];
    
    textField.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 60, 1)];
    textField.leftViewMode = UITextFieldViewModeAlways;
    
    return textField;
}

@end
