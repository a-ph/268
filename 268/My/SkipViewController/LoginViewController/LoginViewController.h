//
//  LoginViewController.h
//  268
//
//  Created by Eaph Sing on 2018/1/11.
//  Copyright © 2018年 Ray Wenderlich. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, XLLoginType) {
    XLLoginTypeLoginRegister,
    XLLoginTypeForgetPassWord,
    XLLoginTypeNewPassWord,
};

@interface LoginViewController : UIViewController

@property (nonatomic, assign) XLLoginType loginType;

@end
