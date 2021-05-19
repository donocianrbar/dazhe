//
//  DZAreaModel.h
//  DaZhePrivateHomeCuisineClient
//
//  Created by zouzhisheng on 15/2/1.
//  Copyright (c) 2015年 zouzhisheng. All rights reserved.
//获取餐厅（区域，菜品，特色菜，档次）分类信息  /（地区分类信息）

#import "Jastor.h"

@interface DZAreaModel : Jastor
@property(nonatomic,strong)NSArray *area;
@end

/**
 {
 "aid": "1",
 "name": "通辽",
 "pid": "0",
 },
 **/

@interface DZAreaSubModel : Jastor
@property(nonatomic,copy)NSString *aid;
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *pid;
@end