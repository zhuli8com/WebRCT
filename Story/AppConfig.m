//
//  AppConfig.m
//  Demo2
//
//  Created by account on 15/5/8.
//  Copyright (c) 2015年 zhuli8. All rights reserved.
//

#import "AppConfig.h"

@implementation AppConfig
//为了提供其他成员有更多的创建选择，重写了allocWithZone、init
+(instancetype)allocWithZone:(struct _NSZone *)zone
{
    static AppConfig *config=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        config=[super allocWithZone:zone];
        //初始化属性
        [config initConfig];
    });
    return config;
}

//-(instancetype)init
//{
//    static AppConfig *config=nil;
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        config=[super init];
//        //初始化属性
//        [config initConfig];
//    });
//    return config;
//}

/**
 *  其实完全可以只提供一个全局的访问点，但是为了提供其他成员有更多的创建选择，重写了allocWithZone、init
 */
+(instancetype)sharedAppConfig
{
    return [[AppConfig alloc] init];
}

/**
 *  程序启动以后会根据这个地址进行网络连接
 */
-(void)initConfig
{
    self.serverUrl=[NSString stringWithFormat:@"http://%@:%@/serverURL",kIP,kPORT];
    self.registerUrl=@"";
}
@end
