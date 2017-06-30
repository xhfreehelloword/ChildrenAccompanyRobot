//
//  RecordViewController.m
//  ChildrenAccompanyRobot
//
//  Created by aviccxzx on 17/6/21.
//  Copyright © 2017年 aviccxzx. All rights reserved.
//

#import "OperationViewController.h"

@interface OperationViewController ()

@end

@implementation OperationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = kColorRandom;
    [self setBackClick];
    
    
}

- (void)setBackClick
{
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    backBtn.highlighted = NO;
    
    [backBtn setTitle:@"返回" forState:UIControlStateNormal];
    [backBtn setFrame:CGRectMake(10, 20, 100, 40)];
    
    [backBtn addTarget:self action:@selector(backBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:backBtn];
}

- (void)backBtnClick:(UIButton *)sender
{
    NSLog(@"返回");
    self.tabBarController.tabBar.hidden = NO;
    
    NSLog(@"%ld",[[NSUserDefaults standardUserDefaults] integerForKey:@"index"]);
    
    self.tabBarController.selectedIndex = [[NSUserDefaults standardUserDefaults] integerForKey:@"index"];

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
