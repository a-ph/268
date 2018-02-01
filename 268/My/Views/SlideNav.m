//
//  SlideNav.m
//  268
//
//  Created by Eaph Sing on 2018/1/8.
//  Copyright © 2018年 Ray Wenderlich. All rights reserved.
//

#import "SlideNav.h"
#import "HeadlineCollectionCell.h"
#import "HeadlineModel.h"
#import "contentCollectionCell.h"
#import "BookModel.h"
#import "UIColor+Extension.h"

static NSString *const headlineCellID = @"headlineCellID";
static NSString *const contentCellID = @"contentCellID";

@interface SlideNav () <UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic, copy) NSString *textColor;
@property (nonatomic, copy) NSString *seletedTextColor;
@property (nonatomic, strong) NSMutableArray *headlineArray;
@property (nonatomic, strong) UICollectionView *headlineCollectionView;
@property (nonatomic, strong) UICollectionView *contentCollectionView;

@end

@implementation SlideNav

- (NSMutableArray *)createHeadlineArray {
    NSArray *arr = @[@"我的书架",@"已购专区",@"关注收藏",@"文章笔记",@"社区互动"];
    NSMutableArray *tempArray = [NSMutableArray new];
    for (NSInteger i = 0; i < 5; i++) {
        HeadlineModel *model = [[HeadlineModel alloc] init];
        model.text = arr[i];
        model.isSeleted = false;
        if (i == 0) {
            model.isSeleted = YES;
        }
        [tempArray addObject:model];
    }
    return tempArray;
}

- (instancetype)initWithTextColor:(NSString *)textColor seletedColor:(NSString *)seletedColor frame:(CGRect)frame
{
    self = [super init];
    if (self) {
        self.frame = frame;
        
        self.headlineArray = [self createHeadlineArray];
        
        self.textColor = textColor;
        self.seletedTextColor = seletedColor;
        
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        flowLayout.minimumLineSpacing = 0.00000001;
        flowLayout.minimumInteritemSpacing = 0.00000001;
        flowLayout.itemSize = CGSizeMake(self.frame.size.width/5, 50);
        flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        UICollectionView *headlineCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 50) collectionViewLayout:flowLayout];
        headlineCollectionView.backgroundColor = [UIColor whiteColor];
        headlineCollectionView.dataSource = self;
        headlineCollectionView.delegate = self;
        [self addSubview:headlineCollectionView];
        self.headlineCollectionView = headlineCollectionView;
        [headlineCollectionView registerClass:[HeadlineCollectionCell class] forCellWithReuseIdentifier:headlineCellID];
        
        UIView *seqline = [UIView new];
        seqline.backgroundColor = [UIColor hexStringToColor:@"#f3f5f7"];
        seqline.frame = CGRectMake(0, 50, self.frame.size.width, 1);
        [self addSubview:seqline];
        
        UICollectionViewFlowLayout *flowLayout2 = [[UICollectionViewFlowLayout alloc] init];
        flowLayout2.itemSize = CGSizeMake(self.frame.size.width/3, 274);
        flowLayout2.minimumLineSpacing = 0.00000000;
        flowLayout2.minimumInteritemSpacing = 0.00000000;
        flowLayout2.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        UICollectionView *contentCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 51, self.frame.size.width, self.frame.size.height-51) collectionViewLayout:flowLayout2];
        contentCollectionView.showsVerticalScrollIndicator = NO;
        contentCollectionView.backgroundColor = [UIColor whiteColor];
        contentCollectionView.dataSource = self;
        contentCollectionView.delegate = self;
        [self addSubview:contentCollectionView];
        self.contentCollectionView = contentCollectionView;
        
        [contentCollectionView registerClass:[contentCollectionCell class] forCellWithReuseIdentifier:contentCellID];
    }
    return self;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell;
    if (collectionView == self.headlineCollectionView) {
        HeadlineCollectionCell *headlineCell = [collectionView dequeueReusableCellWithReuseIdentifier:headlineCellID forIndexPath:indexPath];
        HeadlineModel *model = self.headlineArray[indexPath.item];
        [headlineCell setHeadlineModel:model];
        cell = headlineCell;
    } else {
        contentCollectionCell *contentCell = [collectionView dequeueReusableCellWithReuseIdentifier:contentCellID forIndexPath:indexPath];
        BookModel *model = [BookModel new];
        model.bookImage = @"bookimage";
        model.bookAuther = @"123";
        [contentCell setBookModel:model];
        cell = contentCell;
    }
    
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSInteger count;
    if (collectionView == self.headlineCollectionView) {
        count = 5;
    } else {
        count = 5;
    }
    return count;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"1");
    if (collectionView == self.headlineCollectionView) {
        for (NSInteger i = 0; i<self.headlineArray.count; i++) {
            HeadlineModel *model = self.headlineArray[i];
            if (model.isSeleted) {
                [self collectionView:collectionView didDeselectItemAtIndexPath:[NSIndexPath indexPathForItem:i inSection:0]];
            }
        }
        
        HeadlineModel *model = self.headlineArray[indexPath.item];
        model.isSeleted = YES;
        self.headlineArray[indexPath.item] = model;
        HeadlineCollectionCell *cell = (HeadlineCollectionCell *)[collectionView cellForItemAtIndexPath:indexPath];
        [cell setHeadlineModel:model];
        
        //    每个标签下的请求.... 请求完刷新数据，保存数据
        
        //    [self.contentCollectionView reloadData];
    }
    
    
    
}
- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"2");
    if (collectionView == self.headlineCollectionView) {
        HeadlineModel *model = self.headlineArray[indexPath.item];
        model.isSeleted = NO;
        self.headlineArray[indexPath.item] = model;
        HeadlineCollectionCell *cell = (HeadlineCollectionCell *)[collectionView cellForItemAtIndexPath:indexPath];
        [cell setHeadlineModel:model];
    }

}

+ (instancetype)slideNavViewWithTextColor:(NSString *)textColor seletedColor:(NSString *)seletedColor frame:(CGRect)frame {
    return [[self alloc] initWithTextColor:textColor seletedColor:seletedColor frame:frame];
}

@end
