//
//  BaseService.m
//  WoQuClient
//
//  Created by zouzhisheng on 14-8-23.
//  Copyright (c) 2014年 WQ. All rights reserved.
//

#import "BaseService.h"
@implementation BaseService
+(BaseService*)shareNetworkService
{
    static BaseService *shareNetworkService=nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        shareNetworkService = [[self alloc] init];
    });
    return shareNetworkService;
}
- (id)init
{
    self = [self initWithBaseURL:[NSURL URLWithString:API_DOMAIN]];
    if (self) {
        
    }
    return self;
}

- (id)initWithBaseURL:(NSURL *)url
{
    self = [super initWithBaseURL:url];
    
    if (self) {
        [self setUpDefaultHeader];
    }
    
    return self;
}

- (id)initWithBaseURL:(NSURL *)url viewForLoadingAnimation:(UIView *)viewForLoadingAnimation
{
    self = [self initWithBaseURL:url];
    
    if (self) {
       // self.viewForLoadingAnimation = viewForLoadingAnimation;
    }
    
    return self;
}

- (id)initWithBaseURL:(NSURL *)url viewForLoadingAnimation:(UIView *)viewForLoadingAnimation messageForLoadingAnimation:(NSString *)messageForLoadingAnimation
{
    self = [self initWithBaseURL:url];
    
    if (self) {
//        self.viewForLoadingAnimation = viewForLoadingAnimation;
//        self.messageForLoadingAnimation = messageForLoadingAnimation;
    }
    
    return self;
}

+ (instancetype)clientInstance
{
    return [self clientWithBaseURL:[NSURL URLWithString:API_DOMAIN]];
}

+ (instancetype)clientWithBaseURL:(NSURL *)url viewForLoadingAnimation:(UIView *)viewForLoadingAnimation {
    BaseService *instance = [self clientWithBaseURL:url];
    
    if (instance) {
       // instance.viewForLoadingAnimation = viewForLoadingAnimation;
    }
    
    return instance;
}

+ (instancetype)clientInstanceViewForLoadingAnimation:(UIView *)viewForLoadingAnimation {
    BaseService *instance = [self clientWithBaseURL:[NSURL URLWithString:API_DOMAIN]];
    
    if (instance) {
       // instance.viewForLoadingAnimation = viewForLoadingAnimation;
    }
    
    return instance;
}

+ (instancetype)clientInstanceViewForLoadingAnimation:(UIView *)viewForLoadingAnimation messageForLoadingAnimation:(NSString *)messageForLoadingAnimation {
    BaseService *instance = [self clientWithBaseURL:[NSURL URLWithString:API_DOMAIN]];
    
    if (instance) {
//        instance.viewForLoadingAnimation = viewForLoadingAnimation;
//        instance.messageForLoadingAnimation = messageForLoadingAnimation;
    }
    
    return instance;
}

+ (instancetype)clientWithBaseURL:(NSURL *)url viewForLoadingAnimation:(UIView *)viewForLoadingAnimation messageForLoadingAnimation:(NSString *)messageForLoadingAnimation {
    BaseService *instance = [self clientWithBaseURL:url];
    
    if (instance) {
//        instance.viewForLoadingAnimation = viewForLoadingAnimation;
//        instance.messageForLoadingAnimation = messageForLoadingAnimation;
    }
    
    return instance;
}

- (NSError *)errorOfJsonStructure
{
    return [NSError errorWithDomain:@"LFErrorDomain" code:-1L userInfo:[NSDictionary dictionaryWithObject:@"JSON Structure error." forKey:NSLocalizedDescriptionKey]];
}

#pragma mark -
#pragma mark Private Methods
#pragma mark 拼装，设置Header信息
- (void)setUpDefaultHeader
{
//    LFDeviceInfoModel *mySession = [LFGlobalInstance globalInstance].deviceInfoModel;
//    
//    [self setDefaultHeader:@"sms_center_number" value:mySession.sms_center_number];
//    //    [self setDefaultHeader:@"macid" value:mySession.macadd];
//    [self setDefaultHeader:@"platform_n" value:mySession.platform_n];
//    [self setDefaultHeader:@"version" value:mySession.client_v];
//    [self setDefaultHeader:@"client_v" value:mySession.client_v];
//    [self setDefaultHeader:@"content_type" value:mySession.content_type];
//    [self setDefaultHeader:@"language" value:mySession.language];
//    [self setDefaultHeader:@"imei" value:mySession.imei];
//    [self setDefaultHeader:@"imgsize" value:mySession.screenw];
//    [self setDefaultHeader:@"source" value:[LFGlobalInstance globalInstance].businessModel.promotionSourceID];
}

#pragma mark -

#pragma mark 提供取消请求方法
- (void)cancelService
{
    [self stopLoadingAnimation];
    [self cancelAllHTTPOperationsWithMethod:self.method path:self.urlPath];
}

#pragma mark 重写get请求，当请求失败时，从缓存获得数据，并返回成功Block。
- (void)getPath:(NSString *)path parameters:(NSDictionary *)parameters modelClass:(Class)modelClass keyPathInJson:(NSString *)keyPath success:(void (^)(AFHTTPRequestOperation *, id))success failure:(void (^)(AFHTTPRequestOperation *, NSError *))failure
{
    // 修改AFNetworking的逻辑，当网络不可连接时，判断是否存在缓存。如果存在将不执行failureBlock，转发到successBlock中。
    void (^onFailure)(AFHTTPRequestOperation *, id) = [self setupOnFailureBlockFroModelClass:modelClass keyPathInJson:keyPath success:success failure:failure];
    
    void (^onSuccess)(AFHTTPRequestOperation *, id) = [self setupOnSuccessBlockFroModelClass:modelClass keyPathInJson:keyPath success:success failure:failure];
    
    // 发送get请求
    [self getPath:path parameters:parameters success:onSuccess failure:onFailure];
    
    // 保存请求方式和请求路径，方便取消操作使用.
    self.method = @"GET";
    self.urlPath = path;
}

- (void)getPath:(NSString *)path parameters:(NSDictionary *)parameters success:(void (^)(AFHTTPRequestOperation *, id))success failure:(void (^)(AFHTTPRequestOperation *, NSError *))failure
{
    // 开始加载loading动画
    [self startLoadingAnimation];
    
    void (^onSuccess)(AFHTTPRequestOperation *, id) = ^(AFHTTPRequestOperation *operation, id responseObject){
        [self stopLoadingAnimation];
        success(operation, responseObject);
    };
    
    void (^onFailure)(AFHTTPRequestOperation *, id) = ^(AFHTTPRequestOperation *operation, id responseObject){
        [self stopLoadingAnimation];
        failure(operation, responseObject);
    };
    
    [super getPath:path parameters:parameters success:onSuccess failure:onFailure];
}

#pragma mark 重写post请求，设置不使用缓存
- (void)postPath:(NSString *)path parameters:(NSDictionary *)parameters modelClass:(Class)modelClass keyPathInJson:(NSString *)keyPath success:(void (^)(AFHTTPRequestOperation *op, id model))success failure:(void (^)(AFHTTPRequestOperation *op, NSError *error))failure
{
    void (^onSuccess)(AFHTTPRequestOperation *, id) = [self setupOnSuccessBlockFroModelClass:modelClass keyPathInJson:keyPath success:success failure:failure];
    void (^onFailure)(AFHTTPRequestOperation *, id) = ^(AFHTTPRequestOperation *operation, id responseObject){
      //  NET_INFO(@":::Request=%@\nResult=%@", operation.request.URL, operation.responseString);
        failure(operation, responseObject);
    };
    [self postPath:path parameters:parameters success:onSuccess failure:onFailure];
}

- (void)postPath:(NSString *)path parameters:(NSDictionary *)parameters success:(void (^)(AFHTTPRequestOperation *, id))success failure:(void (^)(AFHTTPRequestOperation *, NSError *))failure
{
    [self startLoadingAnimation];
    
    void (^onSuccess)(AFHTTPRequestOperation *, id) = ^(AFHTTPRequestOperation *operation, id responseObject){
        [self stopLoadingAnimation];
        success(operation, responseObject);
    };
    
    void (^onFailure)(AFHTTPRequestOperation *, id) = ^(AFHTTPRequestOperation *operation, id responseObject){
        [self stopLoadingAnimation];
        failure(operation, responseObject);
        
        // 只有当网络不可连接时，检查是否存在缓存
        [self decideToShowNotConnectedToInternetMessageOrNotWithError:[(AFURLConnectionOperation*)operation error]];
    };
    
    NSMutableURLRequest *request = [self requestWithMethod:@"POST" path:path parameters:parameters];
    
    request.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
	AFHTTPRequestOperation *operation = [self HTTPRequestOperationWithRequest:request success:onSuccess failure:onFailure];
    [self enqueueHTTPRequestOperation:operation];
    
    // 保存请求方式和请求路径，方便取消操作使用.
    self.method = @"POST";
    self.urlPath = path;
}

#pragma mark -
#pragma mark Private Methods

- (void (^)(AFHTTPRequestOperation *operation, id responseObject))setupOnSuccessBlockFroModelClass:(Class)modelClass keyPathInJson:(NSString *)keyPath success:(void (^)(AFHTTPRequestOperation *, id))success failure:(void (^)(AFHTTPRequestOperation *, NSError *))failure
{
    return ^(AFHTTPRequestOperation *operation, id responseObject){
        NSError *jsonParseError;
        
        // 数据容错处理增加，兼容json请求莫名其妙返回空串的问题
        NSDictionary *jsonDict = nil;
        
        // 返回data非空情况下，才解析为字典
        if (responseObject) {
            jsonDict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:&jsonParseError];
        }
      //  NET_INFO(@":::Request=%@\nResult=%@", operation.request.URL, jsonDict);
        
        if (jsonParseError) {
            failure(operation, [self errorOfJsonStructure]);
            return;
        }
        
        if (keyPath && ![keyPath isEqualToString:@""]) {
            id keyPAthData = [jsonDict valueForKeyPath:keyPath];
            if (keyPAthData) {
                // 对应keypath为Array类型
                if ([keyPAthData isKindOfClass:[NSArray class]]) {
                    
                    NSMutableArray *dataArray = [[NSMutableArray alloc] initWithCapacity:[(NSArray *)keyPAthData count]];
                    
                    for (NSDictionary *dict in keyPAthData) {
                        id model = [[modelClass alloc] initWithDictionary:dict];
                        
                        [dataArray addObject:model];
                    }
                    
                    success(operation, dataArray);
                    return;
                    // 对应keypath为Dictionary类型
                } else {
                    id model = [[modelClass alloc] initWithDictionary:[jsonDict valueForKeyPath:keyPath]];
                    
                    success(operation, model);
                    return;
                }
                
            } else {
                failure(operation, [self errorOfJsonStructure]);
                return;
            }
        } else {
            if ([jsonDict isKindOfClass:[NSArray class]]) {
                NSMutableArray *dataArray = [[NSMutableArray alloc] initWithCapacity:[(NSArray *)jsonDict count]];
                
                for (NSDictionary *dict in jsonDict) {
                    id model = [[modelClass alloc] initWithDictionary:dict];
                    
                    [dataArray addObject:model];
                }
                
                success(operation, dataArray);
            } else {
                id model = [[modelClass alloc] initWithDictionary:jsonDict];
                success(operation, model);
            }
            
            return;
        }
    };
}

- (void (^)(AFHTTPRequestOperation *operation, id responseObject))setupOnFailureBlockFroModelClass:(Class)modelClass keyPathInJson:(NSString *)keyPath success:(void (^)(AFHTTPRequestOperation *, id))success failure:(void (^)(AFHTTPRequestOperation *, NSError *))failure
{
    return ^(AFHTTPRequestOperation *operation, NSError *error){
       // NET_INFO(@":::Request=%@\nResult=%@", operation.request.URL, operation.responseString);
        
        // 只有当网络不可连接时，检查是否存在缓存
        if (error.code == NSURLErrorNotConnectedToInternet || error.code == NSURLErrorCannotConnectToHost) {
            
            // 检测是否存在此request的缓存
            NSCachedURLResponse *cachedURLResponse = [[NSURLCache sharedURLCache] cachedResponseForRequest:[(AFURLConnectionOperation*)operation request]];
            
            // 如果有缓存
            if (cachedURLResponse) {
                // 返回success Block操作
                if (success) {
                    NSError *jsonParseError;
                    NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:cachedURLResponse.data options:NSJSONReadingMutableLeaves error:&jsonParseError];
                    
                    if (jsonParseError) {
                        failure(operation, [self errorOfJsonStructure]);
                        return;
                    }
                    
                    if (keyPath && ![keyPath isEqualToString:@""]) {
                        id keyPAthData = [jsonDict valueForKeyPath:keyPath];
                        if (keyPAthData) {
                            // 对应keypath为Array类型
                            if ([keyPAthData isKindOfClass:[NSArray class]]) {
                                
                                NSMutableArray *dataArray = [[NSMutableArray alloc] initWithCapacity:[(NSArray *)keyPAthData count]];
                                
                                for (NSDictionary *dict in keyPAthData) {
                                    id model = [[modelClass alloc] initWithDictionary:dict];
                                    
                                    [dataArray addObject:model];
                                }
                                
                                success(operation, dataArray);
                                return;
                                // 对应keypath为Dictionary类型
                            } else {
                                id model = [[modelClass alloc] initWithDictionary:[jsonDict valueForKeyPath:keyPath]];
                                
                                success(operation, model);
                                return;
                            }
                            
                        } else {
                            failure(operation, [self errorOfJsonStructure]);
                            return;
                        }
                    } else {
                        id model = [[modelClass alloc] initWithDictionary:jsonDict];
                        
                        success(operation, model);
                        return;
                    }
                }
            } else {
                [self showNotConnectedToInternetError];
            }
        } else if (error.code == NSURLErrorBadServerResponse) {
            [self showBadServerResponseError];
        }
        
        // 返回failure Block操作
        failure(operation, error);
    };
}

- (void)decideToShowNotConnectedToInternetMessageOrNotWithError:(NSError *)error
{
    if (error.code == NSURLErrorNotConnectedToInternet || error.code == NSURLErrorCannotConnectToHost) {
        [self showNotConnectedToInternetError];
    } else if (error.code == NSURLErrorBadServerResponse) {
        [self showBadServerResponseError];
    }
}

- (void)showNotConnectedToInternetError
{
    if ([self.datasource respondsToSelector:@selector(messageForLoadingAnimationAtService:ofServiceStatus:)]) {
        
        NSString *messageStr = [self.datasource messageForLoadingAnimationAtService:self.postType ofServiceStatus:ServiceStatus_ConnectToInternetLoss];
        
        [Common showToastViewForCurrentVisibleViewForTwoSecondsWithMessage:messageStr ? messageStr :ErrorMessage_CanNotConnectToInternet];
    } else {
        [Common showToastViewForCurrentVisibleViewForTwoSecondsWithMessage:ErrorMessage_CanNotConnectToInternet];
    }
}

- (void)showBadServerResponseError
{
    if ([self.datasource respondsToSelector:@selector(messageForLoadingAnimationAtService:ofServiceStatus:)]) {
        
        NSString *messageStr = [self.datasource messageForLoadingAnimationAtService:self.postType ofServiceStatus:ServiceStatus_BaseServer];
        
        [Common showToastViewForCurrentVisibleViewForTwoSecondsWithMessage:messageStr ? messageStr :ErrorMessage_BadeServerResponse];
    } else {
        [Common showToastViewForCurrentVisibleViewForTwoSecondsWithMessage:ErrorMessage_BadeServerResponse];
    }
}

- (void)startLoadingAnimation
{
    if ([self.datasource respondsToSelector:@selector(viewForLoadAnimationAtService:)]) {
        UIView *animationView = [self.datasource viewForLoadAnimationAtService:self.postType];
        
        NSString *messageStr = [self.datasource respondsToSelector:@selector(messageForLoadingAnimationAtService:ofServiceStatus:)] ? [self.datasource messageForLoadingAnimationAtService:self.postType ofServiceStatus:ServiceStatus_StartLoading] : nil;
        
        [Common showLoadingAnimationForView:animationView message:messageStr ? messageStr : Default_LoadingAnimationMessage];
    }
}

- (void)stopLoadingAnimation
{
    if ([self.datasource respondsToSelector:@selector(viewForLoadAnimationAtService:)]) {
        UIView *animationView = [self.datasource viewForLoadAnimationAtService:self.postType];
        
        [Common hideAllLoadingAnimationForView:animationView];
    }
}

@end
