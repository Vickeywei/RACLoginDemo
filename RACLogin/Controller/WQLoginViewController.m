//
//  WQLoginViewController.m
//  textRunloop
//
//  Created by 魏琦 on 16/7/3.
//  Copyright © 2016年 com.drcacom.com. All rights reserved.
//

#import "WQLoginViewController.h"
#import "WQLoginViewModelDemo.h"
#import "MBProgressHUD+WQTextHud.h"
#import <MBProgressHUD.h>
@interface WQLoginViewController ()



@end

@implementation WQLoginViewController
//storyBoard要重写initWithCoder方法
//纯代码的话要重写init方法
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        self.loginViewModel = [[WQLoginViewModelDemo  alloc] init];
        @weakify(self);
        [RACObserve(self.loginViewModel, status) subscribeNext:^(id x) {
             @strongify(self);
            WQLoginViewModelStatus status = [x integerValue];
            switch (status) {
                case WQLoginViewModelStatus_Doding: {
                    
                    [MBProgressHUD showText:@"正在登录,请稍候"
                                       icon:nil
                                       view:self.view
                                 afterDelay:0.5];
                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
                    });
                   
                    break;
                }
                case WQLoginViewModelStatus_Success: {
                    [MBProgressHUD hideHUDForView:self.view animated:YES];
                    [MBProgressHUD showText:@"登录成功"
                                       icon:nil
                                       view:self.view
                                 afterDelay:0.3];
                    
                    break;
                }
                case WQLoginViewModelStatus_Fail: {
                    [MBProgressHUD hideHUDForView:self.view animated:YES];
                    [MBProgressHUD showText:@"登录失败"
                                       icon:nil
                                       view:self.view
                                 afterDelay:0.3];

                    
                    break;
                }
            }
            
        }];
        
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    
    
    @weakify(self);
    [[self.loginView.regisButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        @strongify(self);
        NSLog(@"注册");
        
    }];
    
    [[self.loginView.fogotPasswordButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        NSLog(@"跳转到忘记密码界面");
    }];
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
