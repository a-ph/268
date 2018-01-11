//
//  ForgetPassWordViewController.m
//  268
//
//  Created by Eaph Sing on 2018/1/11.
//  Copyright © 2018年 Ray Wenderlich. All rights reserved.
//

#import "ForgetPassWordViewController.h"
#import "LoginView.h"

@interface ForgetPassWordViewController ()

@end

@implementation ForgetPassWordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    LoginView *loginView = [[LoginView alloc] initWithTitleCountType:XLTitleCountTypeOne];
    loginView.frame = CGRectMake(15, 15, SCREEN_WIDTH-30, SCREEN_HEIGHT-30);
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
