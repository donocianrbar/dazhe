//
//  DZAdvertisementTableViewCell.h
//  DaZhePrivateHomeCuisineClient
//
//  Created by zouzhisheng on 14-12-11.
//  Copyright (c) 2014年 zouzhisheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DZAdvertisementTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *backImageView;
-(void)loadImageUrlStr:(NSString *)urlStr;
@end
