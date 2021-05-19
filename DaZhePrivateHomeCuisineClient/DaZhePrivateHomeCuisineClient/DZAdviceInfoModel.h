//
//  DZAdviceInfoModel.h
//  DaZhePrivateHomeCuisineClient
//
//  Created by zouzhisheng on 15/2/1.
//  Copyright (c) 2015年 zouzhisheng. All rights reserved.
//获取广告位置信息

#import "Jastor.h"

@interface DZAdviceInfoModel : Jastor
@property(nonatomic,strong)NSArray *adviceInfo;
@end

@interface DZAdviceInfoSubModel : Jastor
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *content;
@end