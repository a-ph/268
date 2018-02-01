//
//  LoginView.h
//  268
//
//  Created by Eaph Sing on 2018/1/11.
//  Copyright © 2018年 Ray Wenderlich. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, XLTitleCountType) {
    XLTitleCountTypeOne,
    XLTitleCountTypeTwo,
};

typedef void(^forgetPassWordAction)();
typedef void(^nextAction)(XLLoginType loginType);

@interface LoginView : UIView

- (instancetype)initWithTitleCountType:(XLLoginType)loginType;

@property (nonatomic, copy) forgetPassWordAction forgetPassWordActionBlock;
@property (nonatomic, copy) nextAction nextActionBlock;

@end
