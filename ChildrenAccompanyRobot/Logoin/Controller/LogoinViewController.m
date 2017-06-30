//
//  LogoinViewController.m
//  ChildrenAccompanyRobot
//
//  Created by aviccxzx on 17/6/28.
//  Copyright © 2017年 aviccxzx. All rights reserved.
//

#import "LogoinViewController.h"

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
#define kUIMargen



@end

@implementation LogoinViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = kColor28E2FA;
    
    // 背景
    UIImageView *bgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"WechatIMG14"]];
    bgView.frame = self.view.frame;
    UIBlurEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleRegular];
    UIVisualEffectView *VeffectV = [[UIVisualEffectView alloc] initWithEffect:effect];
    VeffectV.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
//    VeffectV.alpha = 0.9;
    [bgView addSubview:VeffectV];
    [self.view addSubview:bgView];
    
    UITapGestureRecognizer *topGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(retractKeyboard)];
    topGes.numberOfTapsRequired = 1;
    topGes.numberOfTouchesRequired = 1;
    [self.view addGestureRecognizer:topGes];
    
    
    
    
    [self setUpUI];
}

- (void)setUpUI {
    
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

- (UITextField *)setUpTextField{
    return [[UITextField alloc] init];
}

- (void)lookPassWord:(UIButton *)sender
{
    sender.highlighted = !sender.highlighted;
    _passWordTF.secureTextEntry = !_passWordTF.secureTextEntry;
}

- (void)retractKeyboard {
    [self.view endEditing:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
