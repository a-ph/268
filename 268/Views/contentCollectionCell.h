//
//  contentCollectionCell.h
//  268
//
//  Created by Eaph Sing on 2018/1/8.
//  Copyright © 2018年 Ray Wenderlich. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BookModel;

@interface contentCollectionCell : UICollectionViewCell

@property (nonatomic, strong) BookModel *bookModel;
@property (nonatomic, assign) NSInteger height;

@end
