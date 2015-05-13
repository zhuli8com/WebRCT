//
//  HttpTool.m
//  Demo2
//
//  Created by account on 15/5/11.
//  Copyright (c) 2015年 zhuli8. All rights reserved.
//

#import "AppHttpTool.h"
#import "AFNetworking.h"

@implementation AppHttpTool

+(void)get:(NSString *)url params:(NSDictionary *)params success:(void(^)(id json))success failure:(void(^)(NSError *error))failure
{
    //1、创建请求操作管理者
    AFHTTPRequestOperationManager *mgr=[AFHTTPRequestOperationManager manager];
    
    //2、发送请求
    [mgr GET:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

+(void)post:(NSString *)url params:(NSDictionary *)params success:(void(^)(id json))success failure:(void(^)(NSError *error))failure
{
    //1、创建请求操作管理者
    AFHTTPRequestOperationManager *mgr=[AFHTTPRequestOperationManager manager];
    
    //2、发送请求
    [mgr POST:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}
@end
