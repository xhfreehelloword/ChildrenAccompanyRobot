//
//  AVICTabBarController.m
//  ChildrenAccompanyRobot
//
//  Created by aviccxzx on 17/6/21.
//  Copyright © 2017年 aviccxzx. All rights reserved.
//

#import "AVICTabBarController.h"
#import "AVICNavController.h"
#import "HomeViewController.h"
#import "OperationViewController.h"
#import "HabitViewController.h"
#import "ScheduleViewController.h"
#import "RecordViewController.h"
#import "XHBottomView.h"


@interface AVICTabBarController ()<XHBottomViewDelegate>

@end

@implementation AVICTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 添加标签控制器
    [self setupChildVcs];
    
    XHBottomView *bottomV = [[XHBottomView alloc] init];
    bottomV.backgroundColor = kColorRandom;
    
    bottomV.frame = self.tabBar.bounds;
    
    bottomV.delegate = self;
    
    [self.tabBar addSubview:bottomV];
    
    
    [self.viewControllers enumerateObjectsUsingBlock:^(__kindof UIViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        
        // 拼接图片名
        NSString *norImgName = [NSString stringWithFormat:@"TabBar%@", @(idx + 1)];
        NSString *selImgName = [NSString stringWithFormat:@"TabBar%@Sel", @(idx + 1)];
        
        // 创建普通的和选中的图片
        UIImage *norImg = [UIImage imageNamed:norImgName];
        UIImage *selImg = [UIImage imageNamed:selImgName];
        
        // 让bottomV添加按钮
        [bottomV addBottonWithImage:norImg andSelectImage:selImg];
        
    }];
    
}

#pragma mark - 代理方法
- (void)bottomView:(XHBottomView *)bottomView didSelectIndex:(NSUInteger)index
{
    
    if (index != 1) {
        
        self.tabBar.hidden = NO; // 显示
        [[NSUserDefaults standardUserDefaults] setInteger:index forKey:@"index"];
        
    }else {
        
        self.tabBar.hidden = YES;
        
    }
    
    
    self.selectedIndex = index;
}

#pragma mark - 标签控制器
- (void)setupChildVcs {
    
    // 首页
    HomeViewController *HomeVC = [[HomeViewController alloc] init];
    //    AVICNavController *HomeNavC = [[AVICNavController alloc] initWithRootViewController:HomeVC];
    
    // 控制
    OperationViewController *OperationVC = [[OperationViewController alloc] init];
    //    AVICNavController *OprationNavC =[[AVICNavController alloc] initWithRootViewController:OperationVC];
    
    // 惯例
    HabitViewController *HabitVC = [[HabitViewController alloc] init];
    AVICNavController *HabitNavC = [[AVICNavController alloc] initWithRootViewController:HabitVC];
    
    // 日程
    ScheduleViewController *ScheduleVC = [[ScheduleViewController alloc] init];
    AVICNavController *ScheduleNavC = [[AVICNavController alloc] initWithRootViewController:ScheduleVC];
    
    // 记录
    RecordViewController *RecordVC = [[RecordViewController alloc] init];
    AVICNavController *RecordNavC = [[AVICNavController alloc] initWithRootViewController:RecordVC];
    
    self.viewControllers = @[HomeVC,OperationVC,HabitNavC,ScheduleNavC,RecordNavC];
    
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
