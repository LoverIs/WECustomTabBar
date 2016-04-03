//
//  LYBottomTabBar.m
//  自定义不规则tabBar
//
//  Created by yangli on 16/3/13.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "LYBottomTabBar.h"
#import "UIView+estension.h"


@interface LYBottomTabBar ()

@property (nonatomic, weak) LYButton *selectedBtn;

@end

@implementation LYBottomTabBar

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setUpBtn];
    }
    return self;
}

- (void)setUpBtn{
    //选项按钮
    for (NSInteger i = 0; i < 4; ++i) {
        LYButton * btn = [[LYButton alloc] init];
        
        btn.tag = i;
        
        NSString * norIcon = [NSString stringWithFormat:@"tabBar%ld",i + 1];
        NSString * seleIcon = [NSString stringWithFormat:@"tabBar%ldsel",i + 1];
        
        [btn setImage:[UIImage imageNamed:norIcon] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:seleIcon] forState:UIControlStateSelected];
        
        NSString * title;
        
        if (i == 0) {
            title = @"首页";
        } else if (i == 1){
            title = @"资讯";
        } else if (i == 2){
            title = @"数据";
        } else if (i ==3){
            title = @"我";
        }
        
        [btn setTitle:title forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor colorWithRed:29/255.0 green:173/255.0 blue:248/255.0 alpha:1] forState:UIControlStateSelected];
        btn.titleLabel.font = [UIFont systemFontOfSize:11];
        btn.titleLabel.textAlignment = NSTextAlignmentCenter;
        
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
        
        [self addSubview:btn];
    }
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    [self.subviews enumerateObjectsUsingBlock:^(__kindof LYButton * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.y = 0;
        obj.width = self.width * 0.2;
        obj.height = self.height;
        obj.x = idx * obj.width;
        if (idx >= 2) {
            obj.x = (idx + 1) * obj.width;
        }
    }];
}

- (void)btnClick:(LYButton *)btn{
    self.selectedBtn.selected = NO;
    btn.selected = YES;
    self.selectedBtn = btn;
    
    if (self.myBlock) {
        self.myBlock(btn.tag);
    }
}



@end
