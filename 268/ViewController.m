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

CGFloat const userIntroHeifht = 263;

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UserIntroView *userIntroView = [[UserIntroView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, userIntroHeifht)];
    [userIntroView setUserModel:nil];
    [self.view addSubview:userIntroView];
    
    SlideNav *slideNav = [SlideNav slideNavViewWithTextColor:blackColor seletedColor:orangeColor frame:CGRectMake(0, userIntroHeifht, SCREEN_WIDTH, SCREEN_HEIGHT-userIntroHeifht-TabBar_HEIGHT)];
    [self.view addSubview:slideNav];
    
    //text github
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
