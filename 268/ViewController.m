//
//  ViewController.m
//  268
//
//  Created by Eaph Sing on 2018/1/8.
//  Copyright © 2018年 Ray Wenderlich. All rights reserved.
//

#import "ViewController.h"
#import "SlideNav.h"
#import "UserIntroView.h"
#import "XLConst.h"
#import "Masonry.h"
#import "UserSettingViewController.h"

CGFloat const userIntroHeifht = 263;

@interface ViewController ()

@end

@implementation ViewController

- (void)settingAction {
    UserSettingViewController *vc = [UserSettingViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UserIntroView *userIntroView = [[UserIntroView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, userIntroHeifht)];
    [userIntroView setUserModel:nil];
    [self.view addSubview:userIntroView];
    
    UIButton *settingButton = [UIButton buttonWithType:0];
    UIImage *ic_settings_black_image = [UIImage imageNamed:@"ic_settings_black_"];
    [settingButton setBackgroundImage:[UIImage imageNamed:@"ic_settings_black_"] forState:UIControlStateNormal];
    [settingButton addTarget:self action:@selector(settingAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:settingButton];
    [settingButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(35);
        make.right.equalTo(self.view.mas_right).offset(-15);
        make.size.mas_equalTo(ic_settings_black_image.size);
    }];
    
    SlideNav *slideNav = [SlideNav slideNavViewWithTextColor:blackColor seletedColor:orangeColor frame:CGRectMake(0, userIntroHeifht, SCREEN_WIDTH, SCREEN_HEIGHT-userIntroHeifht-TabBar_HEIGHT)];
    [self.view addSubview:slideNav];
    
    //text github
    
    
    // success github  hahaha
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
