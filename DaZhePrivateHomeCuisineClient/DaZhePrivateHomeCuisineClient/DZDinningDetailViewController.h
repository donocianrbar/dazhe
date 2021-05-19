//
//  DZDinningDetailViewController.h
//  DaZhePrivateHomeCuisineClient
//
//  Created by zouzhisheng on 14-12-15.
//  Copyright (c) 2014年 zouzhisheng. All rights reserved.
//

#import "DZBaseViewController.h"
#import "DZRoomDetailTableViewCell.h"
#import "DZDeailDownTableViewCell.h"
@interface DZDinningDetailViewController : DZBaseViewController<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *listView;
@end
