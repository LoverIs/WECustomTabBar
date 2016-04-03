//
//  LYButton.m
//  自定义不规则tabBar
//
//  Created by yangli on 16/3/13.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "LYButton.h"
#import "UIView+estension.h"

@implementation LYButton

- (void)setHighlighted:(BOOL)highlighted{
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.imageView.x = (self.width - self.imageView.width) * 0.5;
    self.imageView.y = 0;
    
    CGPoint center = self.titleLabel.center;
    center.x = self.imageView.center.x;
    self.titleLabel.center = center;
    self.titleLabel.y = self.imageView.height;
}

@end
