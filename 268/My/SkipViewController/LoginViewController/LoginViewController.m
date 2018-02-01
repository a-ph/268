//
//  LoginViewController.m
//  268
//
//  Created by Eaph Sing on 2018/1/11.
//  Copyright © 2018年 Ray Wenderlich. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginView.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    NSString *title;
    switch (self.loginType) {
        case XLLoginTypeLoginRegister:
            title = @"登录";
            break;
        case XLLoginTypeForgetPassWord:
            title = @"忘记密码";
            break;
        case XLLoginTypeNewPassWord:
            title = @"设置新密码";
            break;
            
        default:
            break;
    }
    self.title = title;
    
    [self creatUI];
}

- (void)creatUI {
    self.view.backgroundColor = [UIColor hexStringToColor:@"#f7f7f7"];
    
    LoginView *loginView = [[LoginView alloc] initWithTitleCountType:self.loginType];
    loginView.forgetPassWordActionBlock = ^{
        LoginViewController *loginVC = [[LoginViewController alloc] init];
        loginVC.loginType = XLLoginTypeForgetPassWord;
        [self.navigationController pushViewController:loginVC animated:YES];
    };
    loginView.nextActionBlock = ^(XLLoginType loginType) {
        switch (loginType) {
            case XLLoginTypeNewPassWord:
                [self.navigationController popToRootViewControllerAnimated:YES];
                break;
            case XLLoginTypeForgetPassWord: {
                LoginViewController *loginVC = [[LoginViewController alloc] init];
                loginVC.loginType = XLLoginTypeNewPassWord;
                [self.navigationController pushViewController:loginVC animated:YES];
            }
                break;
            case XLLoginTypeLoginRegister:
                [self dismissViewControllerAnimated:YES completion:nil];
                break;
                
            default:
                break;
        }
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
