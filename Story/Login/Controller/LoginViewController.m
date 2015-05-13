//
//  LoginViewController.m
//  Demo1
//
//  Created by account on 15/5/5.
//  Copyright (c) 2015年 zhuli8. All rights reserved.
//

#import "LoginViewController.h"
#import "ZLNavigationController.h"
#import "AFNetworking.h"
#import "AppConfig.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userNameTextFiled;
@property (weak, nonatomic) IBOutlet UITextField *pwdTextField;

@end

@implementation LoginViewController

#pragma mark -life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
//    [super touchesBegan:touches withEvent:event];
//    [self dismissViewControllerAnimated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark -event response
/**
 *  登陆
 */
- (IBAction)Login:(UIButton *)sender {
    AppLog(@"%p--%@,%@",ZLAppConfig,ZLAppConfig.serverUrl,ZLAppConfig.registerUrl);
    
    AppConfig *config1=[[AppConfig alloc]init];
    AppLog(@"%p--%@,%@",config1,config1.serverUrl,config1.registerUrl);
    
//    //1.请求管理者
//    AFHTTPRequestOperationManager *mgr=[AFHTTPRequestOperationManager manager];
//    
//    //2.拼接请求参数
//    // 2.拼接请求参数
//    //HWAccount *account = [HWAccountTool account];
//    NSMutableDictionary *params = [NSMutableDictionary dictionary];
//    //params[@"access_token"] = account.access_token;
//    //params[@"uid"] = account.uid;

    
//    //3.发送请求
//    [mgr GET:@"https://rm.api.weibo.com/2/remind/unread_count.json" parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSString *status=responseObject[@"status"];
//        ZLLog(@"%@",status);
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        ZLLog(@"请求失败");
//    }];
//
//    [mgr POST:@"https://api.weibo.com/2/statuses/update.json" parameters:params success:^(AFHTTPRequestOperation *operation, NSDictionary *responseObject) {
//        [MBProgressHUD showSuccess:@"发送成功"];
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        [MBProgressHUD showError:@"发送失败"];
//    }];
//    
//    [mgr POST:@"https://upload.api.weibo.com/2/statuses/upload.json" parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
//        // 拼接文件数据
//        UIImage *image = [self.photosView.photos firstObject];
//        NSData *data = UIImageJPEGRepresentation(image, 1.0);
//        [formData appendPartWithFileData:data name:@"pic" fileName:@"test.jpg" mimeType:@"image/jpeg"];
//    } success:^(AFHTTPRequestOperation *operation, NSDictionary *responseObject) {
//        [MBProgressHUD showSuccess:@"发送成功"];
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        [MBProgressHUD showError:@"发送失败"];
//    }];

    
    UIStoryboard *story=[UIStoryboard storyboardWithName:@"Profile" bundle:nil];
    ZLNavigationController *navigationController=[story instantiateInitialViewController];

    [self presentViewController:navigationController animated:YES completion:nil];
    AppLog(@"LoginButton clicked");
}


@end
