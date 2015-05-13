//
//  HttpTool.h
//  Demo2
//
//  Created by account on 15/5/11.
//  Copyright (c) 2015年 zhuli8. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppHttpTool : NSObject

+(void)get:(NSString *)url params:(NSDictionary *)params success:(void(^)(id json))success failure:(void(^)(NSError *error))failure;

+(void)post:(NSString *)url params:(NSDictionary *)params success:(void(^)(id json))success failure:(void(^)(NSError *error))failure;
@end
