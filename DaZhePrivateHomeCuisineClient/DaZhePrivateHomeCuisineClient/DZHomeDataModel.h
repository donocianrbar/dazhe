//
//  DZHomeDataModel.h
//  DaZhePrivateHomeCuisineClient
//
//  Created by zouzhisheng on 15/1/31.
//  Copyright (c) 2015年 zouzhisheng. All rights reserved.
//获取首页信息

#import <Foundation/Foundation.h>
@interface DZHomeDataModel : Jastor
@property(nonatomic,strong)NSArray *bcastrPicInfo; //首页轮播图
@property(nonatomic,strong)NSArray *bcastrPicInfo1;
@property(nonatomic,strong)NSArray *RestaurantInfo;
@property(nonatomic,strong)NSArray *ZheKouInfo;
@end


@interface DZAlternationItemModel : Jastor
@property(nonatomic,copy)NSString *available;;
@property(nonatomic,copy)NSString *bcastr_id;
@property(nonatomic,copy)NSString *groupname;
@property(nonatomic,copy)NSString *item_url;
@property(nonatomic,copy)NSString *itemtitle;
@property(nonatomic,copy)NSString *link;
@end


@interface DZRestaurantinfoModel : Jastor
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *sid;
@property(nonatomic,copy)NSString *thumb;
@end


@interface DZZheKouInfoModel : Jastor
@property(nonatomic,copy)NSString *address;
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *sid;
@property(nonatomic,copy)NSString *tel1;
@property(nonatomic,copy)NSString *tel2;
@property(nonatomic,copy)NSString *thumb;
@end






