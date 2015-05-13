//
//  ZLNavigationController.m
//  Demo2
//
//  Created by account on 15/5/7.
//  Copyright (c) 2015年 zhuli8. All rights reserved.
//

#import "ZLNavigationController.h"

@interface ZLNavigationController ()

@end

@implementation ZLNavigationController

#pragma mark -life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 *  重写这个方法的目的是能够拦截所有push进来的控制器
 */
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count>0) {//push进来的控制器不是第一个控制器（不是根控制器）
        //设置左边的返回按钮
        viewController.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc] initWithTitle:@"呵呵" style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    }
    
    [super pushViewController:viewController animated:animated];
}

/**
 *  装载到内存时调用
 */
//+(void)load
//{
//    [super load];
//}

/**
 *  发送第一个消息时调用
 */
+ (void)initialize
{
    // 设置整个项目所有item的主题样式
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    
    // 设置普通状态
    // key：NS****AttributeName
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor orangeColor];
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    [item setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    
    // 设置不可用状态
    NSMutableDictionary *disableTextAttrs = [NSMutableDictionary dictionary];
    disableTextAttrs[NSForegroundColorAttributeName] = [UIColor colorWithRed:0.6 green:0.6 blue:0.6 alpha:0.7];
    
    //  每一个像素都有自己的颜色，每一种颜色都可以由RGB3色组成
    //  12bit颜色: #f00  #0f0 #00f #ff0
    //  24bit颜色: #ff0000 #ffff00  #000000  #ffffff
    
    // #ff ff ff
    // R:255
    // G:255
    // B:255
    
    // RGBA
    //  32bit颜色: #556677
    
    // #ff00ff
    
    disableTextAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    [item setTitleTextAttributes:disableTextAttrs forState:UIControlStateDisabled];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark -private methods
-(void)back
{
    //self就是一个导航控制器，sef.navgationController就里是nil
    [self popViewControllerAnimated:YES];
}

@end
