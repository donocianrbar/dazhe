//
//  BaseService.h
//  WoQuClient
//
//  Created by zouzhisheng on 14-8-23.
//  Copyright (c) 2014年 WQ. All rights reserved.
//
#define ErrorMessage_CanNotConnectToInternet @"网络无法连接，请检查您的网络设置。"
#define ErrorMessage_BadeServerResponse      @"服务器累坏了，让它休息会儿，一会儿再试吧"

#define Default_LoadingAnimationMessage @"加载中..."
#import "AFHTTPClient.h"
#import "AFHTTPRequestOperation.h"
@class BaseModel;
@protocol ServiceDataSource;

typedef enum {
    ServiceStatus_StartLoading  = 1,
    ServiceStatus_ConnectToInternetLoss,
    ServiceStatus_BaseServer,
} ServiceStatus;

typedef NS_ENUM(NSInteger,RequestType) {
    Request_HomePageInfo,
    Request_RestanutantCommonQuery, //餐厅查询
   // Request_RestanutantZuHeQuery,  //餐厅组合查询
    
    Request_RestanutantDetail,     //餐厅详细信息查询
    
    //获取大哲私房菜信息的接口
    Request_DaZheIndexInfo,
    Request_DaZheListInfo,
    Request_DaZheDetailInfo,
    //获取大哲推荐信息的接口
    Request_DaZheTuiJianInfo,
    //获取同餐厅折扣查询信息的接口
    Request_DaZheTuiJianZhekou,
    //根据查询参数获取搜索信息的接口
    Request_DaZheSearchZhekou,
    
    //点赞
    Request_DaZheDianZan,
    //获取广告位置信息
    Request_GetAdviceInfo,
    //获取餐厅（区域，菜品，特色菜，档次）分类信息
    Request_GetCategoryInfoArea, //区域
    Request_GetCategoryInfoCaiPin, //菜品
    Request_GetCategoryInfoTesecai,//特色菜
    Request_GetCategoryInfoDangci, //档次
    
    
};


typedef void (^ServiceCallBackBlock)(__weak id data, NSError *error);

@interface BaseService : AFHTTPClient
@property (nonatomic, strong)NSString *method;
@property (nonatomic, strong)NSString *urlPath;
@property (nonatomic, weak) id<ServiceDataSource> datasource;
@property (nonatomic, assign)RequestType postType;

+(BaseService*)shareNetworkService;
/////////////////////////////////////////////////////
//                                                 //
//                  网络请求                        //
//                                                //
////////////////////////////////////////////////////

/*
 * 取消网络请求
 * @return 无。
 */
- (void)cancelService;

/*
 * 生成service实例
 * @return 生成的service实例。
 */
+ (instancetype)clientInstance;

/*
 * 发送get网络请求。
 * 支持根据keypath自动生成model实例，支持生成array model实例。
 * 在没有网络和服务器无法连接时，自动使用缓存数据。
 * @param path 请求path
 * @param parameters 请求参数
 * @param modelClass 返回model的class类型
 * @param keyPath 所取数据在json返回对象中的keyPath
 * eg
 {
 "code":
 0,
 "data":[{
 "pages":"0"
 }],
 "msg":
 "success"
 }
 * 上面的json，如果keyPath为@"data.pages"，则会取到pages的结点
 *
 * @param success 成功的回调Block
 * @param failure 失败的回调Block
 * @return 生成的service实例。*/
- (void)getPath:(NSString *)path parameters:(NSDictionary *)parameters modelClass:(Class)modelClass keyPathInJson:(NSString *)keyPath success:(void (^)(AFHTTPRequestOperation *op, id model))success failure:(void (^)(AFHTTPRequestOperation *op, NSError *e))failure;
/*
 * 发送post网络请求。
 * 支持根据keypath自动生成model实例，支持生成array model实例。
 * post请求，设定不支持缓存。
 * @param path 请求path
 * @param parameters 请求参数
 * @param modelClass 返回model的class类型
 * @param keyPath 所取数据在json返回对象中的keyPath
 * eg
 {
 "code":0,
 "data":[{
 "pages":"0"
 }],
 "msg":"success"
 }
 * 上面的json，如果keyPath为@"data.pages"，则会取到pages的结点
 *
 * @param success 成功的回调Block
 * @param failure 失败的回调Block
 * @return 生成的service实例。
 */
- (void)postPath:(NSString *)path parameters:(NSDictionary *)parameters success:(void (^)(AFHTTPRequestOperation *op, id model))success failure:(void (^)(AFHTTPRequestOperation *op, NSError *e))failure;

- (void)postPath:(NSString *)path parameters:(NSDictionary *)parameters modelClass:(Class)modelClass keyPathInJson:(NSString *)keyPath success:(void (^)(AFHTTPRequestOperation *op, id model))success failure:(void (^)(AFHTTPRequestOperation *op, NSError *error))failure;


@end

@protocol ServiceDataSource <NSObject>

@optional

/**
 *  提供用于显示加载动画效果的view
 *
 *  @param  service     需要显示加载动画效果的Service
 *  @return 用于显示加载动画效果的view
 */
- (UIView *)viewForLoadAnimationAtService:(RequestType)type;
/**
 *  提供service不同status下，用于在动画上显示的文字
 ServiceStatus_StartLoading              默认显示请参照`Default_LoadingAnimationMessage`宏定义
 ServiceStatus_ConnectToInternetLoss     默认显示请参照`ErrorMessage_CanNotConnectToInternet`宏定义
 ServiceStatus_BaseServer                默认显示请参照`ErrorMessage_BadeServerResponse`宏定义
 *
 *  @param  service     需要显示加载动画效果的Service
 *  @return 用于在加载动画上显示的文字
 */
- (NSString *)messageForLoadingAnimationAtService:(RequestType)type ofServiceStatus:(ServiceStatus)serviceStatus;

@end

