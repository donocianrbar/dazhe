//
//  DZSiFangCaiInfoModel.h
//  DaZhePrivateHomeCuisineClient
//
//  Created by zouzhisheng on 15/1/31.
//  Copyright (c) 2015年 zouzhisheng. All rights reserved.
//（大哲推荐详细信息）

#import "Jastor.h"

@interface DZSiFangCaiInfoModel : Jastor
@property(nonatomic,strong)NSArray *SiFangCaiInfo;
@end

@interface DZSiFangCaiInfoSubModel : Jastor
@property(nonatomic,copy)NSString *articleid;
@property(nonatomic,copy)NSString *author;
@property(nonatomic,copy)NSString *subject;
@property(nonatomic,copy)NSString *dateline;
@property(nonatomic,copy)NSString *introduce;
@property(nonatomic,copy)NSString *content;
@property(nonatomic,copy)NSString *pageview;
@end