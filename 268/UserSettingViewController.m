//
//  UserSettingViewController.m
//  268
//
//  Created by Eaph Sing on 2018/1/10.
//  Copyright © 2018年 Ray Wenderlich. All rights reserved.
//

#import "UserSettingViewController.h"
#import "UserSettingTableViewCell.h"
#import "Masonry.h"
#import "XLConst.h"
#import "UIColor+Extension.h"

NSString *const cellID = @"cellID";

@interface UserSettingViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation UserSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createUI];
}

- (void)navBack {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)createUI {
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *backButton = [UIButton buttonWithType:0];
    UIImage *backButtonImage = [UIImage imageNamed:@"ic_arrow_back_black_48dp"];
    [backButton setBackgroundImage:backButtonImage forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(navBack) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backButton];
    [backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(@(leftSpace));
        make.top.mas_equalTo(@35);
        make.size.mas_equalTo(backButtonImage.size);
    }];
    
    UIImageView *backgroundImageView = [UIImageView new];
    [self.view addSubview:backgroundImageView];
    
    UIImageView *headImageView = [UIImageView new];
    headImageView.layer.cornerRadius = 50;
    headImageView.layer.masksToBounds = YES;
    [self.view addSubview:headImageView];
    
    headImageView.image = [UIImage imageNamed:@"girl.jpg"];
    [headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(100, 100));
        make.top.mas_equalTo(@80);
        make.centerX.equalTo(self.view);
    }];
    
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 205, SCREEN_WIDTH, SCREEN_HEIGHT-205-TabBar_HEIGHT) style:UITableViewStylePlain];
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
    
    [tableView registerClass:[UserSettingTableViewCell class] forCellReuseIdentifier:cellID];
    
    UIButton *saveButton = [UIButton buttonWithType:0];
    [saveButton setTitle:@"保存" forState:UIControlStateNormal];
    [saveButton setBackgroundColor:[UIColor orangeColor]];
    [self.view addSubview:saveButton];
    [saveButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(tableView.mas_bottom);
        make.left.equalTo(self.view.mas_left);
        make.bottom.equalTo(self.view.mas_bottom);
        make.right.equalTo(self.view.mas_right);
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UserSettingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    [cell setModel:nil];
    return cell;
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
