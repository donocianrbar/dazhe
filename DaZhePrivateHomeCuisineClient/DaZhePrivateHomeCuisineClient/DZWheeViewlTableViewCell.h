//
//  DZWheeViewlTableViewCell.h
//  DaZhePrivateHomeCuisineClient
//
//  Created by zouzhisheng on 14-12-11.
//  Copyright (c) 2014年 zouzhisheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SGFocusImageFrame.h"
#import "SGFocusImageItem.h"
#import "DZHomeDataModel.h"
@interface DZWheeViewlTableViewCell : UITableViewCell<SGFocusImageFrameDelegate>
-(void)loadData:(NSArray*)models;
@end
