//
//  NewfeatureViewController.m
//  Demo2
//
//  Created by account on 15/5/7.
//  Copyright (c) 2015年 zhuli8. All rights reserved.
//

#import "GuideViewController.h"
#import "LoginViewController.h"
#import "AppConst.h"


@interface GuideViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (nonatomic,strong) UIButton *button;
/**
 *  向导图片数组
 */
@property (nonatomic,strong) NSArray *guidImages;
@end

@implementation GuideViewController
#pragma mark -life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //self.view contentScaleFactor
    
    //添加图片到scrollView中
    //self.scrollView.frame.size.width/height=600
    CGFloat scrollW=self.view.frame.size.width;//正常情况下的尺寸设置应该放到viewDidLayoutSubviews中
    CGFloat scrollH=self.view.frame.size.height;
    for (int i=0; i<AppGuideImageCount; i++) {
        UIImageView *imageView=[[UIImageView alloc] initWithFrame:CGRectMake(i*scrollW, 0, scrollW, scrollH)];
        imageView.image=self.guidImages[i];
        [self.scrollView addSubview:imageView];
        
        //如果是最后一个imageView，就往这个imageView里面添加其他内容
        if (i==AppGuideImageCount-1) {
            imageView.userInteractionEnabled=YES;
            [imageView addSubview:self.button];
        }
    }
    
    //设置scrollView的contentSize属性
    self.scrollView.contentSize=CGSizeMake(AppGuideImageCount*scrollW, 0);
    self.scrollView.delegate=self;
}

/**
 *  尺寸比较准确
 */
//-(void)viewDidLayoutSubviews
//{
//    [super viewDidLayoutSubviews];
//    
//    double contentScaleFactor=self.view.contentScaleFactor/2;
//    CGFloat buttonW=self.button.currentBackgroundImage.size.width*contentScaleFactor;
//    CGFloat buttonH=self.button.currentBackgroundImage.size.height*contentScaleFactor;
//    CGFloat buttonX=self.view.center.x-buttonW/2;
//    CGFloat buttonY=self.view.bounds.size.height-buttonH*1.5;
//    self.button.frame=CGRectMake(buttonX, buttonY, buttonW, buttonH);
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 *  新特性页面隐藏状态栏
 */
-(BOOL)prefersStatusBarHidden
{
    return YES;
}

#pragma mark - UIScrollViewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    double page=scrollView.contentOffset.x/scrollView.bounds.size.width;
    int flag=(int)(page+0.5)+1;
    AppLog(@"已经滑动了第%d页>>>",flag);
    if (flag==AppGuideImageCount) {
        //[self startExperience];
    }
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
-(void)startExperience
{
    AppLog(@"go>>>");
    /**
     *  切换控制器的手段
     *  1、push：依赖于UINavigationController，控制器的切换是可逆的，比如A切换到B，B又可以切换回到A
     *  2、modal：控制器的切换是可逆的，比如比如A切换到B，B又可以切换回到A
     *  3、切换winddow的rootViewController
     *  注意：modal方式，不建议采取，因为新特性控制器不会销毁
     */
    UIStoryboard *loginStoryboard=[UIStoryboard storyboardWithName:@"Login" bundle:nil];
    LoginViewController *loginController=[loginStoryboard instantiateInitialViewController];
    
    UIWindow *window=[UIApplication sharedApplication].keyWindow;
    window.rootViewController=loginController;
}

#pragma mark -getters and setters

/**
 *  在geter方法中使用self.button会出现死循环
 */
-(UIButton *)button
{
    if (!_button) {
        _button=[[UIButton alloc] init];
        [_button setBackgroundImage:self.guidImages[AppGuideImageCount] forState:UIControlStateNormal];
        [_button addTarget:self action:@selector(startExperience) forControlEvents:UIControlEventTouchUpInside];
        
        double contentScaleFactor=self.view.contentScaleFactor/2;
        CGFloat buttonW=self.button.currentBackgroundImage.size.width*contentScaleFactor;
        CGFloat buttonH=self.button.currentBackgroundImage.size.height*contentScaleFactor;
        CGFloat buttonX=self.view.center.x-buttonW/2;
        CGFloat buttonY=self.view.bounds.size.height-buttonH*1.5;
        _button.frame=CGRectMake(buttonX, buttonY, buttonW, buttonH);
    }
    return _button;
}

/**
 *  Bundle(包)中的图片素材
 *  1、黄色文件夹
 *  XCode中分文件夹，Bundle中所有资源都在同一个文件夹，因此不能出现文件重名的情况，可以直接使用[NSBundle mainBundle]作为资源路径并使用[UIImage imageNamed:]加载图像
 *  2、蓝色文件夹
 *  XCode中分文件夹，Bundle中同样分文件夹，因此可以出现重名的情况，不能使用UIImage imageNamed:]加载图像，需要在[NSBundle mainBundle]的基础上拼接实际的路径
 */
-(NSArray *)guidImages
{
    if (!_guidImages) {
        NSMutableArray *tempArray = [[NSMutableArray alloc] init];
        
        NSString *bundlePath=[[NSBundle mainBundle] bundlePath];
        NSString *imagePath=[bundlePath stringByAppendingPathComponent:@"Guide"];
        if (iPhone4) {
            imagePath=[imagePath stringByAppendingPathComponent:@"640x960"];
        }
        else if (iPhone5){
            imagePath = [imagePath stringByAppendingPathComponent:@"640x1136"];
        }
        else if (iPhone6){
            imagePath = [imagePath stringByAppendingPathComponent:@"750x1334"];
        }
        else if(iPhone6p){
            imagePath = [imagePath stringByAppendingPathComponent:@"1242x2208"];
        }
        else{
            AppLog(@"APP不支持iPhone4以下的设备，找不到对应的向导图片！");
        }
        
        for (int i=1; i<=AppGuideImageCount+1; i++) {//++i比较好，但是没有起作用，且AppGuideImageCount+1是为了添加按钮图片
            NSString *path=[imagePath stringByAppendingPathComponent:[NSString stringWithFormat:@"%d.png",i]];//不加.png，真机通不过
            UIImage *image=[UIImage imageWithContentsOfFile:path];
            if (image) {
                [tempArray addObject:image];
            }
        }
        _guidImages=tempArray;
    }
    return _guidImages;
}
@end
