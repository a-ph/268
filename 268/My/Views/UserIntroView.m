//
//  UserIntroView.m
//  268
//
//  Created by Eaph Sing on 2018/1/8.
//  Copyright © 2018年 Ray Wenderlich. All rights reserved.
//

#import "UserIntroView.h"
#import "UIColor+Extension.h"
#import "Masonry.h"

@interface UserIntroView ()

@property (nonatomic, strong) UIImageView *backgroundImageView;
@property (nonatomic, strong) UILabel *userNameLabel;
@property (nonatomic, strong) UIImageView *headImageView;
@property (nonatomic, strong) UILabel *abstractLabel;
@property (nonatomic, strong) UILabel *memberAssetLabel;

@end

@implementation UserIntroView

- (void)headImageViewAction {
    self.headImageViewActionBlock();
}

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
        headImageView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(headImageViewAction)];
        [headImageView addGestureRecognizer:tap];
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
    
    self.backgroundImageView.backgroundColor = [UIColor grayColor];
//    self.backgroundImageView.image = [UIImage imageNamed:@"pexels-photo-257849.jpeg"];
    self.backgroundImageView.frame = self.frame;

    self.userNameLabel.text = @"我美不美";
    [self.userNameLabel sizeToFit];
    [self.userNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(35);
    }];
    
    self.headImageView.image = [UIImage imageNamed:@"girl.jpg"];
    [self.headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(100, 100));
        make.top.equalTo(self.userNameLabel.mas_bottom).offset(28);
    }];
    
    self.abstractLabel.text = @"美不美 看大腿啊！";
    [self.abstractLabel sizeToFit];
    [self.abstractLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headImageView.mas_bottom).offset(17);
    }];
    
    self.memberAssetLabel.text = @"砖石会员：123 >";
    [self.memberAssetLabel sizeToFit];
    [self.memberAssetLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.abstractLabel.mas_bottom).offset(14);
        make.centerX.equalTo(@[self, self.userNameLabel, self.headImageView, self.abstractLabel]);
    }];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
