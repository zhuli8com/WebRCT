//
//  AppDelegate+Extension.m
//  Demo2
//
//  Created by account on 15/5/6.
//  Copyright (c) 2015年 zhuli8. All rights reserved.
//

#import "AppDelegate+Extension.h"
#import "Aspects.h"

@implementation AppDelegate (Extension)

#pragma mark -life cycle
/**
 *  该方法会被调用两次，第二次应该是分类里调的，所以不适合代替initialize
 */
+(void)load
{
    }

/**
 *  设置全局日志打印
 */
+(void)initialize
{
    //在这里做方法拦截
    [UIViewController aspect_hookSelector:@selector(loadView) withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo>aspectInfo){
        [self loadView:[aspectInfo instance]];
    } error:NULL];
    
    [UIViewController aspect_hookSelector:@selector(viewDidAppear:) withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo> aspectInfo, BOOL animated){
        [self viewDidAppear:animated viewController:[aspectInfo instance]];
    } error:NULL];
    
    // Hooking dealloc is delicate, only AspectPositionBefore will work here.
    //but NSSelectorFromString(@"dealloc")=@selector(dealloc)
    [UIViewController aspect_hookSelector:NSSelectorFromString(@"dealloc") withOptions:AspectPositionBefore usingBlock:^(id<AspectInfo>aspectInfo){
        [self dealloc:[aspectInfo instance]];
    } error:NULL];

}

/**
 *  各位，这里就是我们可以发挥聪明才智的地方
 *  你也可以随便找一个什么其他的UIViewController，只要加入工程中，不需要额外添加什么代码，就可以做到自动拦截了。
 *  所以在你原来的架构中，大部分封装UIViewController的基类或者其他的什么基类，都可以使用这种方法让这些基类消失。
 */
#pragma mark -fake methods
CFAbsoluteTime startTime;
+(void)loadView:(UIViewController *)viewController
{
    startTime=CFAbsoluteTimeGetCurrent();
    
    //你可以使用这个方法进行打日志，初始化基础业务相关的内容
    //ZLLog(@"%@成功加载",[viewController class]);
}

+(void)viewDidAppear:(BOOL)animated viewController:(UIViewController *)viewController
{
    AppLog(@"[%@] 创建成功,费时%f秒！",[viewController class],CFAbsoluteTimeGetCurrent()-startTime);
}

+(void)dealloc:(UIViewController *)viewController
{
    AppLog(@"[%@] 释放了......！",[viewController class]);
}

#pragma mark -private methods
/**
 *  根据版本号来判定是否为首次登陆来切换不同的控制器
 */
-(void)switchRootViewController
{
    NSString *key=(NSString *)kCFBundleVersionKey;
    
    NSString *lastVersion=[[NSUserDefaults standardUserDefaults] objectForKey:key];
    NSString *currentVersion=[NSBundle mainBundle].infoDictionary[key];
    
    if ([currentVersion isEqualToString:lastVersion]) {
        //通过Storyboard获取登陆控制器
        UIStoryboard *loginStoryboard=[UIStoryboard storyboardWithName:@"Login" bundle:nil];
        UIViewController *loginController=[loginStoryboard instantiateInitialViewController];
        self.window.rootViewController=loginController;
    }
    else{
        //通过Storyboard获取新特性控制器
        UIStoryboard *newfeatureStoryboard=[UIStoryboard storyboardWithName:@"Guide" bundle:nil];
        UIViewController *newfeatureController=[newfeatureStoryboard instantiateInitialViewController];
        self.window.rootViewController=newfeatureController;
        
//        //将当前的版本存进沙盒
//        NSUserDefaults *userDefaults=[NSUserDefaults standardUserDefaults];
//        [userDefaults setObject:currentVersion forKey:key];
//        [userDefaults synchronize];//立即同步
        
        NSString *path= [[[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByDeletingLastPathComponent] stringByAppendingPathComponent:@"Preferences"];
        AppLog(@"当前版本信息已经保存到沙盒，路径为：%@",path);
    }
    
    [self.window makeKeyAndVisible];
}
@end
