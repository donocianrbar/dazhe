//
//  DZSubjectTuijianInfoModel.h
//  DaZhePrivateHomeCuisineClient
//
//  Created by zouzhisheng on 15/2/1.
//  Copyright (c) 2015年 zouzhisheng. All rights reserved.
//获取大哲推荐信息的接口

#import "Jastor.h"

@interface DZSubjectTuijianInfoModel : Jastor
@property(nonatomic,strong)NSArray *subjectTuijianInfo;
@end
/**
 c_tuijian": "a:1:{i:0;s:12:'大哲推荐';}",
 "name": "阿福熏酱小酒馆",
 "sid": "16",
 "thumb": "uploads/pictures/2014-12/thumb_61_1418434969.jpg",
 **/
@interface DZSubjectTuijianInfoSubModel : Jastor
@property(nonatomic,copy)NSString *c_tuijian;
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *sid;
@property(nonatomic,copy)NSString *thumb;
@end