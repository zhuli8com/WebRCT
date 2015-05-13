//
//  TestViewController.m
//  Demo2
//  http://adad184.com/2014/09/28/use-masonry-to-quick-solve-autolayout/
//  Created by account on 15/5/9.
//  Copyright (c) 2015年 zhuli8. All rights reserved.
//

#import "TestViewController.h"
#import "Masonry.h"

#define WS(weakSelf) __weak typeof(self) weakSelf=self

@interface TestViewController ()
@property (nonatomic,strong) UIView *sv;
@property (nonatomic,strong) UIView *sv1;
@property (nonatomic,strong) UIView *sv2;
@property (nonatomic,strong) UIView *sv3;

@property (nonatomic,strong) UIScrollView *scrollView;
@end

@implementation TestViewController

#pragma mark -lice cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self.view addSubview:self.sv];
    [self.sv addSubview:self.sv1];
    [self.sv1 addSubview:self.sv2];
    [self.sv1 addSubview:self.sv3];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 *  在做自动布局之前一定要先将view添加到superView上，否则会报错
 */
-(void)updateViewConstraints
{
    WS(ws);
    [super updateViewConstraints];
    
    [self.sv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(ws.view);
        
        
        make.size.mas_equalTo(CGSizeMake(300, 300));
    }];
    
    [self.sv1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(ws.sv).with.insets(UIEdgeInsetsMake(10, 10, 10, 10));
    }];
    
    int padding1=10;
    [self.sv2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(ws.sv3);
        make.height.mas_equalTo(@150);
        make.left.equalTo(ws.sv1.mas_left).offset(padding1);
        make.right.equalTo(ws.sv3.mas_left).offset(-padding1);
        make.centerY.mas_equalTo(ws.sv1.mas_centerY);
    }];
    
    [self.sv3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(ws.sv2);
        
        make.centerY.equalTo(ws.sv1.mas_centerY);
        make.left.equalTo(ws.sv2.mas_right).offset(padding1);
        make.right.equalTo(ws.sv1.mas_right).offset(-padding1);
    }];
    
    if (_scrollView) {
        [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(ws.sv).insets(UIEdgeInsetsMake(5, 5, 5, 5));
        }];
    }
}

/**
 *  在自动布局中已经被updateViewConstraints代替
 */
-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
}

/**
 *  container起到了一个中间层的作用，能够自动的计算UIScrollView的contentSize
 */
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    
    [self.view addSubview:self.scrollView];
    UIView *container=[UIView new];
    [self.scrollView addSubview:container];
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo([self scrollView]);
        make.width.equalTo([self scrollView]);
    }];
    
    int count=10;
    UIView *lastView=nil;
    
    for (int i=1; i<=count; ++i) {
        UIView *subv=[UIView new];
        [container addSubview:subv];
        subv.backgroundColor = [UIColor colorWithHue:( arc4random() % 256 / 256.0 )
                                          saturation:( arc4random() % 128 / 256.0 ) + 0.5
                                          brightness:( arc4random() % 128 / 256.0 ) + 0.5
                                               alpha:1];
        
        [subv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(container);
            make.height.mas_equalTo(@(20*i));
            
            if (lastView) {
                make.top.mas_equalTo(lastView.mas_bottom);
            }
            else{
                make.top.equalTo(container.mas_top);
            }
        }];
        
        lastView=subv;
    }
    
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(lastView.mas_bottom);
    }];
    
    [self.view setNeedsUpdateConstraints];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark -getters and setters
-(UIView *)sv
{
    if (!_sv) {
        _sv=[UIView new];
        _sv.backgroundColor=[UIColor blackColor];
    }
    return _sv;
}

-(UIView *)sv1
{
    if (!_sv1) {
        _sv1=[UIView new];
        _sv1.backgroundColor=[UIColor redColor];
    }
    return _sv1;
}

-(UIView *)sv2
{
    if (!_sv2) {
        _sv2=[UIView new];
        _sv2.backgroundColor=[UIColor yellowColor];
    }
    return _sv2;
}

-(UIView *)sv3
{
    if (!_sv3) {
        _sv3=[UIView new];
        _sv3.backgroundColor=[UIColor yellowColor];
    }
    return _sv3;
}

-(UIScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView=[[UIScrollView alloc] init];
        _scrollView.backgroundColor=[UIColor whiteColor];
    }
    return _scrollView;
}
@end
