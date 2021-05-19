//
//  DZSubjectZhekouInfoModel.h
//  DaZhePrivateHomeCuisineClient
//
//  Created by zouzhisheng on 15/2/1.
//  Copyright (c) 2015年 zouzhisheng. All rights reserved.
//获取同餐厅折扣查询信息的接口

#import "Jastor.h"

@interface DZSubjectZhekouInfoModel : Jastor
@property(nonatomic,strong)NSArray *subjectZhekouInfo;
@end
/**
 "sid": "629",
 "name": "爆鼎饺子王",
 "thumb": "uploads/pictures/2015-01/thumb_38_1421289722.jpg",
 "c_zhekouyouhui": "a:1:{i:0;s:12:'折扣优惠';}",
 "c_zhekouneirong": "1月11日-2月11日，吃100送50（不含酒水）。"
 **/
@interface DZSubjectZhekouInfoSubModel : Jastor
@property(nonatomic,copy)NSString *sid;
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *thumb;
@property(nonatomic,copy)NSString *c_zhekouyouhui;
@property(nonatomic,copy)NSString *c_zhekouneirong;
@end