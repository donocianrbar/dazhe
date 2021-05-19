//
//  DZPrivateHomeCuisineViewController.h
//  DaZhePrivateHomeCuisineClient
//
//  Created by zouzhisheng on 14-12-9.
//  Copyright (c) 2014年 zouzhisheng. All rights reserved.
//

#import "DZBaseViewController.h"
#import "DZHeadTableViewCell.h"
#import "DZListTableViewCell.h"
@interface DZPrivateHomeCuisineNav : UINavigationController
@end
@interface DZPrivateHomeCuisineViewController : DZBaseViewController<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView *listView;
@end
