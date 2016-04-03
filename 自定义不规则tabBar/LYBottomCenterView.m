//
//  LYBottomCenterView.m
//  自定义不规则tabBar
//
//  Created by yangli on 16/3/13.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "LYBottomCenterView.h"
#import "UIView+estension.h"
#define LYSIZE [UIScreen mainScreen].bounds.size

@interface LYBottomCenterView ()

@property (nonatomic, weak) LYButton *centerBtn;

@end

@implementation LYBottomCenterView

+ (instancetype)loadCenterView{
    //中间的背景
    LYBottomCenterView * centerView = [[LYBottomCenterView alloc] init];
    
    centerView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tab_摄影机图标背景"]];
    
    return centerView;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        //中间的按钮
        LYButton * centerBtn = [[LYButton alloc] init];
        
        [centerBtn setBackgroundImage:[UIImage imageNamed:@"摄影机图标_点击前"] forState:UIControlStateNormal];
        [centerBtn setBackgroundImage:[UIImage imageNamed:@"摄影机图标_点击后"] forState:UIControlStateSelected];
        
        self.centerBtn = centerBtn;
        [self addSubview:centerBtn];
        
        
        //中间按钮
        centerBtn.height = 49;
        centerBtn.width = 49;
        centerBtn.x = 0;
        centerBtn.y = 5;
    }
    return self;
}

@end
