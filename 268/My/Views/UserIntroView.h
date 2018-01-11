//
//  UserIntroView.h
//  268
//
//  Created by Eaph Sing on 2018/1/8.
//  Copyright © 2018年 Ray Wenderlich. All rights reserved.
//

#import <UIKit/UIKit.h>
@class UserModel;

typedef void(^headImageViewAction)();

@interface UserIntroView : UIView

@property (nonatomic, copy) UserModel *userModel;

@property (nonatomic, copy) headImageViewAction headImageViewActionBlock;

@end
