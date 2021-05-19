//
//  DZCategoryInfoModel.h
//  DaZhePrivateHomeCuisineClient
//
//  Created by zouzhisheng on 15/1/31.
//  Copyright (c) 2015年 zouzhisheng. All rights reserved.
//（大哲推荐分类信息）

#import "Jastor.h"

@interface DZCategoryInfoModel : Jastor
@property(nonatomic,strong)NSArray *SiFangCaiCategoryInfo;
@end



@interface DZCategoryInfoSubModel : Jastor
@property(nonatomic,copy)NSString *articleid;
@property(nonatomic,copy)NSString *author;
@property(nonatomic,copy)NSString *category_name;
@property(nonatomic,copy)NSString *catid;
@property(nonatomic,copy)NSString *introduce;
@property(nonatomic,copy)NSString *pid;
@property(nonatomic,copy)NSString *pname;
@property(nonatomic,copy)NSString *subject;
@property(nonatomic,copy)NSString *thumb;
@property(nonatomic,copy)NSString *total;
@end