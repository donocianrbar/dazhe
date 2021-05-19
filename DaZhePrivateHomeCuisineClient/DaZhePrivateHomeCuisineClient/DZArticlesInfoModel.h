//
//  DZArticlesInfoModel.h
//  DaZhePrivateHomeCuisineClient
//
//  Created by zouzhisheng on 15/1/31.
//  Copyright (c) 2015年 zouzhisheng. All rights reserved.
//（大哲推荐首页）包含一级分类下的名称，总计菜谱，以及图片信息

#import "Jastor.h"

@interface DZArticlesInfoModel : Jastor
@property(nonatomic,strong)NSArray *SiFangCaiHomeInfo;
@end

@interface DZArticlesInfoSubModel : Jastor
@property(nonatomic,copy)NSString *catid;
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *picture;
@property(nonatomic,copy)NSString *total;
@end