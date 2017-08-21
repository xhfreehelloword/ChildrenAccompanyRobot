//
//  sfOKViewController.m
//  ChildrenAccompanyRobot
//
//  Created by aviccxzx on 17/8/18.
//  Copyright © 2017年 aviccxzx. All rights reserved.
//

#import "sfOKViewController.h"

@interface sfOKViewController ()

@end

@implementation sfOKViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    // 背景
    UIImageView *bgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"WechatIMG14"]];
    bgView.frame = self.view.frame;
    UIBlurEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleRegular];
    UIVisualEffectView *VeffectV = [[UIVisualEffectView alloc] initWithEffect:effect];
    VeffectV.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    //    VeffectV.alpha = 0.9;
    [bgView addSubview:VeffectV];
    [self.view addSubview:bgView];
//    self.view.backgroundColor = kColorRandom;
    self.title = @"成 功";
    
    
    UIButton *goLoginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [goLoginBtn setTitle:@"去 登 录" forState:UIControlStateNormal];
    goLoginBtn.highlighted = NO;
    [self.view addSubview:goLoginBtn];
    [goLoginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.view);
    }];
    [goLoginBtn addTarget:self action:@selector(goToLoginVC:) forControlEvents:UIControlEventTouchUpInside];
    
    
}

- (void)goToLoginVC:(UIButton *)sender
{
//    [self.navigationController popViewControllerAnimated:YES];
    [self.navigationController popToRootViewControllerAnimated:NO];
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
