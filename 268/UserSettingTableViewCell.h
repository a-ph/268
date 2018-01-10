//
//  UserSettingTableViewCell.h
//  268
//
//  Created by Eaph Sing on 2018/1/10.
//  Copyright © 2018年 Ray Wenderlich. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserSettingTableViewCell : UITableViewCell

@property (nonatomic, copy) id model;

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *contentLabel;

@end
