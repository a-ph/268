//
//  LoginTableViewCell.m
//  268
//
//  Created by Eaph Sing on 2018/1/11.
//  Copyright © 2018年 Ray Wenderlich. All rights reserved.
//

#import "LoginTableViewCell.h"

@interface LoginTableViewCell ()

@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UITextField *textField;

@end

@implementation LoginTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UIImageView *iconImageView = [UIImageView new];
        [self.contentView addSubview:iconImageView];
        self.iconImageView = iconImageView;
        
        UITextField *textField = [UITextField new];
        [self.contentView addSubview:textField];
        self.textField = textField;
    }
    return self;
}

- (void)setDic:(NSDictionary *)dic {
    UIImage *image = [UIImage imageNamed:dic[@"image"]];
    self.iconImageView.image = image;
    self.textField.placeholder = dic[@"text"];
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(25);
        make.centerY.equalTo(self.contentView);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconImageView.mas_right).with.offset(18);
        make.centerY.equalTo(self.contentView);
        make.right.equalTo(self.contentView);
        make.height.mas_equalTo(50);
    }];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
