//
//  AppGlobal.h
//  Demo2
//
//  Created by account on 15/5/10.
//  Copyright (c) 2015年 zhuli8. All rights reserved.
//

#ifndef Demo2_AppGlobal_h
#define Demo2_AppGlobal_h

/**
 *  判定设备，尺寸分为两种情况：
 *  1、当设置启动图片等适配屏幕时的尺寸
 *  2、当没有适配时的尺寸（iPhone5、iPhone6、iPhone6p一样）
 *  注：instancesRespondToSelector是用来判定类是否响应实例的方法，和respondToSelector类似（用类判定类方法，用实例判定实例方法）
 */
/* iPhone 6p */
#define iPhone6p ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) || CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size): NO)


/* iPhone 6 */
#define iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) ||CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size): NO)

/* iPhone 5 */
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

/* iPhone 4 */
#define iPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)

/**
 *  颜色相关
 */
// RGB颜色
#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1.0]

// 随机色
#define RGBRandomColor RGBCOLOR(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

/**
 *  系统版本
 */
#define IOSVersion [[[UIDevice currentDevice] systemVersion] floatValue]

#endif
