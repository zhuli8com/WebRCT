//
//  AppDelegate.m
//  Demo1
//
//  Created by account on 15/5/5.
//  Copyright (c) 2015年 zhuli8. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+Extension.h"

/**
 *  声明startTime，用以在本类中调用main.m中的startTime全局变量。
 */
extern CFAbsoluteTime startTime;

@interface AppDelegate ()

@end

@implementation AppDelegate
#pragma mark -life cycle
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //让状态栏从启动的时候就隐藏起来
    //修改-Info.plist,在根结点Infomation Property List下面新加一项“Status bar is initially hidden”
    
    //根据需求选择对应的Storyboard
    self.window=[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    //self.window.backgroundColor=[UIColor blackColor];
    [self switchRootViewController];
    
    //计算程序启动时间
    AppLog(@"APP启动费时%f秒！",CFAbsoluteTimeGetCurrent()-startTime);
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
@end
