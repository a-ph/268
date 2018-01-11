//
//  contentCollectionCell.m
//  268
//
//  Created by Eaph Sing on 2018/1/8.
//  Copyright © 2018年 Ray Wenderlich. All rights reserved.
//

#import "contentCollectionCell.h"
#import "UIColor+Extension.h"

@interface contentCollectionCell ()

@property (nonatomic, strong) UIImageView *bookImageView;
@property (nonatomic, strong) UILabel *bookNameLabel;
@property (nonatomic, strong) UILabel *bookAuthorLabel;
@property (nonatomic, strong) UILabel *readedLabel;

@end

@implementation contentCollectionCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *bookImageView = [UIImageView new];
        [self.contentView addSubview:bookImageView];
        UILabel *bookNameLabel = [UILabel new];
        bookNameLabel.numberOfLines = 2;
        bookNameLabel.font = [UIFont fontWithName:PingFang_SC_Medium size:14];
        bookNameLabel.textColor = [UIColor hexStringToColor:blackColor];
        [self.contentView addSubview:bookNameLabel];
        UILabel *bookAuthorLabel = [UILabel new];
        bookAuthorLabel.font = [UIFont fontWithName:PingFang_SC_Medium size:13];
        bookAuthorLabel.textColor = [UIColor hexStringToColor:grayColor];
        [self.contentView addSubview:bookAuthorLabel];
        UILabel *readedLabel = [UILabel new];
        readedLabel.font = [UIFont fontWithName:PingFang_SC_Medium size:12];
        readedLabel.textColor = [UIColor hexStringToColor:orangeColor];
        [self.contentView addSubview:readedLabel];
        self.bookImageView = bookImageView;
        self.bookNameLabel = bookNameLabel;
        self.bookAuthorLabel = bookAuthorLabel;
        self.readedLabel = readedLabel;
    }
    return self;
}

- (void)setBookModel:(BookModel *)bookModel {
    _bookModel = bookModel;
    
//    self.bookImageView sd_image.....
    self.bookImageView.frame = CGRectMake(15, 15, self.frame.size.width-30, 129.5);
    self.bookImageView.backgroundColor = [UIColor redColor];
    self.bookNameLabel.text = @"十万个为什么哈哈哈哈哈";
    self.bookNameLabel.frame = CGRectMake(15, CGRectGetMaxY(self.bookImageView.frame)+15, self.frame.size.width-30, 0);
    [self.bookNameLabel sizeToFit];
    self.bookAuthorLabel.text = @"你猜";
    self.bookAuthorLabel.frame = CGRectMake(15, CGRectGetMaxY(self.bookNameLabel.frame)+15, self.frame.size.width-30, 0);
    [self.bookAuthorLabel sizeToFit];
    self.readedLabel.text = @"已读35%";
    self.readedLabel.frame = CGRectMake(15, CGRectGetMaxY(self.bookAuthorLabel.frame)+15, self.frame.size.width-30, 0);
    [self.readedLabel sizeToFit];
    
    self.height = CGRectGetMaxY(self.readedLabel.frame);
}

@end
