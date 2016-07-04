//
//  WQRegisDemoViewModel.m
//  RACLogin
//
//  Created by 魏琦 on 16/7/4.
//  Copyright © 2016年 com.drcacom.com. All rights reserved.
//

#import "WQRegisDemoViewModel.h"
#import <AFNetworking.h>
@implementation WQRegisDemoViewModel
- (RACSignal *)requestSecurityCode {
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        [manager GET:@"https://api.douban.com/v2/book/search" parameters:@{@"123456":@"123456"} success:^(AFHTTPRequestOperation * _Nonnull operation, NSDictionary * _Nonnull responseObject) {
            // 请求成功的时候调用
            [subscriber sendNext:responseObject];
            [subscriber sendCompleted];
        } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
            [subscriber sendError:error];
        }];
        return [RACDisposable disposableWithBlock:^{
            NSLog(@"信号被销毁");
        }];
    }];
}

-(RACSignal *)requestRegisSignal {
        return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
            AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
            [manager GET:@"https://api.douban.com/v2/book/search" parameters:@{@"123456":@"123456"} success:^(AFHTTPRequestOperation * _Nonnull operation, NSDictionary * _Nonnull responseObject) {
                // 请求成功的时候调用
                [subscriber sendNext:responseObject];
                [subscriber sendCompleted];
            } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
                [subscriber sendError:error];
            }];
            return [RACDisposable disposableWithBlock:^{
                NSLog(@"信号被销毁");
            }];
        }];
}
@end
