//
//  CommonUtils.h
//  Demo2
//
//  Created by account on 15/5/6.
//  Copyright (c) 2015年 zhuli8. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommonUtils : NSObject
//正则，手机号码校验。
+ (BOOL)isValidateMobileNumber:(NSString*)strMobile;

+(BOOL) isPhoneNumber:(NSString * )strMobile;
@end
