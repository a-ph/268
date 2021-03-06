//
//  XLConst.h
//  268
//
//  Created by Eaph Sing on 2018/1/9.
//  Copyright © 2018年 Ray Wenderlich. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
#define TabBar_HEIGHT 49.0f
#define NavBar_HEIGHT 44.0f
#define StatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height

@interface XLConst : NSObject

UIKIT_EXTERN NSString *const PingFang_SC_Medium;
UIKIT_EXTERN NSString *const blackColor;
UIKIT_EXTERN NSString *const grayColor;
UIKIT_EXTERN NSString *const orangeColor;
UIKIT_EXTERN NSString *const Color666666;
UIKIT_EXTERN NSString *const Color333333;
UIKIT_EXTERN CGFloat const leftSpace;

@end
