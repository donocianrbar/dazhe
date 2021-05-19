//
//  DZHomeViewController.h
//  DaZhePrivateHomeCuisineClient
//
//  Created by zouzhisheng on 14-12-9.
//  Copyright (c) 2014年 zouzhisheng. All rights reserved.
//

#import "DZBaseViewController.h"
#import "MALTabBarViewController.h"
#import "DZHomeDataModel.h"
@interface DZHomeViewController : DZBaseViewController<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)UIView *homeNavView;
@property (nonatomic,strong)MALTabBarViewController *tabBarController;
@property (nonatomic,strong)UITableView *listView;
@property (nonatomic,strong)DZHomeDataModel *homeDataModel;
-(void)toTabarViewAction:(int)tag;
@end
