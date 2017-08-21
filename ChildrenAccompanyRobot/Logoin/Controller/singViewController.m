//
//  singViewController.m
//  ChildrenAccompanyRobot
//
//  Created by aviccxzx on 17/7/6.
//  Copyright © 2017年 aviccxzx. All rights reserved.
//

#import "singViewController.h"
#import "sfOKViewController.h"

@interface singViewController (){
    
    UITextField *_UserNameTF;
    UITextField *_passWordTF;
    UITextField *_passWordTF2;
    UITextField *_getIdentifyCode;
    UIButton *_receiveCheckNumButton; // 获取验证码
    UIButton *_confirmBtn;
    
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

@end

@implementation singViewController

- (void)viewWillAppear:(BOOL)animated { // 即将加载出来是调用，隐藏导航栏。
    self.navigationController.navigationBar.hidden = NO;
}


//获取验证码倒计时
- (void)receiveCheckNumButton{
    
    
    NSLog(@"获取验证码");
    
    __block int timeout=90; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout<=0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置重新发送验证码
                
                NSLog(@"重新发送验证码");
                
                [_receiveCheckNumButton setTitle:@"重新获取" forState:UIControlStateNormal];
                _receiveCheckNumButton.userInteractionEnabled = YES;
                _receiveCheckNumButton.backgroundColor = [UIColor purpleColor];
            });
        }else{
            int seconds = timeout;
            NSString *strTime = [NSString stringWithFormat:@"%.2d", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                //让按钮变为不可点击的灰色
                _receiveCheckNumButton.backgroundColor = [UIColor grayColor];
                _receiveCheckNumButton.userInteractionEnabled = NO;
                //设置界面的按钮显示 根据自己需求设置
                [UIView beginAnimations:nil context:nil];
                [UIView setAnimationDuration:1];
                [_receiveCheckNumButton setTitle:[NSString stringWithFormat:@"%@s后重新发送",strTime] forState:UIControlStateNormal];
                [UIView commitAnimations];
            });
            timeout--;
        }
    });
    dispatch_resume(_timer);
}

- (void)confirmBtnChange:(UIButton *)sender{
    
    NSLog(@"确定");
    sfOKViewController *sfOKvc = [[sfOKViewController alloc] init];
    [self.navigationController pushViewController:sfOKvc animated:YES];
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationController setNavigationBarHidden:NO];
    self.title = @"注册";
    
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

- (void)setUpUI {
    
    _UserNameTF = [self getUpTextFieldWithPlaceholder:@"请输入手机号" andTextFieldImage:@""];
    _UserNameTF.tag = kTag10 + 5;
    _UserNameTF.keyboardType = UIKeyboardTypePhonePad;
    [_UserNameTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(30);
        make.left.mas_equalTo(kUILeft);
        make.right.mas_equalTo(kUIright);
        make.height.mas_equalTo(kUIHeight);
    }];
    
    _getIdentifyCode = [self getUpTextFieldWithPlaceholder:@"输入验证码" andTextFieldImage:@""];
    _getIdentifyCode.tag = kTag10 + 6;
    _getIdentifyCode.keyboardType = UIKeyboardTypeNumberPad;
    [_getIdentifyCode mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_UserNameTF.mas_bottom).mas_offset(kUITop);
        make.left.mas_equalTo(kUILeft);
        make.right.mas_equalTo(kUIright);
        make.height.mas_equalTo(kUIHeight);
    }];
    
    _receiveCheckNumButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 30 )];
    _receiveCheckNumButton.backgroundColor = [UIColor purpleColor];
    [_receiveCheckNumButton setTitle:@"获取验证码" forState:UIControlStateNormal];
    [_receiveCheckNumButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _receiveCheckNumButton.titleLabel.font = [UIFont systemFontOfSize:13];
    _receiveCheckNumButton.layer.cornerRadius = 15;
    _receiveCheckNumButton.layer.masksToBounds = YES;
    _receiveCheckNumButton.alpha = 0.3;
    [_receiveCheckNumButton addTarget:self action:@selector(receiveCheckNumButton) forControlEvents:UIControlEventTouchUpInside];
    _getIdentifyCode.rightView = _receiveCheckNumButton;
    _getIdentifyCode.rightViewMode = UITextFieldViewModeAlways;
    
    _passWordTF = [self getUpTextFieldWithPlaceholder:@"输入密码密码" andTextFieldImage:@""];
    _passWordTF.tag = kTag10 + 7;
    _passWordTF.secureTextEntry = YES;
    //    _passWordTF.keyboardType = UIKeyboardTypeNamePhonePad;
    [_passWordTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_getIdentifyCode.mas_bottom).mas_offset(kUITop);
        make.left.mas_equalTo(kUILeft);
        make.right.mas_equalTo(kUIright);
        make.height.mas_equalTo(kUIHeight);
    }];
    
    _passWordTF2 = [self getUpTextFieldWithPlaceholder:@"重新输入密码" andTextFieldImage:@""];
    _passWordTF2.tag = kTag10 + 8;
    _passWordTF2.secureTextEntry = YES;
    [_passWordTF2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_passWordTF.mas_bottom).mas_offset(kUITop);
        make.left.mas_equalTo(kUILeft);
        make.right.mas_equalTo(kUIright);
        make.height.mas_equalTo(kUIHeight);
    }];
    
    _confirmBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    [_confirmBtn setImage:[UIImage imageNamed:@""]forState:UIControlStateNormal];
//    [_confirmBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateHighlighted];
    [_confirmBtn setTitle:@"确 定" forState:UIControlStateNormal];
    _confirmBtn.highlighted = NO;
    _confirmBtn.titleLabel.font = [UIFont systemFontOfSize:20];
    [self.view addSubview:_confirmBtn];
    [_confirmBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_passWordTF2.mas_bottom).mas_offset(kUITop);
        make.centerX.mas_equalTo(self.view);
        make.width.mas_equalTo(150);
        make.height.mas_equalTo(80);
    }];
    [_confirmBtn addTarget:self action:@selector(confirmBtnChange:) forControlEvents:UIControlEventTouchUpInside];

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
