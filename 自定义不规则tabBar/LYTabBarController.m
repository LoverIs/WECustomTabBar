//
//  LYTabBarController.m
//  自定义不规则tabBar
//
//  Created by yangli on 16/3/13.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "LYTabBarController.h"
#import "LYNavigationController.h"
#import "LYHomeController.h"
#import "LYInfoController.h"
#import "LYDataController.h"
#import "LYMeController.h"
#import "LYBottomTabBar.h"
#import "LYBottomCenterView.h"
#import "UIView+estension.h"

#define HMROMDOMCOLOR [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1]

#define LYSIZE [UIScreen mainScreen].bounds.size

@interface LYTabBarController ()

@end

@implementation LYTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self allChildViewController];
    
    [self addButtomTabBar];
}

- (void)allChildViewController{
    //首页
    LYHomeController * homeVc = [[LYHomeController alloc] init];
    [self addChildViewController:homeVc WithTitle:@"首页"];
    
    //资讯
    LYInfoController * infoVc = [[LYInfoController alloc] init];
    [self addChildViewController:infoVc WithTitle:@"资讯"];
    
    //数据
    LYDataController * dataVc = [[LYDataController alloc] init];
    [self addChildViewController:dataVc WithTitle:@"数据"];
    
    //我
    LYMeController * meVc = [[LYMeController alloc] init];
    [self addChildViewController:meVc WithTitle:@"我"];
}
- (void)addChildViewController:(UIViewController *)childVc WithTitle:(NSString *)title{
    childVc.title = title;
    childVc.view.backgroundColor = HMROMDOMCOLOR;
    LYNavigationController * naviVc = [[LYNavigationController alloc] initWithRootViewController:childVc];
    [self addChildViewController:naviVc];
}

- (void)addButtomTabBar{
    [self.tabBar removeFromSuperview];
    
    LYBottomTabBar * lyTabBar = [[LYBottomTabBar alloc] init];
    
    lyTabBar.width = self.view.width;
    lyTabBar.height = 49;
    lyTabBar.x = 0;
    lyTabBar.y = self.view.height - lyTabBar.height;
    
    lyTabBar.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tab-_白色透明背景渐变"]];
    
    __weak typeof(self) weakSelf = self;
    
    lyTabBar.myBlock = ^(NSInteger index){
        weakSelf.selectedIndex = index;
    };
    
    [self.view addSubview:lyTabBar];
    
    LYBottomCenterView * centerView = [LYBottomCenterView loadCenterView];
    
    //中间背景
    centerView.height = 61;
    centerView.width = 49;
    centerView.center = CGPointMake(LYSIZE.width * 0.5, LYSIZE.height - centerView.height * 0.5);
    
    [self.view addSubview:centerView];
}

@end
