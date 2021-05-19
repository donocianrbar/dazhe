//
//  DZRestanutantDetailModel.h
//  DaZhePrivateHomeCuisineClient
//
//  Created by zouzhisheng on 15/1/31.
//  Copyright (c) 2015年 zouzhisheng. All rights reserved.
//

#import "Jastor.h"

@interface DZRestanutantDetailModel : Jastor
@property(nonatomic,strong)NSArray *subjectDetailInfo;
@end


@interface DZRestanutantDetailSubModel : Jastor
@property(nonatomic,copy)NSString *sid;
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *thumb;
@property(nonatomic,copy)NSString *map_lng;
@property(nonatomic,copy)NSString *map_lat;
@property(nonatomic,copy)NSString *c_zan;
@property(nonatomic,copy)NSString *tel;
@property(nonatomic,copy)NSString *address;
@property(nonatomic,copy)NSString *content;
@property(nonatomic,copy)NSString *c_tesecai1;
@property(nonatomic,copy)NSString *c_dangci;
@property(nonatomic,copy)NSString *c_caipin;
@property(nonatomic,copy)NSString *c_tel1;
@end