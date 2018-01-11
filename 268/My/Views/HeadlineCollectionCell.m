//
//  HeadlineCollectionCell.m
//  268
//
//  Created by Eaph Sing on 2018/1/8.
//  Copyright © 2018年 Ray Wenderlich. All rights reserved.
//

#import "HeadlineCollectionCell.h"
#import "HeadlineModel.h"
#import "UIColor+Extension.h"

@interface HeadlineCollectionCell ()

@property (nonatomic, strong) UILabel *headlineLabel;
@property (nonatomic, strong) UIView *bottomlineView;

@end

@implementation HeadlineCollectionCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

        UILabel *headlineLabel = [[UILabel alloc] init];
        headlineLabel.font = [UIFont fontWithName:PingFang_SC_Medium size:14];
        headlineLabel.textColor = [UIColor hexStringToColor:blackColor];
        [self.contentView addSubview:headlineLabel];
        self.headlineLabel = headlineLabel;
        
        UIView *bottomlineView = [UIView new];
        bottomlineView.hidden = YES;
        bottomlineView.frame = CGRectMake(self.frame.size.width/2-10, 50-2, 20, 2);
        bottomlineView.backgroundColor = [UIColor hexStringToColor:orangeColor];
        [self.contentView addSubview:bottomlineView];
        self.bottomlineView = bottomlineView;
    }
    return self;
}

- (void)setHeadlineModel:(HeadlineModel *)headlineModel {
    self.headlineLabel.text = headlineModel.text;
    [self.headlineLabel sizeToFit];
    self.headlineLabel.center = self.contentView.center;
    
    if (headlineModel.isSeleted) {
        self.bottomlineView.hidden = NO;
        self.headlineLabel.textColor = [UIColor hexStringToColor:orangeColor];
    }else {
        self.bottomlineView.hidden = YES;
        self.headlineLabel.textColor = [UIColor hexStringToColor:blackColor];
    }
}

@end
