//
//  DZRecommendTableViewCell.h
//  DaZhePrivateHomeCuisineClient
//
//  Created by zouzhisheng on 14-12-11.
//  Copyright (c) 2014年 zouzhisheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DZHomeDataModel.h"
@interface DZRecommendTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UIImageView *imageview;
@property (weak, nonatomic) IBOutlet UIView *lineView;
@property (weak, nonatomic) IBOutlet UIScrollView *backScrollow;
-(void)loadData:(NSArray *)dataArray;
@end
