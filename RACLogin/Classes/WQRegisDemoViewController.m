//
//  WQRegisDemoViewController.m
//  RACLogin
//
//  Created by 魏琦 on 16/7/4.
//  Copyright © 2016年 com.drcacom.com. All rights reserved.
//

#import "WQRegisDemoViewController.h"
#import "WQRegisDemoViewModel.h"
#import "MBProgressHUD+WQTextHud.h"
#import <MBProgressHUD.h>
@implementation WQRegisDemoViewController
- (instancetype)init {
    if (self = [super init]) {
        self.regisViewModel = [[WQRegisDemoViewModel alloc] init];
        @weakify(self);
        [RACObserve(self.regisViewModel, status) subscribeNext:^(id x) {
            @strongify(self);
            WQRegisViewModelStatus status = [x integerValue];
            switch (status) {
                case WQRegisViewModelStatus_Doding: {
                    
                    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
                    
                    
                    break;
                }
                case WQRegisViewModelStatus_Success: {
                    [MBProgressHUD hideHUDForView:self.view animated:YES];
                    [MBProgressHUD showImages:nil view:self.view text:@"登录成功"];
                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                        [MBProgressHUD hudHideForView:self.view];
                    });
                    
                    //
                    
                    break;
                }
                case WQRegisViewModelStatus_Fail: {
                    [MBProgressHUD hideHUDForView:self.view animated:YES];
                    [MBProgressHUD showImages:nil view:self.view text:@"登录失败"];
                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                        [MBProgressHUD hudHideForView:self.view];
                    });
                    //
                    
                    
                    
                    break;
                }
            }
            
        }];
    }
    return self;
    
}
@end
