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
@property (nonatomic, assign) XLLoginType loginType;
@property (nonatomic, strong) LoginTableView *tableView;
@property (nonatomic, strong) UIButton *forgetPassWordButton;
@property (nonatomic, strong) UIButton *loginBut;


@end

@implementation LoginView

- (instancetype)initWithTitleCountType:(XLLoginType)loginType {
    self = [super init];
    if (self) {
        
        self.frame = CGRectMake(15, 15 + NavBar_HEIGHT + StatusBarHeight, SCREEN_WIDTH-30, SCREEN_HEIGHT-30 - NavBar_HEIGHT- StatusBarHeight);
        self.backgroundColor = [UIColor whiteColor];
        
        self.loginType = loginType;
        
        UIImageView *brandImageView = [UIImageView new];
        brandImageView.image = [UIImage imageNamed:@"girl.jpg"];
        brandImageView.layer.cornerRadius = 33.5;
        brandImageView.layer.masksToBounds = YES;
        [self addSubview:brandImageView];
        self.brandImageView = brandImageView;
        
        if (loginType == XLLoginTypeLoginRegister) {
            UIButton *button1 = [UIButton underLineButtonWithTitle:@"账号登录"];
            [button1 setTitleColor:[UIColor hexStringToColor:orangeColor] forState:UIControlStateSelected];
            [button1 sizeToFit];
            [button1 addTarget:self action:@selector(loginAction) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:button1];
            button1.selected = YES;
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
            button1.selected = YES;
            [button1 sizeToFit];
            [self addSubview:button1];
            self.loginButton = button1;
        }
        
        LoginTableView *tableView = [[LoginTableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        [tableView setAllowsSelection:NO];
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
        forgetPassWordButton.selected = YES;
        [forgetPassWordButton addTarget:self action:@selector(forgetPassWordAction) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:forgetPassWordButton];
        [forgetPassWordButton sizeToFit];
        self.forgetPassWordButton = forgetPassWordButton;
        
        UIButton *loginButton = [UIButton buttonWithType:0];
        [loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [loginButton setBackgroundColor:[UIColor hexStringToColor:orangeColor]];
        [loginButton setTitle:@"登录" forState:0];
        [loginButton addTarget:self action:@selector(nextClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:loginButton];
        self.loginBut = loginButton;
        
        
    }
    return self;
}

- (void)nextClick {
    switch (self.loginType) {
        case XLLoginTypeNewPassWord:
            
            break;
        case XLLoginTypeForgetPassWord:
            
            break;
        case XLLoginTypeLoginRegister:
            
            break;
            
        default:
            self.nextActionBlock(self.loginType);
            break;
    }
    self.nextActionBlock(self.loginType);
}

- (void)forgetPassWordAction {
    self.forgetPassWordActionBlock();
}

- (void)loginAction {
    if (self.loginButton.selected) {
        return;
    }
    self.registerButton.selected = NO;
    self.loginButton.selected = YES;
    self.tableView.array = @[@{@"image":@"girl.jpg",
                          @"text":@"请输入你的手机号"
                          },
                        @{@"image":@"girl.jpg",
                          @"text":@"请输入你的密码"
                          }];
    [self.tableView reloadData];
}

- (void)registerAction {
    if (self.registerButton.selected) {
        return;
    }
    self.registerButton.selected = YES;
    self.loginButton.selected = NO;
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
    
    if (self.loginType == XLLoginTypeLoginRegister) {
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
        [self.loginBut setTitle:@"下一步" forState:UIControlStateNormal];
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
    self.loginBut.layer.cornerRadius = 22;
}


@end
