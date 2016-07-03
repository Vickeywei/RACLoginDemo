//
//  WQLoginViewModelDemo.m
//  textRunloop
//
//  Created by 魏琦 on 16/7/3.
//  Copyright © 2016年 com.drcacom.com. All rights reserved.
//

#import "WQLoginViewModelDemo.h"
#import <AFNetworking.h>
@implementation WQLoginViewModelDemo
- (RACSignal *)requestLoginSignal {
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
