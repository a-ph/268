//
//  LoginViewController.m
//  268
//
//  Created by Eaph Sing on 2018/1/11.
//  Copyright © 2018年 Ray Wenderlich. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginView.h"
#import "ForgetPassWordViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self creatUI];
}

- (void)creatUI {
    LoginView *loginView = [[LoginView alloc] initWithTitleCountType:XLTitleCountTypeTwo];
    loginView.frame = CGRectMake(15, 15, SCREEN_WIDTH-30, SCREEN_HEIGHT-30);
    loginView.forgetPassWordActionBlock = ^{
        [self presentViewController:[ForgetPassWordViewController new] animated:YES completion:nil];
    };
    [self.view addSubview:loginView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
