//
//  CustomMenuView.h
//  DaZhePrivateHomeCuisineClient
//
//  Created by zouzhisheng on 14-12-14.
//  Copyright (c) 2014年 zouzhisheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomMenuView : UIView<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)NSArray *titles;
@property(nonatomic,strong)UIView *lineView;
@property(nonatomic,strong)UITableView *menuListView;
- (id)initWithFrame:(CGRect)frame WithTitleArray:(NSArray *)titles;
@end
