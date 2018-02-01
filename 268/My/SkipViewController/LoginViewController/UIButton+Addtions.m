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
    NSMutableAttributedString *strBlack = [[NSMutableAttributedString alloc] initWithString:title];
    NSMutableAttributedString *strOrange = [[NSMutableAttributedString alloc] initWithString:title];
    NSRange strRange = {0,[title length]};
    [strBlack addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:strRange];
    [strBlack addAttribute:NSForegroundColorAttributeName  value:[UIColor blackColor] range:strRange];
    [button setAttributedTitle:strBlack forState:UIControlStateNormal];
    [strOrange addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:strRange];
    [strOrange addAttribute:NSForegroundColorAttributeName  value:[UIColor hexStringToColor:orangeColor] range:strRange];
    [button setAttributedTitle:strOrange forState:UIControlStateSelected];
    return button;
    
}

@end
