//
//  DZDiningRoomSearchViewController.h
//  DaZhePrivateHomeCuisineClient
//
//  Created by zouzhisheng on 14-12-9.
//  Copyright (c) 2014年 zouzhisheng. All rights reserved.
//

#import "DZBaseViewController.h"
#import "CustomMenuView.h"
#import "DZDinningRoomTableViewCell.h"
#import "DZDinningDetailViewController.h"
@interface DZDiningRoomSearchNav : UINavigationController
@end

@interface DZDiningRoomSearchViewController : DZBaseViewController<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *diningRoomListView;
@property(nonatomic,strong)CustomMenuView *menuView;
@end
