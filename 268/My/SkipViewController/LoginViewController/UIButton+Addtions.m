//
//  UIButton+Addtions.m
//  268
//
//  Created by Eaph Sing on 2018/1/11.
//  Copyright © 2018年 Ray Wenderlich. All rights reserved.
//

#import "UIButton+Addtions.h"

@implementation UIButton (Addtions)

+ (UIButton *)underLineButtonWithTitle:(NSString *)title {
    UIButton *button = [UIButton buttonWithType:0];
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:title];
    NSRange strRange = {0,[str length]};
    [str addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:strRange];
    [button setAttributedTitle:str forState:UIControlStateNormal];
    return button;
    
}

@end
