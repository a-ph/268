//
//  UIView+Layout.m
//  268
//
//  Created by Eaph Sing on 2018/1/9.
//  Copyright © 2018年 Ray Wenderlich. All rights reserved.
//

#import "UIView+Layout.h"

@implementation UIView (Layout)

- (CGFloat)centerX {
    return self.center.x;
}

- (void)setCenterX:(CGFloat)centerX {
    CGPoint point = self.center;
    point.x = centerX;
    self.center = point;
}

@end
