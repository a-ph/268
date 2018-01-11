//
//  LoginView.m
//  268
//
//  Created by Eaph Sing on 2018/1/11.
//  Copyright © 2018年 Ray Wenderlich. All rights reserved.
//

#import "LoginView.h"
#import "LoginTableView.h"

@interface LoginView ()

@property (nonatomic, strong) UIImageView *brandImageView;
@property (nonatomic, strong) UIButton *loginButton;
@property (nonatomic, strong) UIButton *registerButton;
@property (nonatomic, assign) XLTitleCountType titleCountType;
@property (nonatomic, strong) LoginTableView *tableView;
@property (nonatomic, strong) UIButton *forgetPassWordButton;
@property (nonatomic, strong) UIButton *loginBut;


@end

@implementation LoginView

- (instancetype)initWithTitleCountType:(XLTitleCountType)XLTitleCountType {
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        self.titleCountType = XLTitleCountType;
        
        UIImageView *brandImageView = [UIImageView new];
        brandImageView.image = [UIImage imageNamed:@"girl.jpg"];
        brandImageView.layer.cornerRadius = 33.5;
        brandImageView.layer.masksToBounds = YES;
        [self addSubview:brandImageView];
        self.brandImageView = brandImageView;
        
        if (XLTitleCountType == XLTitleCountTypeTwo) {
            UIButton *button1 = [UIButton underLineButtonWithTitle:@"账号登录"];
            [button1 setTitleColor:[UIColor hexStringToColor:orangeColor] forState:UIControlStateSelected];
            [button1 sizeToFit];
            [button1 addTarget:self action:@selector(loginAction) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:button1];
            self.loginButton = button1;
            
//            UIView *sepLineView = [UIView new];
//            sepLineView.backgroundColor = [UIColor hexStringToColor:@"#f7f7f7"];
//            [self addSubview:sepLineView];
//
//            sepLineView mas_makeConstraints:^(MASConstraintMaker *make) {
//                make.
//            }
            
            UIButton *button2 = [UIButton underLineButtonWithTitle:@"新用户注册"];
            [button2 setTitleColor:[UIColor hexStringToColor:orangeColor] forState:UIControlStateSelected];
            [button2 sizeToFit];
            [button2 addTarget:self action:@selector(registerAction) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:button2];
            self.registerButton = button2;
        } else {
            UIButton *button1 = [UIButton underLineButtonWithTitle:@"忘记密码"];
            [button1 setTitleColor:[UIColor hexStringToColor:orangeColor] forState:UIControlStateSelected];
            [button1 sizeToFit];
            [button1 addTarget:self action:@selector(loginAction) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:button1];
            self.loginButton = button1;
        }
        
        LoginTableView *tableView = [[LoginTableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        tableView.tableFooterView = [UIView new];
        tableView.array = @[@{@"image":@"girl.jpg",
                              @"text":@"请输入你的手机号"
                              },
                            @{@"image":@"girl.jpg",
                              @"text":@"请输入你的密码"
                              }];
        [self addSubview:tableView];
        self.tableView = tableView;
        
        UIButton *forgetPassWordButton = [UIButton underLineButtonWithTitle:@"忘记密码"];
        [forgetPassWordButton setTitleColor:[UIColor hexStringToColor:orangeColor] forState:UIControlStateNormal];
        [forgetPassWordButton addTarget:self action:@selector(forgetPassWordAction) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:forgetPassWordButton];
        [forgetPassWordButton sizeToFit];
        self.forgetPassWordButton = forgetPassWordButton;
        
        UIButton *loginButton = [UIButton buttonWithType:0];
        [loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [loginButton setBackgroundColor:[UIColor hexStringToColor:orangeColor]];
        [loginButton setTitle:@"登录" forState:0];
        [self addSubview:loginButton];
        self.loginBut = loginButton;
        
        
    }
    return self;
}

- (void)forgetPassWordAction {
    self.forgetPassWordActionBlock();
}

- (void)loginAction {
    self.tableView.array = @[@{@"image":@"girl.jpg",
                          @"text":@"请输入你的手机号"
                          },
                        @{@"image":@"girl.jpg",
                          @"text":@"请输入你的密码"
                          }];
    [self.tableView reloadData];
}

- (void)registerAction {
    self.tableView.array = @[@{@"image":@"girl.jpg",
                          @"text":@"请输入你的手机号"
                          },
                        @{@"image":@"girl.jpg",
                          @"text":@"请输入短信验证码"
                          },
                             @{@"image":@"girl.jpg",
                               @"text":@"请设置6-18密码"
                               },
                             @{@"image":@"girl.jpg",
                               @"text":@"再次确认密码"
                               }];
    [self.tableView reloadData];
}

- (void)drawRect:(CGRect)rect {
    [_brandImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).with.offset(20);
        make.centerX.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(67, 67));
    }];
    
    if (_titleCountType == XLTitleCountTypeTwo) {
        [self.loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_brandImageView.mas_bottom).with.offset(37.5);
            make.centerX.equalTo(self.mas_centerX).with.offset(-SCREEN_WIDTH/4);
        }];
        
        [self.registerButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_brandImageView.mas_bottom).with.offset(37.5);
            make.centerX.equalTo(self.mas_centerX).with.offset(SCREEN_WIDTH/4);
        }];
    } else {
        self.forgetPassWordButton.hidden = YES;
        [self.loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_brandImageView.mas_bottom).with.offset(37.5);
            make.centerX.equalTo(self.mas_centerX);
        }];
    }
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.loginButton.mas_bottom).with.offset(39);
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.height.mas_equalTo(200);
    }];
    
    [self.forgetPassWordButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.tableView.mas_bottom).with.offset(20);
        make.right.equalTo(self.mas_right).with.offset(-25);
    }];
    
    [self.loginBut mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.mas_bottom).with.offset(-50);
        make.size.mas_equalTo(CGSizeMake(300, 44));
        make.centerX.equalTo(self);
    }];
    
}


@end
