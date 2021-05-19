//
//  DZOtherCategoryInfoModel.h
//  DaZhePrivateHomeCuisineClient
//
//  Created by zouzhisheng on 15/2/1.
//  Copyright (c) 2015年 zouzhisheng. All rights reserved.
//获取餐厅（区域，菜品，特色菜，档次）分类信息/（其它（档次（3），菜品（7），特色菜（6））分类信息）

#import "Jastor.h"

@interface DZOtherCategoryInfoModel : Jastor
@property(nonatomic,strong)NSArray *dangci;  //档次
@end


@interface DZOtherCategoryCaiPinInfoModel : Jastor
@property(nonatomic,strong)NSArray *caipin;  //菜品
@end

@interface DZOtherCategoryTeSeCaiInfoModel : Jastor
@property(nonatomic,strong)NSArray *tesecai;  //特色菜
@end
@interface DZOtherCategoryInfoSubModel : Jastor
@property(nonatomic,copy)NSString *attid;
@property(nonatomic,copy)NSString *catid;
@property(nonatomic,copy)NSString *name;
@end
