//
//  UserSettingTableViewCell.m
//  268
//
//  Created by Eaph Sing on 2018/1/10.
//  Copyright © 2018年 Ray Wenderlich. All rights reserved.
//

#import "UserSettingTableViewCell.h"
#import "UIColor+Extension.h"
#import "Masonry.h"
#import "XLConst.h"

@implementation UserSettingTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UILabel *titleLabel = [UILabel new];
        titleLabel.font = [UIFont systemFontOfSize:14];
        titleLabel.textColor = [UIColor hexStringToColor:Color333333];
        [self.contentView addSubview:titleLabel];
        UILabel *contentLabel = [UILabel new];
        contentLabel.font = [UIFont systemFontOfSize:14];
        contentLabel.textColor = [UIColor hexStringToColor:Color666666];
        [self.contentView addSubview:contentLabel];
        
        self.titleLabel = titleLabel;
        self.contentLabel = contentLabel;
        
        
    }
    return self;
}

- (void)setModel:(id)model {
    _model = model;
    
    self.titleLabel.text = @"title";
    self.contentLabel.text = @"content";
    [self.titleLabel sizeToFit];
    [self.contentLabel sizeToFit];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(@(leftSpace));
        make.centerY.equalTo(self.contentView);
    }];
    
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.contentView);
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
