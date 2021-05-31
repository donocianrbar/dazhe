//
//  DZDaZheTableViewCell.h
//  DaZhePrivateHomeCuisineClient
//
//  Created by zouzhisheng on 14-12-11.
//  Copyright (c) 2014年 zouzhisheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DZHomeDataModel.h"
@interface DZDaZheTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *dinnerImageView;
@property (weak, nonatomic) IBOutlet UILabel *namelabel;

@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *telLabel;
-(void)loadData:(DZZheKouInfoModel*)model;
@end
