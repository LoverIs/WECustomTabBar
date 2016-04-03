//
//  LYBottomTabBar.h
//  自定义不规则tabBar
//
//  Created by yangli on 16/3/13.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LYButton.h"

typedef void(^myBlock)(NSInteger index);

@interface LYBottomTabBar : UIView

@property (nonatomic, copy) myBlock myBlock;

@end
