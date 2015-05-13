//
//  main.m
//  Demo2
//
//  Created by account on 15/5/5.
//  Copyright (c) 2015年 zhuli8. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

/**
 *  程序启动开始时间，默认是全局变量，省略了extern关键字。
 */
CFAbsoluteTime startTime;
int main(int argc, char * argv[]) {
    @autoreleasepool {
        startTime=CFAbsoluteTimeGetCurrent();

        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
