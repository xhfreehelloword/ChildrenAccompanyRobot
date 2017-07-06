//
//  navLoginViewController.m
//  ChildrenAccompanyRobot
//
//  Created by aviccxzx on 17/7/6.
//  Copyright © 2017年 aviccxzx. All rights reserved.
//

#import "navLoginViewController.h"

@interface navLoginViewController ()

@end

@implementation navLoginViewController

+ (void)initialize {
    
    UINavigationBar *navc = [UINavigationBar appearance];
    
//    navc.backgroundColor = kColor28E2FA;
    [navc setBackgroundImage:[UIImage imageNamed:@"Snip20170706_5"] forBarMetrics:UIBarMetricsDefault];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
