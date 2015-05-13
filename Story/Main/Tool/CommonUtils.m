//
//  CommonUtils.m
//  Demo2
//
//  Created by account on 15/5/6.
//  Copyright (c) 2015年 zhuli8. All rights reserved.
//

#import "CommonUtils.h"

@implementation CommonUtils
//正则，手机号码校验:判断一下是不是正确的手机格式
+ (BOOL)isValidateMobileNumber:(NSString*)strMobile
{
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,189
     */
    
    /*
     18500041984:       valid
     8618500041984:     valid
     008618500041984:   valid
     +8618500041984:    valid
     08618500041984:    invalid
     ++8618500041984:   invalid
     */
    
    //NSString *reg = @"^((86)|(086)|(0086)|(\\+86)){0,1}((13[0-9])|(15[^4,\\D])|(18[0-9]))\\d{8}$";//Android
    //NSString *mobileRegex = @"^((\\+861)|1)((3[4-9])|(5[0-2|7-9])|(8[7-8])|82|47)[0-9]{8}$";
    //NSString *mobileRegex = @"^((00861)|(\\+861)|(861)|1)(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    NSString *mobileRegex = @"^((00861)|(\\+861)|(861)|1)(3[0-9]|4[0-9]|5[0-9]|7[0-9]|8[0-9])\\d{8}$";
    
    
    NSPredicate *mobileTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", mobileRegex];
    return [mobileTest evaluateWithObject:strMobile];
}

// 是否是手机号码
+(BOOL) isPhoneNumber:(NSString * )strMobile {
    //		String reg2 = "^((861)|(00861)|(\\+861)|1)((3[0-9])|(5[0-3|5-9])|(8[5-9])|82|47|80)[0-9]{8}$";
    NSString * reg = @"^((86)|(086)|(0086)|(\\+86)){0,1}((13[0-9])|(15[^4,\\D])|(18[0-2,5-9]))\\d{8}$";
    NSPredicate *mobileTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", reg];
    
    return [mobileTest evaluateWithObject:strMobile];
    
}
@end
