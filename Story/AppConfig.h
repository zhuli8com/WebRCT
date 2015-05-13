//
//  AppConfig.h
//  Demo2
//
//  Created by account on 15/5/8.
//  Copyright (c) 2015年 zhuli8. All rights reserved.
//

#import <Foundation/Foundation.h>

//提供快捷访问入口ZLAppConfig来获取单例
#define ZLAppConfig [AppConfig sharedAppConfig]

//服务器地址在此配置
#define kIP      @"211.99.191.206"
#define kPORT    @"7071"
//#define kIP      @"42.120.63.188"
//#define kPORT    @"8200"

@interface AppConfig : NSObject
@property (nonatomic, copy) NSString* serverUrl;
@property (nonatomic, copy) NSString* registerUrl;

+(instancetype)sharedAppConfig;
@end
