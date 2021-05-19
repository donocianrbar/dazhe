//
//  BaseService+DZBaseService.h
//  DaZhePrivateHomeCuisineClient
//
//  Created by zouzhisheng on 15/1/31.
//  Copyright (c) 2015年 zouzhisheng. All rights reserved.
//

#import "BaseService.h"

@interface BaseService (DZBaseService)
-(void)requestActivityParameters:(NSDictionary*)parameters DataSouce:(id<ServiceDataSource>)dataSouce RequestType:(RequestType)requestType Block:(ServiceCallBackBlock)block;
@end
