//
//  BaseService+DZBaseService.m
//  DaZhePrivateHomeCuisineClient
//
//  Created by zouzhisheng on 15/1/31.
//  Copyright (c) 2015年 zouzhisheng. All rights reserved.
//

#import "BaseService+DZBaseService.h"
#import "DZHomeDataModel.h"
#import "DZRestautantModel.h"
#import "DZRestanutantDetailModel.h"
#import "DZArticlesInfoModel.h"
#import "DZCategoryInfoModel.h"
#import "DZSiFangCaiInfoModel.h"
#import "DZSubjectTuijianInfoModel.h"
#import "DZSubjectZhekouInfoModel.h"
#import "DZAdviceInfoModel.h"
#import "DZAreaModel.h"
#import "DZOtherCategoryInfoModel.h"
@implementation BaseService (DZBaseService)
-(void)requestActivityParameters:(NSDictionary*)parameters DataSouce:(id<ServiceDataSource>)dataSouce RequestType:(RequestType)requestType Block:(ServiceCallBackBlock)block{
    self.postType=requestType;
    NSString *urlPath=nil;
    Class modelClass=nil;
    NSString *keyPath=nil;
      switch (self.postType) {
        case Request_HomePageInfo :
            urlPath=@"/interface/getHomePageInfo.php";
            modelClass=[DZHomeDataModel class];
            break;
        case Request_RestanutantCommonQuery:
              urlPath=@"/interface/querySubjectInfo.php";
              modelClass=[DZHomeDataModel class];
            break;
        case Request_RestanutantDetail:
              urlPath=@"/interface/querySubjectInfo.php";
              modelClass=[DZRestanutantDetailModel class];
            break;
        case Request_DaZheIndexInfo :
              urlPath=@"/interface/queryArticlesInfo.php";
              modelClass=[DZArticlesInfoModel class];
            break;
        case Request_DaZheListInfo :
              urlPath=@"/interface/queryArticlesInfo.php";
              modelClass=[DZCategoryInfoModel class];
            break;
        case Request_DaZheDetailInfo:
              urlPath=@"/interface/queryArticlesInfo.php";
              modelClass=[DZSiFangCaiInfoModel class];
            break;
        case Request_DaZheTuiJianInfo :
              urlPath=@"/interface/queryArticlesInfo.php";
              modelClass=[DZSubjectTuijianInfoModel class];
            break;
        case Request_DaZheTuiJianZhekou:
              urlPath=@"/interface/queryArticlesInfo.php";
              modelClass=[DZSubjectZhekouInfoModel class];
            break;
        case Request_DaZheSearchZhekou :
//              urlPath=@"/interface/queryArticlesInfo.php";
//              modelClass=[DZHomeDataModel class];
            break;
        case Request_DaZheDianZan :
//              urlPath=@"/interface/getHomePageInfo.php";
//              modelClass=[DZHomeDataModel class];
            break;
        case Request_GetAdviceInfo :
              urlPath=@"/interface/getAdviceInfo.php";
              modelClass=[DZAdviceInfoModel class];
            break;
        case Request_GetCategoryInfoArea :
              urlPath=@"/interface/getCategoryInfo.php";
              modelClass=[DZAreaModel class];
            break;
        case Request_GetCategoryInfoCaiPin :
              urlPath=@"/interface/getCategoryInfo.php";
              modelClass=[DZOtherCategoryCaiPinInfoModel class];
            break;
        case Request_GetCategoryInfoTesecai :
              urlPath=@"/interface/getCategoryInfo.php";
              modelClass=[DZOtherCategoryTeSeCaiInfoModel class];
            break;
        case Request_GetCategoryInfoDangci :
              urlPath=@"/interface/getCategoryInfo.php";
              modelClass=[DZOtherCategoryInfoModel class];
            break;
            
        default:
            break;
    }
    [self getPath:urlPath parameters:parameters modelClass:modelClass keyPathInJson:nil success:^(AFHTTPRequestOperation *op, id model) {
        if (block) {
            block(model, nil);
        }
    } failure:^(AFHTTPRequestOperation *op, NSError *e) {
        if (block) {
            block(nil, e);
        }

    }];
}
@end
