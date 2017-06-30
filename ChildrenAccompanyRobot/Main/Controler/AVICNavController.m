//
//  AVICNavController.m
//  ChildrenAccompanyRobot
//
//  Created by aviccxzx on 17/6/21.
//  Copyright © 2017年 aviccxzx. All rights reserved.
//

#import "AVICNavController.h"

@interface AVICNavController ()

@end

@implementation AVICNavController


+ (void)initialize
{
    UINavigationBar *navB = [UINavigationBar appearance];
    
    [navB setBackgroundImage:[UIImage imageNamed:@"Snip20170621_11"] forBarMetrics:UIBarMetricsDefault];
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
