//
//  DZRestautantModel.h
//  DaZhePrivateHomeCuisineClient
//
//  Created by zouzhisheng on 15/1/31.
//  Copyright (c) 2015年 zouzhisheng. All rights reserved.
//（餐厅查询）&&根据查询参数获取搜索信息的接口

#import "Jastor.h"

@interface DZRestautantModel : Jastor
@property(nonatomic,strong)NSArray *subjectInfo;
@end


@interface DZSubRestautantModel : Jastor
@property(nonatomic,copy)NSString *c_zan;
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *sid;
@property(nonatomic,copy)NSString *thumb;
@end