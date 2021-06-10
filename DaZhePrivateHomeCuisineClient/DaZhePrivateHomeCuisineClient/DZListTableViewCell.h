//
//  DZListTableViewCell.h
//  DaZhePrivateHomeCuisineClient
//
//  Created by zouzhisheng on 14-12-16.
//  Copyright (c) 2014年 zouzhisheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DZArticlesInfoModel.h"
@interface DZListTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
-(void)loaddata:(DZArticlesInfoSubModel *)model;
@end
