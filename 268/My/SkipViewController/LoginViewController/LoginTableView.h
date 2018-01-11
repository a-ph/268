//
//  LoginTableView.h
//  268
//
//  Created by Eaph Sing on 2018/1/11.
//  Copyright © 2018年 Ray Wenderlich. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginTableView : UITableView <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, copy) NSArray *array;

@end
