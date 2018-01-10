//
//  UserIntroView.m
//  268
//
//  Created by Eaph Sing on 2018/1/8.
//  Copyright © 2018年 Ray Wenderlich. All rights reserved.
//

#import "UserIntroView.h"
#import "UIColor+Extension.h"
#import "UIView+Layout.h"

@interface UserIntroView ()

@property (nonatomic, strong) UIImageView *backgroundImageView;
@property (nonatomic, strong) UILabel *userNameLabel;
@property (nonatomic, strong) UIImageView *headImageView;
@property (nonatomic, strong) UILabel *abstractLabel;
@property (nonatomic, strong) UILabel *memberAssetLabel;

@end

@implementation UserIntroView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *backgroundImageView = [UIImageView new];
        [self addSubview:backgroundImageView];
        UILabel *userNameLabel = [UILabel new];
        userNameLabel.textColor = [UIColor whiteColor];
        [self addSubview:userNameLabel];
        UIImageView *headImageView = [UIImageView new];
        headImageView.layer.cornerRadius = 50;
        headImageView.layer.masksToBounds = YES;
        [self addSubview:headImageView];
        UILabel *abstractLabel = [UILabel new];
        abstractLabel.font = [UIFont fontWithName:PingFang_SC_Medium size:13];
        abstractLabel.textColor = [UIColor hexStringToColor:grayColor];
        [self addSubview:abstractLabel];
        UILabel *memberAssetLabel = [UILabel new];
        memberAssetLabel.font = [UIFont fontWithName:PingFang_SC_Medium size:13];
        memberAssetLabel.textColor = [UIColor hexStringToColor:orangeColor];
        [self addSubview:memberAssetLabel];
        
        self.backgroundImageView = backgroundImageView;
        self.userNameLabel = userNameLabel;
        self.headImageView = headImageView;
        self.abstractLabel = abstractLabel;
        self.memberAssetLabel = memberAssetLabel;
    }
    return self;
}

- (void)setUserModel:(UserModel *)userModel {
    
    _userModel = userModel;
    
    self.backgroundImageView.backgroundColor = [UIColor blueColor];
    self.backgroundImageView.frame = self.frame;
    
    self.userNameLabel.text = @"我美不美";
    self.userNameLabel.frame = CGRectMake(0, 35, 0, 0);
    [self.userNameLabel sizeToFit];
    self.userNameLabel.centerX = self.centerX;
    
    self.headImageView.backgroundColor = [UIColor blackColor];
    self.headImageView.frame = CGRectMake(self.frame.size.width/2-50, CGRectGetMaxY(self.userNameLabel.frame)+28, 100, 100);
    self.headImageView.image = [UIImage imageNamed:@"girl.jpg"];
    
    self.abstractLabel.text = @"美不美 看大腿啊！";
    self.abstractLabel.frame = CGRectMake(0, CGRectGetMaxY(self.headImageView.frame)+17, 0, 0);
    [self.abstractLabel sizeToFit];
    self.abstractLabel.centerX = self.centerX;
    
    
    self.memberAssetLabel.text = @"砖石会员：123 >";
    self.memberAssetLabel.frame = CGRectMake(0, CGRectGetMaxY(self.abstractLabel.frame)+14, 0, 0);
    [self.memberAssetLabel sizeToFit];
    self.memberAssetLabel.centerX = self.centerX;
    
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
